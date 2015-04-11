package com.xthena.core.hibernate;

import java.io.Serializable;

import java.sql.Connection;

import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.naming.NamingException;
import javax.naming.Reference;

import org.hibernate.Cache;
import org.hibernate.CustomEntityDirtinessStrategy;
import org.hibernate.EntityNameResolver;
import org.hibernate.HibernateException;
import org.hibernate.Interceptor;
import org.hibernate.MappingException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SessionFactoryObserver;
import org.hibernate.StatelessSession;
import org.hibernate.StatelessSessionBuilder;
import org.hibernate.TypeHelper;

import org.hibernate.cache.spi.QueryCache;
import org.hibernate.cache.spi.Region;
import org.hibernate.cache.spi.UpdateTimestampsCache;

import org.hibernate.cfg.Settings;

import org.hibernate.context.spi.CurrentTenantIdentifierResolver;

import org.hibernate.dialect.Dialect;
import org.hibernate.dialect.function.SQLFunctionRegistry;

import org.hibernate.engine.ResultSetMappingDefinition;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.engine.jdbc.spi.JdbcServices;
import org.hibernate.engine.jdbc.spi.SqlExceptionHelper;
import org.hibernate.engine.profile.FetchProfile;
import org.hibernate.engine.query.spi.QueryPlanCache;
import org.hibernate.engine.spi.FilterDefinition;
import org.hibernate.engine.spi.NamedQueryDefinition;
import org.hibernate.engine.spi.NamedSQLQueryDefinition;
import org.hibernate.engine.spi.SessionBuilderImplementor;
import org.hibernate.engine.spi.SessionFactoryImplementor;

import org.hibernate.exception.spi.SQLExceptionConverter;

import org.hibernate.id.IdentifierGenerator;
import org.hibernate.id.factory.IdentifierGeneratorFactory;

import org.hibernate.internal.NamedQueryRepository;

import org.hibernate.metadata.ClassMetadata;
import org.hibernate.metadata.CollectionMetadata;

import org.hibernate.persister.collection.CollectionPersister;
import org.hibernate.persister.entity.EntityPersister;

import org.hibernate.proxy.EntityNotFoundDelegate;

import org.hibernate.service.spi.ServiceRegistryImplementor;

import org.hibernate.stat.Statistics;
import org.hibernate.stat.spi.StatisticsImplementor;

import org.hibernate.type.Type;
import org.hibernate.type.TypeResolver;

@SuppressWarnings("deprecation")
public class SessionFactoryWrapper implements SessionFactoryImplementor {
    private SessionFactoryImplementor sessionFactoryImplementor;
    private SpringSessionContext springSessionContext;

    public SessionFactoryWrapper() {
        springSessionContext = new SpringSessionContext(this);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        if (sessionFactory instanceof SessionFactoryImplementor) {
            this.sessionFactoryImplementor = (SessionFactoryImplementor) sessionFactory;
        } else {
            throw new IllegalStateException("the type of sessionFactory["
                    + sessionFactory + "] is not SessionFactoryImplementor");
        }
    }

    // ~ ======================================================================
    @Override
	public SessionFactoryOptions getSessionFactoryOptions() {
        return sessionFactoryImplementor.getSessionFactoryOptions();
    }

    @Override
	public Session openSession() throws HibernateException {
        return sessionFactoryImplementor.openSession();
    }

    /**
     * 为了解决OpenSessionOnView注册SessionFactory引用的问题，从context中获得当前session. 之前是通过
     * <code>sessionFactory.getCurrentSession()</code>直接获得
     */
    @Override
	public Session getCurrentSession() throws HibernateException {
        return springSessionContext.currentSession();
    }

    @Override
	public StatelessSessionBuilder withStatelessOptions() {
        return sessionFactoryImplementor.withStatelessOptions();
    }

    @Override
	public StatelessSession openStatelessSession() {
        return sessionFactoryImplementor.openStatelessSession();
    }

    @Override
	public StatelessSession openStatelessSession(Connection connection) {
        return sessionFactoryImplementor.openStatelessSession(connection);
    }

    @Override
	public ClassMetadata getClassMetadata(Class entityClass) {
        return sessionFactoryImplementor.getClassMetadata(entityClass);
    }

    @Override
	public ClassMetadata getClassMetadata(String entityName) {
        return sessionFactoryImplementor.getClassMetadata(entityName);
    }

    @Override
	public CollectionMetadata getCollectionMetadata(String roleName) {
        return sessionFactoryImplementor.getCollectionMetadata(roleName);
    }

    @Override
	public Map<String, ClassMetadata> getAllClassMetadata() {
        return sessionFactoryImplementor.getAllClassMetadata();
    }

    @Override
	public Map getAllCollectionMetadata() {
        return sessionFactoryImplementor.getAllCollectionMetadata();
    }

    /**
     * 此处需要进行封装，如果sessionFactory没有构建成功，就自己新建. 否则应该使用<code>sessionFactory.getStatistics()</code>
     */
    @Override
	public Statistics getStatistics() {
        return new StatisticsWrapper();
    }

    @Override
	public void close() throws HibernateException {
        sessionFactoryImplementor.close();
    }

    @Override
	public boolean isClosed() {
        return sessionFactoryImplementor.isClosed();
    }

    @Override
	public Cache getCache() {
        return sessionFactoryImplementor.getCache();
    }

    @Override
	public void evict(Class persistentClass) throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evict(Class persistentClass, Serializable id)
            throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evictEntity(String entityName) throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evictEntity(String entityName, Serializable id)
            throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evictCollection(String roleName) throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evictCollection(String roleName, Serializable id)
            throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evictQueries(String cacheRegion) throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public void evictQueries() throws HibernateException {
        throw new UnsupportedOperationException();
    }

    @Override
	public Set getDefinedFilterNames() {
        return sessionFactoryImplementor.getDefinedFilterNames();
    }

    @Override
	public FilterDefinition getFilterDefinition(String filterName)
            throws HibernateException {
        return sessionFactoryImplementor.getFilterDefinition(filterName);
    }

    @Override
	public boolean containsFetchProfileDefinition(String name) {
        return sessionFactoryImplementor.containsFetchProfileDefinition(name);
    }

    @Override
	public TypeHelper getTypeHelper() {
        return sessionFactoryImplementor.getTypeHelper();
    }

    // ~ ======================================================================
    @Override
	public Reference getReference() throws NamingException {
        return sessionFactoryImplementor.getReference();
    }

    // ~ ======================================================================
    @Override
	public SessionBuilderImplementor withOptions() {
        return sessionFactoryImplementor.withOptions();
    }

    @Override
	public TypeResolver getTypeResolver() {
        return sessionFactoryImplementor.getTypeResolver();
    }

    @Override
	public Properties getProperties() {
        return sessionFactoryImplementor.getProperties();
    }

    @Override
	public EntityPersister getEntityPersister(String entityName)
            throws MappingException {
        return sessionFactoryImplementor.getEntityPersister(entityName);
    }

    @Override
	public Map<String, EntityPersister> getEntityPersisters() {
        return sessionFactoryImplementor.getEntityPersisters();
    }

    @Override
	public CollectionPersister getCollectionPersister(String role)
            throws MappingException {
        return sessionFactoryImplementor.getCollectionPersister(role);
    }

    @Override
	public Map<String, CollectionPersister> getCollectionPersisters() {
        return sessionFactoryImplementor.getCollectionPersisters();
    }

    @Override
	public JdbcServices getJdbcServices() {
        return sessionFactoryImplementor.getJdbcServices();
    }

    @Override
	public Dialect getDialect() {
        return sessionFactoryImplementor.getDialect();
    }

    @Override
	public Interceptor getInterceptor() {
        return sessionFactoryImplementor.getInterceptor();
    }

    @Override
	public QueryPlanCache getQueryPlanCache() {
        return sessionFactoryImplementor.getQueryPlanCache();
    }

    @Override
	public Type[] getReturnTypes(String queryString) throws HibernateException {
        return sessionFactoryImplementor.getReturnTypes(queryString);
    }

    @Override
	public String[] getReturnAliases(String queryString)
            throws HibernateException {
        return sessionFactoryImplementor.getReturnAliases(queryString);
    }

    @Override
	public ConnectionProvider getConnectionProvider() {
        return sessionFactoryImplementor.getConnectionProvider();
    }

    @Override
	public String[] getImplementors(String className) throws MappingException {
        return sessionFactoryImplementor.getImplementors(className);
    }

    @Override
	public String getImportedClassName(String name) {
        return sessionFactoryImplementor.getImportedClassName(name);
    }

    @Override
	public QueryCache getQueryCache() {
        return sessionFactoryImplementor.getQueryCache();
    }

    @Override
	public QueryCache getQueryCache(String regionName)
            throws HibernateException {
        return sessionFactoryImplementor.getQueryCache(regionName);
    }

    @Override
	public UpdateTimestampsCache getUpdateTimestampsCache() {
        return sessionFactoryImplementor.getUpdateTimestampsCache();
    }

    @Override
	public StatisticsImplementor getStatisticsImplementor() {
        return sessionFactoryImplementor.getStatisticsImplementor();
    }

    @Override
	public NamedQueryDefinition getNamedQuery(String queryName) {
        return sessionFactoryImplementor.getNamedQuery(queryName);
    }

    @Override
	public NamedSQLQueryDefinition getNamedSQLQuery(String queryName) {
        return sessionFactoryImplementor.getNamedSQLQuery(queryName);
    }

    @Override
	public ResultSetMappingDefinition getResultSetMapping(String name) {
        return sessionFactoryImplementor.getResultSetMapping(name);
    }

    @Override
	public IdentifierGenerator getIdentifierGenerator(String rootEntityName) {
        return sessionFactoryImplementor.getIdentifierGenerator(rootEntityName);
    }

    @Override
	public Region getSecondLevelCacheRegion(String regionName) {
        return sessionFactoryImplementor.getSecondLevelCacheRegion(regionName);
    }

    @Override
	public Region getNaturalIdCacheRegion(String regionName) {
        return sessionFactoryImplementor.getNaturalIdCacheRegion(regionName);
    }

    @Override
	public Map getAllSecondLevelCacheRegions() {
        return sessionFactoryImplementor.getAllSecondLevelCacheRegions();
    }

    @Override
	public SQLExceptionConverter getSQLExceptionConverter() {
        return sessionFactoryImplementor.getSQLExceptionConverter();
    }

    @Override
	public SqlExceptionHelper getSQLExceptionHelper() {
        return sessionFactoryImplementor.getSQLExceptionHelper();
    }

    @Override
	public Settings getSettings() {
        return sessionFactoryImplementor.getSettings();
    }

    @Override
	public Session openTemporarySession() throws HibernateException {
        return sessionFactoryImplementor.openTemporarySession();
    }

    @Override
	public Set<String> getCollectionRolesByEntityParticipant(String entityName) {
        return sessionFactoryImplementor
                .getCollectionRolesByEntityParticipant(entityName);
    }

    @Override
	public EntityNotFoundDelegate getEntityNotFoundDelegate() {
        return sessionFactoryImplementor.getEntityNotFoundDelegate();
    }

    @Override
	public SQLFunctionRegistry getSqlFunctionRegistry() {
        return sessionFactoryImplementor.getSqlFunctionRegistry();
    }

    @Override
	public FetchProfile getFetchProfile(String name) {
        return sessionFactoryImplementor.getFetchProfile(name);
    }

    @Override
	public ServiceRegistryImplementor getServiceRegistry() {
        return sessionFactoryImplementor.getServiceRegistry();
    }

    @Override
	public void addObserver(SessionFactoryObserver observer) {
        sessionFactoryImplementor.addObserver(observer);
    }

    @Override
	public CustomEntityDirtinessStrategy getCustomEntityDirtinessStrategy() {
        return sessionFactoryImplementor.getCustomEntityDirtinessStrategy();
    }

    @Override
	public CurrentTenantIdentifierResolver getCurrentTenantIdentifierResolver() {
        return sessionFactoryImplementor.getCurrentTenantIdentifierResolver();
    }

    // ~ ======================================================================
    @Override
	public IdentifierGeneratorFactory getIdentifierGeneratorFactory() {
        return sessionFactoryImplementor.getIdentifierGeneratorFactory();
    }

    @Override
	public Type getIdentifierType(String className) throws MappingException {
        return sessionFactoryImplementor.getIdentifierType(className);
    }

    @Override
	public String getIdentifierPropertyName(String className)
            throws MappingException {
        return sessionFactoryImplementor.getIdentifierPropertyName(className);
    }

    @Override
	public Type getReferencedPropertyType(String className, String propertyName)
            throws MappingException {
        return sessionFactoryImplementor.getReferencedPropertyType(className,
                propertyName);
    }

    @Override
	public NamedQueryRepository getNamedQueryRepository() {
        return sessionFactoryImplementor.getNamedQueryRepository();
    }

    @Override
	public Iterable<EntityNameResolver> iterateEntityNameResolvers() {
        return sessionFactoryImplementor.iterateEntityNameResolvers();
    }

    @Override
	public void registerNamedSQLQueryDefinition(String name,
            NamedSQLQueryDefinition definition) {
        sessionFactoryImplementor.registerNamedSQLQueryDefinition(name,
                definition);
    }

    @Override
	public void registerNamedQueryDefinition(String name,
            NamedQueryDefinition definition) {
        sessionFactoryImplementor
                .registerNamedQueryDefinition(name, definition);
    }
}
