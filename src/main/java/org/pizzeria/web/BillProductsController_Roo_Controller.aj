// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pizzeria.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.pizzeria.domain.Bill;
import org.pizzeria.domain.products.BillProducts;
import org.pizzeria.domain.products.Product;
import org.pizzeria.web.BillProductsController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BillProductsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BillProductsController.create(@Valid BillProducts billProducts, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, billProducts);
            return "billproductses/create";
        }
        uiModel.asMap().clear();
        billProducts.persist();
        return "redirect:/billproductses/" + encodeUrlPathSegment(billProducts.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BillProductsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new BillProducts());
        return "billproductses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BillProductsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("billproducts", BillProducts.findBillProducts(id));
        uiModel.addAttribute("itemId", id);
        return "billproductses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BillProductsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("billproductses", BillProducts.findBillProductsEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) BillProducts.countBillProductses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("billproductses", BillProducts.findAllBillProductses(sortFieldName, sortOrder));
        }
        return "billproductses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BillProductsController.update(@Valid BillProducts billProducts, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, billProducts);
            return "billproductses/update";
        }
        uiModel.asMap().clear();
        billProducts.merge();
        return "redirect:/billproductses/" + encodeUrlPathSegment(billProducts.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BillProductsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, BillProducts.findBillProducts(id));
        return "billproductses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BillProductsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        BillProducts billProducts = BillProducts.findBillProducts(id);
        billProducts.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/billproductses";
    }
    
    void BillProductsController.populateEditForm(Model uiModel, BillProducts billProducts) {
        uiModel.addAttribute("billProducts", billProducts);
        uiModel.addAttribute("bills", Bill.findAllBills());
        uiModel.addAttribute("products", Product.findAllProducts());
    }
    
    String BillProductsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
