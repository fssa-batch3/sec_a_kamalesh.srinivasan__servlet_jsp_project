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
 * Servlet implementation class GetAllJobsJSONServlet
 */
@WebServlet("/GetAllJobsJSONServlet")
public class GetAllJobsJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Job> accounts = new ArrayList<Job>();

		accounts.add(new Job("kamal", 1000, "kamalesh@gamil.com"));
		accounts.add(new Job("Ram", 2000, "ram@gmail.com"));
		accounts.add(new Job("Dhivya", 3000, "dhivya@gmail.com"));
		request.setAttribute("JOB_LIST", accounts);
		JSONArray accountsJSonArray = new JSONArray(accounts);
		PrintWriter out = response.getWriter();
		out.println(accountsJSonArray.toString());
		out.flush();
	}

}
