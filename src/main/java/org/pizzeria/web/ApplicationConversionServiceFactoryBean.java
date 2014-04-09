package org.pizzeria.web;

import org.pizzeria.domain.PizzeriaTable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

	public Converter<PizzeriaTable, String> getPizzeriaTableToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.PizzeriaTable, java.lang.String>() {
            public String convert(PizzeriaTable pizzeriaTable) {
                return new StringBuilder().append(pizzeriaTable.getName()).append(" (").append(pizzeriaTable.getSeats()).append(" couverts, ")
                		.append(pizzeriaTable.getTableState()).append(")").toString();
            }
        };
    }
}
