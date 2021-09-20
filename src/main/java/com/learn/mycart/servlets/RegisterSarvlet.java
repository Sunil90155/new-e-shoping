package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;



		
		public class RegisterSarvlet extends HttpServlet {
			private static final long serialVersionUID = 1L;
	
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
				response.setContentType("text/html;charset=UTF-8");
				try(PrintWriter out=response.getWriter())
				{
					
					try {
						
						String userName=request.getParameter("user_name");
						String userEmail=request.getParameter("user_email");
						String userPassword=request.getParameter("user_password");
						String userPhone=request.getParameter("user_phone");
						String userAddress=request.getParameter("user_address");
						
						//validation
						
						if (userName.isEmpty()) 
						{
							
							out.println("name is blank");
							return;
							
						}
						//creating user object to store data
							
							 User user=new User( userName, userEmail,  userPassword,  userPhone,"default.jpg", userAddress,"default");
							 Session hibernateSession=FactoryProvider.getFactory().openSession();
							 Transaction tx=hibernateSession.beginTransaction();
							 
							 
							 
							 tx.commit();
							 int userId= (int)hibernateSession.save(user);
							 hibernateSession.close();
							 
							 HttpSession httpSession=request.getSession();
							 httpSession.setAttribute("message", "Registration Successful UserId:"+userId);
							 response.sendRedirect("register.jsp");
							 return;
						
					} catch (Exception e) {

					e.printStackTrace();
					}
					
					
				}
			
			
			}

		}

	
	


