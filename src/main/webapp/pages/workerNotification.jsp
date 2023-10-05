<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.needstobedone.model.User"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.needstobedone.model.AllModal"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WorkerNotification</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/assets/images/barLogo.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/ownerhome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/workerNotification.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Barlow:wght@400;700&family=Outfit:wght@300&family=Roboto+Mono:ital,wght@0,300;1,300&family=Roboto+Slab:wght@300&family=Space+Mono:wght@700&display=swap"
	rel="stylesheet">
<link rel="icon"
	href="<%=request.getContextPath()%>/assets/images/barLogo.png"
	type="image/x-icon">
</head>

<body>
	<script src="<%=request.getContextPath()%>/assets/JS/index.js"></script>

	<header>
		<div>
			<img
				src="<%=request.getContextPath()%>/assets/images/logo-transparent-svg.svg"
				alt="Logo">
		</div>
		<nav>
			<div>
				<a href="<%=request.getContextPath()%>/home"><span>Home</span></a> <a><span>Notification</span></a>
				<a href="<%=request.getContextPath()%>/index.jsp"
					style="background-color: #c84449;"><span>LogOut</span></a>
			</div>
		</nav>
	</header>
	<main>
		<section>
			<div class="notificationEntire">
				<div class="notificationTop">
					<div class="profile">
						<img
							src="<%=request.getContextPath()%>/assets/images/avatar (3).svg"
							alt="image" />
						<p class="user_name">
							<%=((User) session.getAttribute("user")).getFirstName()%>
						</p>
					</div>
					<div class="types">
						<div class="ftrbtn">
							<a id="ftrbtn">Filter</a>
						</div>
						<select name="" id="filter" class="filter">
							<option value="All">All</option>
							<option value="NotActioned">NotActioned</option>
							<option value="Rejected">Rejected</option>
							<option value="Approved">Approved</option>
							<option value="Started">Started</option>
						</select>
					</div>
				</div>
				<div class="notificationList">
					<c:forEach var="modal" items="${notifications}">
						<div class="notificationCard">
							<div class="notificationContent">
								<b>From:</b> ${modal.user.firstName} ${modal.user.lastName}
							</div>
							<div class="notificationContent">
								<b>Job:</b> ${modal.job.title}
							</div>
							<div class="notificationContent">
								<b>Email: </b>${modal.user.email}</div>


							<c:choose>
								<c:when test="${sessionScope.user.isOwner}">
									<div class="buttons">
										<c:choose>
											<c:when test="${modal.notification.status eq 'Not Actioned'}">
												<button class="acceptBtn"
													onclick="approveJobRequest('${modal.notification.notificationId}')">Approve</button>
												<button class="rejectBtn"
													onclick="rejectJobRequest('${modal.notification.notificationId}')">Reject</button>
											</c:when>

											<c:when test="${modal.notification.status eq 'Completed' }">
												<div class="notificationStatus">Status:
													${modal.notification.status}</div>
												<button class="applyBtn"
													onclick="createPayment('${modal.notification.notificationId}')">Pay</button>
											</c:when>

											<c:when test="${modal.notification.status eq 'Paid'}">
												<div class="notificationStatus">Status:
													${modal.notification.status}</div>
											</c:when>
											<c:when test="${modal.notification.status eq 'Rejected'}">
												<div class="notificationStatus">Status:
													${modal.notification.status}</div>
											</c:when>
											<c:otherwise>
												<button class="acceptBtn">Approved</button>
											</c:otherwise>
										</c:choose>
									</div>
								</c:when>
								<c:otherwise>

									<div class="notificationStatus">Status:
										${modal.notification.status}</div>
									<c:choose>

										<c:when test="${modal.notification.status eq 'Approved'}">
											<button class="acceptBtn"
												onclick="completeJobRequest('${modal.notification.notificationId}')">Completed</button>
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose>

						</div>
					</c:forEach>

				</div>
			</div>
		</section>
	</main>
</body>
<script>
function approveJobRequest(notificationId) {
    let notificationData = {
        notificationId: notificationId,
        updateMessage: "Approved" 
    };

    fetch('<%=request.getContextPath()%>/UpdateNotificationServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(notificationData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Job approved successfully!');
            window.location.reload();

        } else {
            alert('Job application failed. Please try again.');

        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');

    });

}


function rejectJobRequest(notificationId) {
    let notificationData = {
        notificationId: notificationId,  
        updateMessage: "Rejected"  
    };

    fetch('<%=request.getContextPath()%>/UpdateNotificationServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(notificationData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Job rejected successfully!');
            window.location.reload();

        } else {
            alert('Job application failed. Please try again.');
        }
        
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });

}


function completeJobRequest(notificationId) {
    let notificationData = {
        notificationId: notificationId,  
        updateMessage: "Completed" 
    };

    fetch('<%=request.getContextPath()%>/UpdateNotificationServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(notificationData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Job completed successfully!');
            window.location.reload();
        } else {
            alert('Job application failed. Please try again.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });

}


function createPayment(notificationId){
	

    let span = document.getElementsByClassName("close");
    let notificationList = document.querySelector(".notificationList");
    notificationList.innerHTML = `<div id="paymentModal" class="modal">
    
		<div class="modal-content">
			<span class="close" onclick="closePaymentModal()">&times;</span>
		<div>Get the payment details using Email or if you are paid click the paid button to mark the job as paid</div>
			<button  id="paid">Paid</button>
			<button onclick="closePaymentModal()">Cancel</button>
		</div>
	</div>`;
	
	const paid = document.getElementById('paid');

	paid.addEventListener('click', function() {
		console.log("Paid");
	    console.log(notificationId);
	    console.log(parseInt(notificationId));
	    let notificationData = {
	        notificationId: parseInt(notificationId), 
	        updateMessage: "Paid" 
	    };

	    fetch('<%=request.getContextPath()%>/UpdateNotificationServlet', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(notificationData)
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            alert('Amount paid successfully!');
	            window.location.reload();

	        } else {
	            alert('payment failed. Please try again.');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('An error occurred. Please try again.');
	    });
	});
    
    let modal = document.getElementById("paymentModal");

    modal.style.display = "block";
    
    span.onclick = function() {
        modal.style.display = "none";
    }
	
}


function closePaymentModal() {
    var modal = document.getElementById("paymentModal");
    modal.style.display = "none";
    window.location.reload();
}


</script>

</html>
