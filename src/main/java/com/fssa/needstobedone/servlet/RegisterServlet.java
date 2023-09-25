package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println(email);
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		boolean isOwner = false;
		if (request.getParameter("isOwner") != null && request.getParameter("isOwner").equals("on")) {
			isOwner = true;
		}
		PrintWriter out = response.getWriter();
		User user1 = new User(email, password, firstName, lastName, isOwner);
		UserService userService = new UserService();
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		session.setAttribute("user", user1);
		try {
			userService.registerUser(user1);
			dispatcher = request.getRequestDispatcher("home");
		} catch (ServiceException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			dispatcher = request.getRequestDispatcher("/register.jsp?error="+e.getMessage());
		}

		dispatcher.forward(request, response);
	}

}
