package com.fssa.needstobedone.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.needstobedone.exception.ServiceException;
import com.fssa.needstobedone.model.AllModal;
import com.fssa.needstobedone.model.User;
import com.fssa.needstobedone.services.NotificationService;

@WebServlet("/ListNotifications")
public class ListNotificationsServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		int applierId = user.getUserId(); 
 		try {
			NotificationService notificationService = new NotificationService();
			if(user.getisOwner()) {
 				List<AllModal> notifications = notificationService.getNotificationsByUserId(applierId);
				request.setAttribute("notifications", notifications);			
			}
			else {
				List<AllModal> notifications = notificationService.getNotificationsByApplierId(applierId);
				request.setAttribute("notifications", notifications);
				
			}
			// Set the notifications as an attribute in the request
			// Forward the request to the workerNotification.jsp
			request.getRequestDispatcher("/pages/workerNotification.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
}
