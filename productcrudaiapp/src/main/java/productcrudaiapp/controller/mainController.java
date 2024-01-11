package productcrudaiapp.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import productcrudaiapp.dao.productDao;
import productcrudaiapp.model.Product;

@Controller
public class mainController {
	
	
	@Autowired
	private productDao productDao;
	

//	SHOW HOME PAGE
	@RequestMapping("/")
	public String home(Model m) {
		
		List<Product> products  = productDao.getAllProductss();
		
		m.addAttribute("products",products);
		
		return "index";
	}
	
	
//	SHOW ADD PRODUCT FORM
	@RequestMapping("/add-product")
	public String addProduct(Model m) {
		
		m.addAttribute("title","add-product");
		return "add_product_form";
	}
	
	
//	handle add product form
	@RequestMapping(value="/handle-product", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product,HttpServletRequest request) {
		
		System.out.println(product);
		
		this.productDao.createProduct(product);
		
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		
		return redirectView; 
	}
	
//	delete handler
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId, HttpServletRequest request) {
		
		this.productDao.deleteProduct(productId);
		
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		
		return redirectView;
	}
	
	@RequestMapping("/update/{productId}")
	public String updateForm(@PathVariable("productId") int pId, Model m) {
		
		Product product = this.productDao.getProduct(pId);
		
		m.addAttribute("product",product);
		
		
		return "update_form";
	}
}
