package com.learn.mycart.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;


@MultipartConfig
public class ProductOpeationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			String op = request.getParameter("operation");
			if (op.trim().equals("addcategory")) {

				// addcategory

				String title = request.getParameter("catTitle");
				String discription = request.getParameter("catDescription");

				Category category = new Category();

				category.setCategoryTitle(title);
				category.setCategoryDescription(discription);

				// category Obj Save to db

				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "category Added Successfuly:" + catId);
				response.sendRedirect("admin.jsp");

			} else if (op.trim().equals("addProduct")) {
				// addprduct

				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuntity = Integer.parseInt(request.getParameter("pQuntity"));
				int cId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");

				Product p = new Product();

				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuntity);
				p.setpPhoto(part.getSubmittedFileName());

				// get category by Id

				CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdoa.getCategoryById(cId);

				p.setCategory(category);

				// product save
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				Boolean pId = productDao.saveProduct(p);

				/*
				 * // Product save ProductDao pdao = new
				 * ProductDao(FactoryProvider.getFactory()); pdao.saveProduct(p);
				 */
				// Product image upload save

				// Find out the path to upload Photo 
				try {
					String path = request.getRealPath("img") + java.io.File.separator + "Products" + java.io.File.separator+part.getSubmittedFileName();
					System.out.println(path);
					
					//uploading code
					FileOutputStream fos=new FileOutputStream(path);
					InputStream fis=part.getInputStream();  				//[FileInputStream fis= new FileInputStream(part.getInputStream());]
								
					// Reading data
					byte [] data = new byte [ fis.available() ] ;
					fis.read(data);
					
					
					//writing Data
					fos.write(data);
					fos.close();
					
					
				}catch (Exception e) {
				 e.printStackTrace();	// TODO: handle exception
				}
			
				out.println("Product Save success ");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product Added Successfuly:"+pId);
				response.sendRedirect("admin.jsp");
				
				return;

			}

		}

	}
}
