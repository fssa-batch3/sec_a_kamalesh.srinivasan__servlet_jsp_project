package com.fssa.needstobedone.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.needstobedone.exception.ServiceException;
import com.fssa.needstobedone.model.Job;
import com.fssa.needstobedone.services.JobService;

/**
 * Servlet implementation class UpdateJobServlet
 */
@WebServlet("/UpdateJobServlet")
public class UpdateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String jobId = request.getParameter("jobId");
		JobService jobService = new JobService();

		try {
			Job job = jobService.listJobs(jobId);
			request.setAttribute("job", job);
			request.getRequestDispatcher("/updateJob.jsp").forward(request, response);

		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String jobId = request.getParameter("jobid");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		int p = Integer.parseInt(price);
		
		Job job = new Job(p,jobId,title);
        JobService jobService = new JobService();
		try {
			jobService.UpdateJobs(job);
		} catch (ServiceException e) {
			e.printStackTrace();
		}


		// Redirect to a confirmation page or back to the job listing page
		response.sendRedirect("home");
	}

}
