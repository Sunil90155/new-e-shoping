package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Product;

public class ProductDao {

	private SessionFactory factory;
	
	public ProductDao ( SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		
		boolean f = false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx = session.beginTransaction();
				
			session.save(product);
			tx.commit();
			session.close();
			
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		
		return f;
	}
	
	/* get all product */
		public List<Product> getAllProducts()
		{
			Session s=this.factory.openSession();
			Query	q=s.createQuery("from Product");
			 List<Product> list  =q.list();
			 return list;
		}

		
	/* get all product of given category*/
		public List<Product> getAllProductById(int cid)
		{
			Session session=this.factory.openSession();
			Query	query=session.createQuery("from Product as product where product.category.categoryId =: id "); // ISME  = KE BAD : NAHI LAGA THA ISLIYE DELT NHI HO RAHRA THA 
			 query.setParameter("id", cid);
			 List<Product> list  =query.list();
			 return list;
		 
			
			
			
		}
	
	
}

