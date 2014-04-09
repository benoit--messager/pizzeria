package org.pizzeria.web;
import org.pizzeria.domain.products.CustomProduct;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/customproducts")
@Controller
@RooWebScaffold(path = "customproducts", formBackingObject = CustomProduct.class)
public class CustomProductController {
}
