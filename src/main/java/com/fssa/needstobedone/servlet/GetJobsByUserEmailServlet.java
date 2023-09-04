package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.needstobedone.exception.ServiceException;
import com.fssa.needstobedone.model.Job;
import com.fssa.needstobedone.services.JobService;

/**
 * Servlet implementation class GetJobsByUserEmailServlet
 */
@WebServlet("/home")
public class GetJobsByUserEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		JobService jobService = new JobService();
		try {
			List<Job> results = jobService.listJobsByEmail(loggedInEmail);
			System.out.println(results);
			request.setAttribute("jobs", results);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
