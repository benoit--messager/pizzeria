package org.pizzeria.domain.users;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class User {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String login;

    /**
     */
    @NotNull
    @Size(min = 2)
    private String password;

    /**
     */
    @NotNull
    @Size(min = 2)
    private transient String confirmPassword;

    /**
     */
    @ManyToOne
    private Profile profile;
}
