package org.pizzeria.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class PizzeriaTable {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    private int seats;

    /**
     */
    @NotNull
    @Enumerated
    private TableState tableState;

	@Override
	public String toString() {
		return name + " (" + seats + " couverts)";
	}
}
