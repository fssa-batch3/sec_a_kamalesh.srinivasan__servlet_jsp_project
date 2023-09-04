package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.needstobedone.model.User;
import com.fssa.needstobedone.services.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		boolean isOwner = Boolean.parseBoolean(request.getParameter("isOwner"));
		String DOB = request.getParameter("DOB");
		long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
		long aadhar = Long.parseLong(request.getParameter("aadhar"));
		System.out.println(aadhar);

		String address = request.getParameter("address");
		LocalDate date = LocalDate.parse(DOB);
		PrintWriter out = response.getWriter();

		User user1 = new User(email, password, firstName, lastName, isOwner, phoneNumber, date, aadhar, address);
		UserService userService = new UserService();

		try {
			if (userService.registerUser(user1)) {
				out.println("Registration successful");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("register.jsp?error="+e.getMessage());
			out.println(e.getMessage());

		}

	}

}
