package org.pizzeria.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import org.pizzeria.domain.products.BillProducts;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Bill {

    /**
     */
    @NotNull
    @ManyToOne
    private PizzeriaTable pizzeriaTable;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "bill")
    private Set<BillProducts> billProducts = new HashSet<BillProducts>();
}
