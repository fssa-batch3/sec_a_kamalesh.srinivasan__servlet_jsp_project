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
import com.fssa.needstobedone.model.User;
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
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String salaryStr = request.getParameter("Salary");
		int salary = Integer.parseInt(salaryStr);
		String description = request.getParameter("disc");
		String summary = request.getParameter("summary");
		String qualifications = request.getParameter("Qualifications");
		String responsibilities = request.getParameter("Responsibilities");

		Job job = new Job(title, location, salary, description, summary, qualifications, responsibilities, userId);
		JobService jobService = new JobService();
	
		try {
			jobService.createJob(job);
			response.sendRedirect("home");
			System.out.println("job Created");
		} catch (ServiceException e) {
			out.println(e.getMessage());
		}
	}
}
