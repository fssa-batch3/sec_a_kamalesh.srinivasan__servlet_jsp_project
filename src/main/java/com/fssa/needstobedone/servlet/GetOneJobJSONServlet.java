package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.needstobedone.model.Job;

/**
 * Servlet implementation class GetOneJobJSON
 */
@WebServlet("/GetOneJobJSONServlet")
public class GetOneJobJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Job job = new Job("kamal", 1000, "kamalesh@gmail.com");
		JSONObject accountJson = new JSONObject(job);
		PrintWriter out = response.getWriter();
		out.println(accountJson.toString());
		out.flush();
	}

}
