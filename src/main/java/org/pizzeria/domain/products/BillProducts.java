package org.pizzeria.domain.products;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ManyToOne;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.pizzeria.domain.Bill;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import antlr.StringUtils;


@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class BillProducts {
	private static final Logger log = Logger.getLogger(BillProducts.class);

    /**
     */
    @ManyToOne
    private Product product;

    /**
     */
    @ManyToOne
    private Bill bill;

    /**
     */
    @NotNull
    private int productCount;
    
	public static BillProducts findBillProductsByBillAndProduct(Long bill, Long product) {
        if (bill == null) throw new IllegalArgumentException("The bill argument is required");
        EntityManager em = BillProducts.entityManager();
        TypedQuery<BillProducts> q = em.createQuery("SELECT o FROM BillProducts AS o WHERE o.bill.id = :bill and o.product.id = :product", BillProducts.class);
        q.setParameter("bill", bill);
        q.setParameter("product", product);
        
        List<BillProducts> billProducts = q.getResultList();
        
        if (CollectionUtils.isEmpty(billProducts)) {
        	return null;
        } else {
        	return billProducts.get(0);
        }
    }	
}
