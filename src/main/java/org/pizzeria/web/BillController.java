package org.pizzeria.web;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.pizzeria.domain.Bill;
import org.pizzeria.domain.TableState;
import org.pizzeria.domain.products.BillProducts;
import org.pizzeria.domain.products.Product;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/bills")
@Controller
@RooWebScaffold(path = "bills", formBackingObject = Bill.class)
public class BillController {
	@RequestMapping(value="/addProduct", method = RequestMethod.GET, produces = "text/html")
	public String update(Model uiModel, HttpServletRequest httpServletRequest, @RequestParam Long billId, @RequestParam Long productId) {
		BillProducts billProducts = BillProducts.findBillProductsByBillAndProduct(billId, productId);
		
		if (null != billProducts) {
			billProducts = BillProducts.findBillProductsByBillAndProduct(billId, productId);
			billProducts.setProductCount(billProducts.getProductCount() + 1);
			billProducts.flush();
		} else {
			billProducts = new BillProducts();
			billProducts.setBill(Bill.findBill(billId));
			billProducts.setProduct(Product.findProduct(productId));
			billProducts.setProductCount(1);
			billProducts.persist();
		}
		
		uiModel.addAttribute("message", "Product added");

		return "redirect:/bills/" + encodeUrlPathSegment(String.valueOf(billId), httpServletRequest);
	}	

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Bill.findBill(id));
        uiModel.addAttribute("products", Product.findAllProducts());
        return "bills/update";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
		Bill bill = Bill.findBill(id);
        uiModel.addAttribute("bill", Bill.findBill(id));
        uiModel.addAttribute("itemId", id);
        
        Set<BillProducts> billProducts = bill.getBillProducts();
        List<BillLine> billLines = new ArrayList<>();
        
        float total = 0;
        for (BillProducts billProduct : billProducts) {
        	BillLine line = new BillLine();
        	line.setItem(billProduct.getProduct().getName());
        	line.setCount(billProduct.getProductCount());
        	line.setSingleCost(billProduct.getProduct().getPrice());
        	line.setTotal(line.getCount() * line.getSingleCost());
        	billLines.add(line);
        	total += line.getTotal();
		}
        uiModel.addAttribute("billLines", billLines);
        
        computeTaxes(uiModel, total);
        
        uiModel.addAttribute("products", Product.findAllProducts());
        
        return "bills/show";
    }
	
	private void computeTaxes(Model uiModel, float  total) {
        double taxAmount = (total * 5.5)/100;
        uiModel.addAttribute("totalHT", total - taxAmount);
        uiModel.addAttribute("totalTT", total);
        uiModel.addAttribute("taxAmount", taxAmount);
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Bill bill, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, bill);
            return "bills/create";
        }
        uiModel.asMap().clear();
        bill.persist();
        
        bill.getPizzeriaTable().setTableState(TableState.Busy);
        bill.getPizzeriaTable().flush();
        
        return "redirect:/bills/" + encodeUrlPathSegment(bill.getId().toString(), httpServletRequest);
    }
}
