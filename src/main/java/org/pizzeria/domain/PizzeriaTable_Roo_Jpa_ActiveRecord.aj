// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pizzeria.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.pizzeria.domain.PizzeriaTable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PizzeriaTable_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PizzeriaTable.entityManager;
    
    public static final List<String> PizzeriaTable.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "seats", "tableState");
    
    public static final EntityManager PizzeriaTable.entityManager() {
        EntityManager em = new PizzeriaTable().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PizzeriaTable.countPizzeriaTables() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PizzeriaTable o", Long.class).getSingleResult();
    }
    
    public static List<PizzeriaTable> PizzeriaTable.findAllPizzeriaTables() {
        return entityManager().createQuery("SELECT o FROM PizzeriaTable o", PizzeriaTable.class).getResultList();
    }
    
    public static List<PizzeriaTable> PizzeriaTable.findAllPizzeriaTables(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PizzeriaTable o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PizzeriaTable.class).getResultList();
    }
    
    public static PizzeriaTable PizzeriaTable.findPizzeriaTable(Long id) {
        if (id == null) return null;
        return entityManager().find(PizzeriaTable.class, id);
    }
    
    public static List<PizzeriaTable> PizzeriaTable.findPizzeriaTableEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PizzeriaTable o", PizzeriaTable.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PizzeriaTable> PizzeriaTable.findPizzeriaTableEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PizzeriaTable o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PizzeriaTable.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PizzeriaTable.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PizzeriaTable.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PizzeriaTable attached = PizzeriaTable.findPizzeriaTable(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PizzeriaTable.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PizzeriaTable.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PizzeriaTable PizzeriaTable.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PizzeriaTable merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}