package com.banksystem.api.domain.model;

import java.util.List;

/**
 * Paged fetch: at most PAGE_SIZE rows per request; a full page means more
 * may exist. (The legacy server used 20 via lastRecCount; the revamp
 * standardises on 10 per page.)
 */
public record PagedResult<T>(List<T> rows, boolean hasMore) {

    public static final int PAGE_SIZE = 10;

    public static <T> PagedResult<T> page(List<T> all, int page) {
        int from = Math.min(page * PAGE_SIZE, all.size());
        int to = Math.min(from + PAGE_SIZE, all.size());
        return new PagedResult<>(all.subList(from, to), to < all.size());
    }
}
