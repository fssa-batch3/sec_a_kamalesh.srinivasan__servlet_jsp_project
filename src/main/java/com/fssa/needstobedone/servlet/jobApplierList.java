package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.needstobedone.exception.ServiceException;
import com.fssa.needstobedone.model.AllModal;
import com.fssa.needstobedone.services.JobService;

/**
 * Servlet implementation class jobApplierList
 */
@WebServlet("/jobApplierList")
public class jobApplierList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		JobService jobService = new JobService();
		try {
			List<AllModal> list = (List<AllModal>) jobService.jobStatusList(id);
			JSONArray listArray = new JSONArray(list);
		    out.println(listArray.toString());
			out.flush();
			out.close();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		}


}
