package com.banksystem.api.infrastructure.language;

import com.banksystem.api.domain.model.UiLanguage;
import java.util.Locale;
import org.springframework.context.i18n.LocaleContext;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

/**
 * The {@link UiLanguage} of the request being served.
 *
 * <p>The browser announces it with {@code Accept-Language} (bank-ui sends the
 * header on every call from its locale store), Spring's
 * {@code AcceptHeaderLocaleResolver} parses it into the thread's locale
 * context, and this reads it back. Repositories inject this rather than taking
 * a language argument: the choice of name column is needed deep inside a dozen
 * queries but is not part of any of their contracts, and threading a parameter
 * through every signature to reach them would say otherwise.
 *
 * <p>Off a request — the reference-data pre-load runs on its own virtual
 * thread at startup — there is no locale bound and this answers ENGLISH, which
 * is the right default for a warm-up.
 */
@Component
public class RequestLanguage {

    public UiLanguage current() {
        // getLocaleContext(), not getLocale(): the latter falls back to the
        // JVM default when nothing is bound, so an API host whose default
        // locale happened to be Arabic would serve Arabic reference data to
        // the startup pre-load and to every unbound thread.
        LocaleContext context = LocaleContextHolder.getLocaleContext();
        Locale locale = context == null ? null : context.getLocale();
        return UiLanguage.of(locale);
    }
}
