package org.pizzeria.web;
import org.pizzeria.domain.PizzeriaTable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pizzeriatables")
@Controller
@RooWebScaffold(path = "pizzeriatables", formBackingObject = PizzeriaTable.class)
public class PizzeriaTableController {
}
