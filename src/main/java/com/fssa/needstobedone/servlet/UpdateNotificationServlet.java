package com.fssa.needstobedone.servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.fssa.needstobedone.exception.ServiceException;
import com.fssa.needstobedone.model.Job;
import com.fssa.needstobedone.model.Notification;
import com.fssa.needstobedone.model.User;
import com.fssa.needstobedone.services.JobService;
import com.fssa.needstobedone.services.NotificationService;

/**
 * Servlet implementation class UpdateNotificationServlet
 */
@WebServlet("/UpdateNotificationServlet")
public class UpdateNotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 		BufferedReader reader = request.getReader();
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			stringBuilder.append(line);
		}
		String jsonString = stringBuilder.toString();
		JSONObject jsonObject = new JSONObject(jsonString);
 		int notificationId = jsonObject.getInt("notificationId");
		String message = jsonObject.getString("updateMessage");
 		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
 		Notification notification = new Notification();
		notification.setNotificationId(notificationId);
		notification.setStatus(message);
		String jobId = null;
		if (message.equals("Approved")) {
			try {
				NotificationService notificationService = new NotificationService();
				Notification n1 = notificationService.getNotificationsById(notificationId);
				jobId = n1.getJobId();
				System.out.println(jobId);
				JobService jobService = new JobService();
				Job job = jobService.listJobsByJobId(jobId);
				job.setStatus("Started");
 			} catch (ServiceException e) {
				e.printStackTrace();
			}

//        	JobService jobService = new JobService();
//        	jobService.updateJobs(); 
		}
		boolean notificationCreated = false;
		NotificationService notificationService = new NotificationService();
		try {
			System.out.println(notificationService.updateNotification(notification));
			notificationCreated = notificationService.updateNotification(notification);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
//		 Send a response back to the client
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if (notificationCreated) {
			response.getWriter().write("{\"success\": true}");
		} else {
			response.getWriter().write("{\"success\": false}");
		}
	}

}
