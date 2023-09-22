package com.fssa.needstobedone.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		UserService userService = new UserService();
		try {
			User gettedUser = userService.logInUser(user);
			System.out.println(gettedUser.getUserId());
			HttpSession session = request.getSession();
			session.setAttribute("user", gettedUser);
			session.setMaxInactiveInterval(24*60);
			RequestDispatcher dispatcher;
			dispatcher = request.getRequestDispatcher("home");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			System.out.println("error");
			response.sendRedirect("Signin.jsp?error=" + e.getMessage());
		}
	}
}
