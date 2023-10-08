<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.needstobedone.model.Job"%>
<%@page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WorkerHome</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/workerHome.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="icon"
	href="<%=request.getContextPath()%>/assets/images/barLogo.png"
	type="image/x-icon">


<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Barlow:wght@400;700&family=Outfit:wght@300&family=Roboto+Mono:ital,wght@0,300;1,300&family=Roboto+Slab:wght@300&family=Space+Mono:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* Add your CSS styles here */
.card {
	border: 1px solid #ccc;
	padding: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.card h3 {
	margin-bottom: 10px;
	color: #333;
}

.card p {
	margin-bottom: 10px;
	color: #666;
}

.apply-button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #3498db;
	color: white;
	cursor: pointer;
}

.apply-button:hover {
	background-color: #2980b9;
}
</style>
</head>

<body>
	<script src="<%request.getContextPath();%>/assets/JS/index.js"></script>
	<%

	%>
	<header>
		<div>
			<img
				src="<%=request.getContextPath()%>/assets/images/logo-transparent-svg.svg"
				alt="Logo" />
		</div>

		<nav>
			<div>
				<a><span>Home</span></a> <a
					href="<%=request.getContextPath()%>/ListNotifications"> <span>Notification</span></a>
				<a href="<%=request.getContextPath()%>/LogoutServlet"
					style="background-color: #c84449;"><span>LogOut</span></a>
			</div>
		</nav>
	</header>
	<section class="filter"></section>
	<main>
		<div class="left">

			<section class="yourJobs">
				<div class="topYourJobs">
					<h2>Your Jobs</h2>

					<div class="jobSearch">
						<input type="text" id="jobSearch" /> <i class="fa fa-search"
							style="font-size: 35px; color: rgb(220, 204, 204)"
							onclick="jobSearch()"></i>
					</div>
				</div>
				<div class="cards">
					<%
					List<Job> jobs = (List<Job>) request.getAttribute("jobs");
					if (jobs != null) {
						for (Job item : jobs) {
							if (item.getStatus().equals("Not started")) {
					%>


					<div class="card">
						<h3><%=item.getTitle()%></h3>
						<p>
							<strong>Location:</strong>
							<%=item.getLocation()%></p>
						<p>
							<strong>Description:</strong>
							<%=item.getDescription()%></p>
						<p>
							<strong>Salary:</strong> RS.<%=item.getPrice()%>

						</p>
						<button class="apply-button"
							onclick="applyJob('<%=item.getJobid()%>')">Apply</button>
					</div>
					<%
					}
					}
					} else {
					%>
					<div class="card">
						<h3>No Jobs Found</h3>

					</div>
					<%
					}
					%>
				</div>
			</section>

		</div>




	</main>
	<footer>
		<div>
			<div class="logo">
				<img
					src="<%=request.getContextPath()%>/assets/images/logo-transparent-svg.svg"
					alt="Logo" />
			</div>
		</div>

		<div class="Registered_Users">
			<p>
				64,653,006<br> Registered Users
			</p>
		</div>

		<div class="Total_Jobs_Posted">

			<p>
				22,357,427<br> Total Jobs Posted
			</p>
		</div>

		<div class="last">
			<p>Apps</p>
			<div class="apps">
				<img
					src="<%=request.getContextPath()%>/assets/images/icons8-instagram.svg"
					alt="instagram" /> <img
					src="<%=request.getContextPath()%>/assets/images/icons8-facebook.svg"
					alt="facebook" /> <img
					src="<%=request.getContextPath()%>/assets/images/icons8-youtube.svg"
					alt="youtube" />

			</div>
		</div>
	</footer>

	<section>
		<div class="Copyright">NeedsToBeDone ® is a registered Trademark
			of NTBD Technology Pvt Limited. Copyright © 2023 NTBD Technology Pvt
			Limited.</div>
	</section>
</body>
<script>
function applyJob(jobId) {
    let notificationData = {
        jobId: jobId
    };

    fetch('<%=request.getContextPath()%>/CreateNotificationServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(notificationData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Job application successful!');
        } else {
            alert('Job application failed. Please try again.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });
}
</script>

</html>