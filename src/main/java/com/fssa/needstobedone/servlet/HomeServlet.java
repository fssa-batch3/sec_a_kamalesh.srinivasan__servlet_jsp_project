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
import com.fssa.needstobedone.model.User;
import com.fssa.needstobedone.services.JobService;

/**
 * Servlet implementation class GetJobsByUserEmailServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 		doGet(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			JobService jobService = new JobService();
			try {
				if (user.getisOwner()) {
					List<Job> results = jobService.listJobsByUserId(Integer.toString(user.getUserId()));
					request.setAttribute("jobs", results);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Ownerhome.jsp");
					dispatcher.forward(request, response);
				} else {
					List<Job> results = jobService.listAllJobs();
					request.setAttribute("jobs", results);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/workerHome.jsp");
					dispatcher.forward(request, response);
				}
			} catch (ServiceException e) {
				String errorPage;
				if (user.getisOwner()) {
					errorPage = "pages/Ownerhome.jsp?error=" + e.getMessage();
				} else {
					errorPage = "pages/workerHome.jsp?error=" + e.getMessage();
				}
				response.sendRedirect(request.getContextPath() + "/" + errorPage);
				e.printStackTrace();
			}
		}else {
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

}
