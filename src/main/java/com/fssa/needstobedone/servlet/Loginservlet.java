package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.needstobedone.exception.ServiceException;
import com.fssa.needstobedone.model.User;
import com.fssa.needstobedone.services.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();

		try {
			userService.logInUser(user);
			HttpSession session = request.getSession();
			session.setAttribute("loggedInEmail", email);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("home");
			
//			dispatcher.forward(request, response);
			response.sendRedirect("home");
		} catch (ServiceException e) {
			response.sendRedirect("login.jsp?error="+e.getMessage());
			
		}

	}

}