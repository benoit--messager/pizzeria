// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pizzeria.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import org.pizzeria.domain.Bill;

privileged aspect Bill_Roo_Jpa_Entity {
    
    declare @type: Bill: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Bill.id;
    
    @Version
    @Column(name = "version")
    private Integer Bill.version;
    
    public Long Bill.getId() {
        return this.id;
    }
    
    public void Bill.setId(Long id) {
        this.id = id;
    }
    
    public Integer Bill.getVersion() {
        return this.version;
    }
    
    public void Bill.setVersion(Integer version) {
        this.version = version;
    }
    
}
