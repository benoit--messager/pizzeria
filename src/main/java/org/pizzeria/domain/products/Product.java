package org.pizzeria.domain.products;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Product {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    private float price;

    /**
     */
    @NotNull
    private float tva;
}
