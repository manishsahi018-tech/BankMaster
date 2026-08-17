package com.banksystem.api.infrastructure.persistence;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Profiles;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.type.classreading.CachingMetadataReaderFactory;

/**
 * Every domain repository must have an implementation under every deployment profile.
 *
 * <p>Written after shipping a MerchantRepository whose only implementation was
 * {@code @Profile("!denodo")}. MerchantService is an unconditional
 * {@code @Service} that constructor-injects it, so under {@code denodo} Spring
 * found no candidate and failed the ENTIRE application at startup — every
 * screen down, not just the merchant one. Mock-profile testing could never see
 * it, because under mock the bean is present.
 *
 * <p>Reflection over the bean definitions rather than a running context: the
 * denodo profile needs a live Denodo datasource to get as far as instantiating
 * anything, so a {@code @SpringBootTest} would fail on the driver long before
 * it reached the beans this is about.
 */
class RepositoryProfileCoverageTest {

    private static final String REPOSITORY_PACKAGE = "com.banksystem.api.domain.repository";
    private static final String IMPLEMENTATION_PACKAGE = "com.banksystem.api.infrastructure.persistence";

    /** The profile sets the application is actually deployed with. */
    private static final Map<String, Set<String>> DEPLOYMENTS = Map.of(
            "mock", Set.of(),
            "denodo", Set.of("denodo"),
            "denodo + db-userprofile", Set.of("denodo", "db-userprofile"));

    @Test
    void everyRepositoryHasAnImplementationUnderEveryDeploymentProfile() throws Exception {
        List<Class<?>> repositories = repositoryInterfaces();
        assertThat(repositories)
                .as("repository interfaces discovered — the scan itself must not silently find none")
                .isNotEmpty();

        List<String> gaps = new ArrayList<>();
        for (Class<?> repository : repositories) {
            List<Class<?>> implementations = implementationsOf(repository);
            DEPLOYMENTS.forEach((name, active) -> {
                if (implementations.stream().noneMatch(c -> isActive(c, active))) {
                    gaps.add(repository.getSimpleName() + " has no implementation under: " + name);
                }
            });
        }

        assertThat(gaps)
                .as("a repository with no implementation for a profile fails that profile's "
                        + "whole application context at startup, not just its own screen")
                .isEmpty();
    }

    /**
     * Whether Spring would register this component with those profiles active.
     *
     * <p>Delegates to Spring's own Profiles parser rather than matching strings:
     * the expressions in this codebase are not all simple names —
     * UserProfileRepository's implementations use {@code "!db-userprofile"} and
     * {@code "denodo & db-userprofile"}, a second axis with negation and
     * conjunction that a hand-rolled matcher gets wrong.
     */
    private static boolean isActive(Class<?> type, Set<String> activeProfiles) {
        Profile profile = type.getAnnotation(Profile.class);
        if (profile == null) {
            return true; // unconditional bean — active in every deployment
        }
        return Profiles.of(profile.value()).matches(activeProfiles::contains);
    }

    /**
     * A repository selected by a PROPERTY as well as a profile must have
     * exactly one active implementation whichever way that property is set.
     *
     * <p>The test above counts a {@code @ConditionalOnProperty} bean as active
     * unconditionally, because it only reads {@code @Profile}. That is fine for
     * "is there at least one?" but blind to the two ways a property switch
     * breaks: BOTH implementations matching (NoUniqueBeanDefinitionException) or
     * NEITHER (the startup failure this class exists to prevent), and it cannot
     * tell either from a correct setup. StatementRepository is the first
     * repository here selected that way — DB #3 is off by default and its
     * datasource is not even created then — so the gap is now real.
     */
    @Test
    void propertySwitchedRepositoriesHaveExactlyOneActiveImplementation() throws Exception {
        List<String> problems = new ArrayList<>();
        for (Class<?> repository : repositoryInterfaces()) {
            List<Class<?>> implementations = implementationsOf(repository);
            // Only repositories that actually use a property switch.
            Set<String> properties = new java.util.LinkedHashSet<>();
            for (Class<?> impl : implementations) {
                ConditionalOnProperty on = impl.getAnnotation(ConditionalOnProperty.class);
                if (on != null) {
                    properties.addAll(List.of(on.name()));
                }
            }
            for (String property : properties) {
                DEPLOYMENTS.forEach((deployment, active) -> {
                    for (String setting : List.of("true", "false", ABSENT)) {
                        long matches = implementations.stream()
                                .filter(c -> isActive(c, active))
                                .filter(c -> propertyMatches(c, property, setting))
                                .count();
                        if (matches != 1) {
                            problems.add("%s under [%s] with %s=%s has %d active implementations"
                                    .formatted(repository.getSimpleName(), deployment,
                                            property, setting, matches));
                        }
                    }
                });
            }
        }
        assertThat(problems)
                .as("exactly one implementation must win for every value of the switch")
                .isEmpty();
    }

    /** Stands for "the property is not set at all", where matchIfMissing decides. */
    private static final String ABSENT = "<absent>";

    /**
     * Whether Spring's OnPropertyCondition would match this bean for that
     * setting. Beans carrying no {@code @ConditionalOnProperty} always match —
     * they are the unconditional half of the pair.
     */
    private static boolean propertyMatches(Class<?> type, String property, String setting) {
        ConditionalOnProperty on = type.getAnnotation(ConditionalOnProperty.class);
        if (on == null || !List.of(on.name()).contains(property)) {
            return true;
        }
        // havingValue defaults to "" meaning "any value other than false".
        String required = on.havingValue().isEmpty() ? "true" : on.havingValue();
        return ABSENT.equals(setting) ? on.matchIfMissing() : required.equalsIgnoreCase(setting);
    }

    private static List<Class<?>> repositoryInterfaces() throws Exception {
        var resolver = new PathMatchingResourcePatternResolver();
        var factory = new CachingMetadataReaderFactory(resolver);
        List<Class<?>> found = new ArrayList<>();
        for (var resource : resolver.getResources(
                "classpath*:" + REPOSITORY_PACKAGE.replace('.', '/') + "/*.class")) {
            var metadata = factory.getMetadataReader(resource).getClassMetadata();
            if (!metadata.isInterface()) {
                continue;
            }
            found.add(Class.forName(metadata.getClassName()));
        }
        return found;
    }

    /**
     * Read the class files directly rather than via
     * ClassPathScanningCandidateComponentProvider: that applies the
     * Environment's own condition evaluation, so with no profile active it
     * filters out every {@code @Profile("denodo")} bean and would report the
     * whole codebase as missing its denodo half. Profile coverage is precisely
     * what this test measures, so it has to see beans Spring would currently
     * exclude.
     */
    private static List<Class<?>> implementationsOf(Class<?> repository) throws Exception {
        List<Class<?>> classes = new ArrayList<>();
        for (Class<?> candidate : implementationClasses()) {
            if (repository.isAssignableFrom(candidate)
                    && !candidate.isInterface()
                    && !java.lang.reflect.Modifier.isAbstract(candidate.getModifiers())) {
                classes.add(candidate);
            }
        }
        return classes;
    }

    private static List<Class<?>> implementationClasses() throws Exception {
        var resolver = new PathMatchingResourcePatternResolver();
        var factory = new CachingMetadataReaderFactory(resolver);
        List<Class<?>> found = new ArrayList<>();
        for (var resource : resolver.getResources(
                "classpath*:" + IMPLEMENTATION_PACKAGE.replace('.', '/') + "/**/*.class")) {
            String name = factory.getMetadataReader(resource).getClassMetadata().getClassName();
            if (name.contains("$")) {
                continue; // nested/synthetic types are never the bean
            }
            found.add(Class.forName(name));
        }
        return found;
    }
}
