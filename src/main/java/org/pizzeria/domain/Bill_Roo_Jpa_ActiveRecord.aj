// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pizzeria.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.pizzeria.domain.Bill;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Bill_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Bill.entityManager;
    
    public static final List<String> Bill.fieldNames4OrderClauseFilter = java.util.Arrays.asList("pizzeriaTable", "billProducts");
    
    public static final EntityManager Bill.entityManager() {
        EntityManager em = new Bill().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Bill.countBills() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Bill o", Long.class).getSingleResult();
    }
    
    public static List<Bill> Bill.findAllBills() {
        return entityManager().createQuery("SELECT o FROM Bill o", Bill.class).getResultList();
    }
    
    public static List<Bill> Bill.findAllBills(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Bill o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Bill.class).getResultList();
    }
    
    public static Bill Bill.findBill(Long id) {
        if (id == null) return null;
        return entityManager().find(Bill.class, id);
    }
    
    public static List<Bill> Bill.findBillEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Bill o", Bill.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Bill> Bill.findBillEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Bill o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Bill.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Bill.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Bill.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Bill attached = Bill.findBill(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Bill.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Bill.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Bill Bill.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Bill merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
