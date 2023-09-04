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
import com.fssa.needstobedone.model.Job;
import com.fssa.needstobedone.services.JobService;

/**
 * Servlet implementation class CreateJobServlet
 */
@WebServlet("/CreateJobServlet")
public class CreateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		String title = request.getParameter("title");
		String sentPrice = request.getParameter("price");
		int price = Integer.parseInt(sentPrice);

		Job job = new Job(title, price, loggedInEmail);
		JobService jobService = new JobService();
		try {
			jobService.createJob(job);
			response.sendRedirect("home");
		} catch (ServiceException e) {
			out.println(e.getMessage());
		}
	}

}
