package productcrudaiapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import productcrudaiapp.model.Product;

@Component
public class productDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void createProduct(Product product) {
		
		this.hibernateTemplate.saveOrUpdate(product);
		
	}
	
//	GET ALL PRODUCTS
	public List<Product> getAllProductss(){
		
		List<Product> product = this.hibernateTemplate.loadAll(Product.class);
		return product;
	}
	
//	DELETE
	@Transactional
	public void deleteProduct(int pId) {
		
		Product p = this.hibernateTemplate.load(Product.class,pId);
		this.hibernateTemplate.delete(p);
	}
	
//	SINGLE PRODUCT
	public Product getProduct(int pId) {
		
		return this.hibernateTemplate.get(Product.class,pId);
	}

}
