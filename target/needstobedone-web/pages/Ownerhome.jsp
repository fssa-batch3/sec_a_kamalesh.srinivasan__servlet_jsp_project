<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.fssa.needstobedone.model.Job"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Owner Home</title>
<link rel="stylesheet" href="../assets/css/ownerhome.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Barlow:wght@400;700&family=Outfit:wght@300&family=Roboto+Mono:ital,wght@0,300;1,300&family=Roboto+Slab:wght@300&family=Space+Mono:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="icon" href="../assets/images/barLogo.png" type="image/x-icon">


</head>


<body>
	<script src="../assets/JS/index.js"></script>
	<script src="../assets/JS/ownerHome.js"></script>

	<header>
		<div>
			<img src="../assets/images/logo-transparent-svg.svg" alt="Logo">
		</div>
		<%
		List<Job> jobs = (List<Job>) request.getAttribute("jobs");
		if (jobs != null) {
			for (Job item : jobs) {
				out.println(item);
			}
		}
		%>
		<nav>
			<div>
				<a><span>Home</span></a> <a onclick="chatRD()"> <span>Chat</span>
				</a> <a onclick="OWnotification()"><span>Notification</span></a> <a
					onclick="rdToPayment()"><span>Payment</span></a> <a
					onclick="urlDataProfile()"><span>profile</span></a> <a id="logout"
					href="request.getContextPath()+index.jsp"><span>LogOut</span></a>
			</div>
		</nav>
	</header>

	<main>
		<section>
			<div class="discoverJobs">
				<h2>Discover Jobs</h2>
				<div class="finds">
					<div class="left_discover">
						<input type="text" id="earch" /> <i class="fa fa-search"
							style="font-size: 35px; color: rgb(220, 204, 204)"
							onclick="searchJob()"></i> <i class="fa fa-plus" id="plusIcon"
							onclick="openCreateJob()">Create Job</i>


					</div>

					<div class="rightDiscover">
						<i class="fa fa-filter"></i> <select name="Filter" id="filter">
							<option value="Recent Jobs">Recent Jobs</option>
							<option value="Pendig Jobs">Pending Jobs</option>

						</select>
					</div>

				</div>
			</div>
		</section>

		<section class="cards"></section>



		<section class="form">
			<div class="blur"></div>
			<form id="form"
				action="<%=request.getContextPath()%>/CreateJobServlet"
				method="post">

				<h2>Upload your Requirement</h2>
				<div class="datas">
					<div>
						<input type="text" name="title" id="title"
							placeholder="Title of the job" value="Full Stack developer"
							required /><BR> <input type="text" name="location"
							id="location" placeholder="Location" value="Chennai" required /><br>
						<input type="number" name="Salary" id="Salary"
							placeholder="Salary" value="1000000" required /><br> <input
							type="text" id="disc" name="disc" placeholder="Description"
							maxlength="110"
							value="A full stack developer is a versatile professional who works on both the front-end and back-end aspects of web development."
							required /><br>

						<textarea name="summary" id="summary" placeholder="Summary"
							required>Developing and maintaining web applications from concept to deployment.Designing and implementing user interfaces using HTML, CSS, and JavaScript frameworks.Building and integrating back-end services and APIs using server-side languages such as Python, Java, Ruby, or Node.js.Developing and maintaining databases, including data modeling, querying, and optimization.Collaborating with designers, project managers, and other stakeholders to gather requirements and ensure smooth project execution.Writing clean, efficient, and maintainable code following coding standards and best practices.Conducting testing and debugging to identify and fix issues or bugs.Deploying and configuring applications on web servers and cloud platforms.Ensuring applications are secure, scalable, and optimized for performance.Staying up-to-date with emerging technologies and industry trends to suggest improvements and innovative solutions.</textarea>
					</div>

					<div>
						<textarea name="Qualifications" id="Qualifications"
							placeholder="Qualifications" required>Proficiency in front-end technologies such as HTML, CSS, JavaScript, and modern frameworks like React, Angular, or Vue Strong knowledge of server-side languages and frameworks such as Python/Django, Java/Spring, Ruby/Ruby on Rails, or Node.js/Express.js.
Experience working with databases such as MySQL, PostgreSQL, MongoDB, or Oracle.Familiarity with version control systems like Git and collaborative development workflows.Knowledge of web servers and cloud platforms for deployment, such as AWS, Azure, or Google Cloud.Understanding of RESTful APIs, microservices architecture, and client-server communication.Strong problem-solving skills and ability to handle the full software development cycle.Excellent communication and collaboration skills to work effectively in a team environment.Continuous learning mindset and willingness to adapt to new technologies and tools.</textarea>
						<textarea name="Responsibilities" id="Responsibilities"
							placeholder="Responsibilities" required>Developing and maintaining web applications from concept to deployment.Designing and implementing user interfaces using HTML, CSS, and JavaScript frameworks.Building and integrating back-end services and APIs using server-side languages such as Python, Java, Ruby, or Node.js.Developing and maintaining databases, including data modeling, querying, and optimization.Collaborating with designers, project managers, and other stakeholders to gather requirements and ensure smooth project execution.Writing clean, efficient, and maintainable code following coding standards and best practices.Conducting testing and debugging to identify and fix issues or bugs.Deploying and configuring applications on web servers and cloud platforms.Ensuring applications are secure, scalable, and optimized for performance.Staying up-to-date with emerging technologies and industry trends to suggest improvements and innovative solutions.</textarea>
						<br>
					</div>
				</div>
				<div class="formButttons">
					<div id="closeCreateJob" onclick="closeCreateJob()">Cancel</div>
					<button type="submit">Add</button>
				</div>
			</form>
		</section>






	</main>

</body>

</html>