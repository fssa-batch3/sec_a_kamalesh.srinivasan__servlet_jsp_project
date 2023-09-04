package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.needstobedone.servlet.modal.User;

/**
 * Servlet implementation class GetAllUserServlet
 */
@WebServlet("/GetAllUserServlet")
public class GetAllUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<User> users = new ArrayList<User>();

		users.add(new User(1, "Bharath", "bharath@fssa.freshworks.com", "password123"));
		users.add(new User(2, "ram", "ram@fssa.freshworks.com", "ps322211"));
		users.add(new User(3, "Sridhivya", "sridhivya.freshworks.com", "sri@pass3"));
		// to print the details in HTML Tabular format. DO NOT print the passwords
		request.setAttribute("userlist", users);
		RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp");
		dispatcher.forward(request, response);
	}

}