// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pizzeria.web;

import org.pizzeria.domain.Bill;
import org.pizzeria.domain.PizzeriaTable;
import org.pizzeria.domain.products.BillProducts;
import org.pizzeria.domain.products.CustomProduct;
import org.pizzeria.domain.products.Product;
import org.pizzeria.domain.users.Profile;
import org.pizzeria.domain.users.User;
import org.pizzeria.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Bill, String> ApplicationConversionServiceFactoryBean.getBillToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.Bill, java.lang.String>() {
            public String convert(Bill bill) {
                return "(no displayable fields)";
            }
        };
    }
    
    public Converter<Long, Bill> ApplicationConversionServiceFactoryBean.getIdToBillConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.Bill>() {
            public org.pizzeria.domain.Bill convert(java.lang.Long id) {
                return Bill.findBill(id);
            }
        };
    }
    
    public Converter<String, Bill> ApplicationConversionServiceFactoryBean.getStringToBillConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.Bill>() {
            public org.pizzeria.domain.Bill convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Bill.class);
            }
        };
    }
    
    public Converter<Long, PizzeriaTable> ApplicationConversionServiceFactoryBean.getIdToPizzeriaTableConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.PizzeriaTable>() {
            public org.pizzeria.domain.PizzeriaTable convert(java.lang.Long id) {
                return PizzeriaTable.findPizzeriaTable(id);
            }
        };
    }
    
    public Converter<String, PizzeriaTable> ApplicationConversionServiceFactoryBean.getStringToPizzeriaTableConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.PizzeriaTable>() {
            public org.pizzeria.domain.PizzeriaTable convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PizzeriaTable.class);
            }
        };
    }
    
    public Converter<BillProducts, String> ApplicationConversionServiceFactoryBean.getBillProductsToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.products.BillProducts, java.lang.String>() {
            public String convert(BillProducts billProducts) {
                return new StringBuilder().append(billProducts.getProductCount()).toString();
            }
        };
    }
    
    public Converter<Long, BillProducts> ApplicationConversionServiceFactoryBean.getIdToBillProductsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.products.BillProducts>() {
            public org.pizzeria.domain.products.BillProducts convert(java.lang.Long id) {
                return BillProducts.findBillProducts(id);
            }
        };
    }
    
    public Converter<String, BillProducts> ApplicationConversionServiceFactoryBean.getStringToBillProductsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.products.BillProducts>() {
            public org.pizzeria.domain.products.BillProducts convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BillProducts.class);
            }
        };
    }
    
    public Converter<CustomProduct, String> ApplicationConversionServiceFactoryBean.getCustomProductToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.products.CustomProduct, java.lang.String>() {
            public String convert(CustomProduct customProduct) {
                return new StringBuilder().append(customProduct.getName()).append(' ').append(customProduct.getPrice()).append(' ').append(customProduct.getTva()).toString();
            }
        };
    }
    
    public Converter<Long, CustomProduct> ApplicationConversionServiceFactoryBean.getIdToCustomProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.products.CustomProduct>() {
            public org.pizzeria.domain.products.CustomProduct convert(java.lang.Long id) {
                return CustomProduct.findCustomProduct(id);
            }
        };
    }
    
    public Converter<String, CustomProduct> ApplicationConversionServiceFactoryBean.getStringToCustomProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.products.CustomProduct>() {
            public org.pizzeria.domain.products.CustomProduct convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), CustomProduct.class);
            }
        };
    }
    
    public Converter<Product, String> ApplicationConversionServiceFactoryBean.getProductToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.products.Product, java.lang.String>() {
            public String convert(Product product) {
                return new StringBuilder().append(product.getName()).append(' ').append(product.getPrice()).append(' ').append(product.getTva()).toString();
            }
        };
    }
    
    public Converter<Long, Product> ApplicationConversionServiceFactoryBean.getIdToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.products.Product>() {
            public org.pizzeria.domain.products.Product convert(java.lang.Long id) {
                return Product.findProduct(id);
            }
        };
    }
    
    public Converter<String, Product> ApplicationConversionServiceFactoryBean.getStringToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.products.Product>() {
            public org.pizzeria.domain.products.Product convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Product.class);
            }
        };
    }
    
    public Converter<Profile, String> ApplicationConversionServiceFactoryBean.getProfileToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.users.Profile, java.lang.String>() {
            public String convert(Profile profile) {
                return new StringBuilder().append(profile.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Profile> ApplicationConversionServiceFactoryBean.getIdToProfileConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.users.Profile>() {
            public org.pizzeria.domain.users.Profile convert(java.lang.Long id) {
                return Profile.findProfile(id);
            }
        };
    }
    
    public Converter<String, Profile> ApplicationConversionServiceFactoryBean.getStringToProfileConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.users.Profile>() {
            public org.pizzeria.domain.users.Profile convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Profile.class);
            }
        };
    }
    
    public Converter<User, String> ApplicationConversionServiceFactoryBean.getUserToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<org.pizzeria.domain.users.User, java.lang.String>() {
            public String convert(User user) {
                return new StringBuilder().append(user.getLogin()).append(' ').append(user.getPassword()).toString();
            }
        };
    }
    
    public Converter<Long, User> ApplicationConversionServiceFactoryBean.getIdToUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, org.pizzeria.domain.users.User>() {
            public org.pizzeria.domain.users.User convert(java.lang.Long id) {
                return User.findUser(id);
            }
        };
    }
    
    public Converter<String, User> ApplicationConversionServiceFactoryBean.getStringToUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, org.pizzeria.domain.users.User>() {
            public org.pizzeria.domain.users.User convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), User.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getBillToStringConverter());
        registry.addConverter(getIdToBillConverter());
        registry.addConverter(getStringToBillConverter());
        registry.addConverter(getPizzeriaTableToStringConverter());
        registry.addConverter(getIdToPizzeriaTableConverter());
        registry.addConverter(getStringToPizzeriaTableConverter());
        registry.addConverter(getBillProductsToStringConverter());
        registry.addConverter(getIdToBillProductsConverter());
        registry.addConverter(getStringToBillProductsConverter());
        registry.addConverter(getCustomProductToStringConverter());
        registry.addConverter(getIdToCustomProductConverter());
        registry.addConverter(getStringToCustomProductConverter());
        registry.addConverter(getProductToStringConverter());
        registry.addConverter(getIdToProductConverter());
        registry.addConverter(getStringToProductConverter());
        registry.addConverter(getProfileToStringConverter());
        registry.addConverter(getIdToProfileConverter());
        registry.addConverter(getStringToProfileConverter());
        registry.addConverter(getUserToStringConverter());
        registry.addConverter(getIdToUserConverter());
        registry.addConverter(getStringToUserConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}