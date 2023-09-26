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
import com.fssa.needstobedone.model.Notification;
import com.fssa.needstobedone.model.User;
import com.fssa.needstobedone.services.NotificationService;

/**
 * Servlet implementation class CreateNotificationServlet
 */
@WebServlet("/CreateNotificationServlet")
public class CreateNotificationServlet extends HttpServlet {
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
		String jobId = jsonObject.getString("jobId");
 		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
 		Notification notification = new Notification(user.getUserId(), jobId, "Not Actioned");
		boolean notificationCreated = false;
		NotificationService notificationService = new NotificationService();
		try {
			notificationCreated = notificationService.createNotification(notification);
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

//}
