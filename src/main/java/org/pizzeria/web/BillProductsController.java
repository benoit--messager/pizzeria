package org.pizzeria.web;
import org.pizzeria.domain.products.BillProducts;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/billproductses")
@Controller
@RooWebScaffold(path = "billproductses", formBackingObject = BillProducts.class)
public class BillProductsController {
}
