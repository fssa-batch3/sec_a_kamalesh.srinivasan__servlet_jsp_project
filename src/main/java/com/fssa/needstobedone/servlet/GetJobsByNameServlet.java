package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.needstobedone.model.Job;

/**
 * Servlet implementation class GetJobsByNameServlet
 */
@WebServlet("/GetJobsByNameServlet")
public class GetJobsByNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Job> jobs = new ArrayList<Job>();
		List<Job> filtered = new ArrayList<Job>();
		String name = request.getParameter("name");

		jobs.add(new Job("kamal", 1000, "kamalesh@gamil.com"));
		jobs.add(new Job("Ram", 2000, "ram@gmail.com"));
		jobs.add(new Job("Dhivya", 3000, "dhivya@gmail.com"));

		for (Job job : jobs) {

			if (job.getTitle().contains(name)) {

				filtered.add(job);
			}
		}

		JSONArray accountsJSonArray = new JSONArray(filtered);
		PrintWriter out = response.getWriter();
		out.println(accountsJSonArray.toString());
		out.flush();
	}

}
