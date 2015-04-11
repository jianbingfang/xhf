package com.xthena.core.hibernate;

import org.hibernate.stat.CollectionStatistics;
import org.hibernate.stat.EntityStatistics;
import org.hibernate.stat.NaturalIdCacheStatistics;
import org.hibernate.stat.QueryStatistics;
import org.hibernate.stat.SecondLevelCacheStatistics;
import org.hibernate.stat.Statistics;

public class StatisticsWrapper implements Statistics {
    @Override
	public void clear() {
    }

    @Override
	public EntityStatistics getEntityStatistics(String entityName) {
        return null;
    }

    @Override
	public CollectionStatistics getCollectionStatistics(String role) {
        return null;
    }

    @Override
	public SecondLevelCacheStatistics getSecondLevelCacheStatistics(
            String regionName) {
        return null;
    }

    @Override
	public NaturalIdCacheStatistics getNaturalIdCacheStatistics(
            String regionName) {
        return null;
    }

    @Override
	public QueryStatistics getQueryStatistics(String queryString) {
        return null;
    }

    @Override
	public long getEntityDeleteCount() {
        return 0;
    }

    @Override
	public long getEntityInsertCount() {
        return 0;
    }

    @Override
	public long getEntityLoadCount() {
        return 0;
    }

    @Override
	public long getEntityFetchCount() {
        return 0;
    }

    @Override
	public long getEntityUpdateCount() {
        return 0;
    }

    @Override
	public long getQueryExecutionCount() {
        return 0;
    }

    @Override
	public long getQueryExecutionMaxTime() {
        return 0;
    }

    @Override
	public String getQueryExecutionMaxTimeQueryString() {
        return null;
    }

    @Override
	public long getQueryCacheHitCount() {
        return 0;
    }

    @Override
	public long getQueryCacheMissCount() {
        return 0;
    }

    @Override
	public long getQueryCachePutCount() {
        return 0;
    }

    @Override
	public long getNaturalIdQueryExecutionCount() {
        return 0;
    }

    @Override
	public long getNaturalIdQueryExecutionMaxTime() {
        return 0;
    }

    @Override
	public String getNaturalIdQueryExecutionMaxTimeRegion() {
        return null;
    }

    @Override
	public long getNaturalIdCacheHitCount() {
        return 0;
    }

    @Override
	public long getNaturalIdCacheMissCount() {
        return 0;
    }

    @Override
	public long getNaturalIdCachePutCount() {
        return 0;
    }

    @Override
	public long getUpdateTimestampsCacheHitCount() {
        return 0;
    }

    @Override
	public long getUpdateTimestampsCacheMissCount() {
        return 0;
    }

    @Override
	public long getUpdateTimestampsCachePutCount() {
        return 0;
    }

    @Override
	public long getFlushCount() {
        return 0;
    }

    @Override
	public long getConnectCount() {
        return 0;
    }

    @Override
	public long getSecondLevelCacheHitCount() {
        return 0;
    }

    @Override
	public long getSecondLevelCacheMissCount() {
        return 0;
    }

    @Override
	public long getSecondLevelCachePutCount() {
        return 0;
    }

    @Override
	public long getSessionCloseCount() {
        return 0;
    }

    @Override
	public long getSessionOpenCount() {
        return 0;
    }

    @Override
	public long getCollectionLoadCount() {
        return 0;
    }

    @Override
	public long getCollectionFetchCount() {
        return 0;
    }

    @Override
	public long getCollectionUpdateCount() {
        return 0;
    }

    @Override
	public long getCollectionRemoveCount() {
        return 0;
    }

    @Override
	public long getCollectionRecreateCount() {
        return 0;
    }

    @Override
	public long getStartTime() {
        return 0;
    }

    @Override
	public void logSummary() {
    }

    @Override
	public boolean isStatisticsEnabled() {
        return false;
    }

    @Override
	public void setStatisticsEnabled(boolean b) {
    }

    @Override
	public String[] getQueries() {
        return null;
    }

    @Override
	public String[] getEntityNames() {
        return null;
    }

    @Override
	public String[] getCollectionRoleNames() {
        return null;
    }

    @Override
	public String[] getSecondLevelCacheRegionNames() {
        return null;
    }

    @Override
	public long getSuccessfulTransactionCount() {
        return 0;
    }

    @Override
	public long getTransactionCount() {
        return 0;
    }

    @Override
	public long getPrepareStatementCount() {
        return 0;
    }

    @Override
	public long getCloseStatementCount() {
        return 0;
    }

    @Override
	public long getOptimisticFailureCount() {
        return 0;
    }
}
