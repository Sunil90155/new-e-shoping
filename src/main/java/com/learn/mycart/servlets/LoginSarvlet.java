package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;



public class LoginSarvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginSarvlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			// coding area
			String Email = request.getParameter("email");
			String Password = request.getParameter("password");

			// Validation

			// authenticate

			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndUserPassword(Email, Password);
//				System.out.println(user);

			HttpSession httpSession = request.getSession();

			if (user == null) {

				// out.println("<h1>Invalid User Id and Password</h1>");
				httpSession.setAttribute("message", "Invalid User Id and Password try again");
				response.sendRedirect("login.jsp");
				return;
			} else {

				out.println("<h1>Welcome " + user.getUserName() + "</h1>");

				// login

				httpSession.setAttribute("current-user", user);

				if (user.getUserType().equals("admin")) {
					// admin:-admin.jsp
					response.sendRedirect("admin.jsp");

				}

				else if (user.getUserType().equals("normal")) {
					// normal:-normal.jsp
					response.sendRedirect("normal.jsp");

				} 				
				else {
					out.print("We have not identified User Type");
				}

			}

		}

	}

}
