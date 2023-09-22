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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/ownerhome.css">
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
	<script src="<%=request.getContextPath()%>/assets/JS/index.js"></script>
	<script src="<%=request.getContextPath()%>/assets/JS/ownerHome.js"></script>
	<header>
		<div>
			<img
				src="<%=request.getContextPath()%>/assets/images/logo-transparent-svg.svg"
				alt="Logo">
		</div>

		<nav>
			<div>
				<a><span>Home</span></a> <a
					href="<%=request.getContextPath()%>/ListNotifications"><span>Notification</span></a>
				<a id="logout" href="<%=request.getContextPath()%>/LogoutServlet""><span>LogOut</span></a>
			</div>
		</nav>
	</header>

	<main>
		<section>
			<div class="discoverJobs">
				<h2>Discover Jobs</h2>
				<div class="finds">
					<div class="left_discover">
						<i class="fa fa-plus" id="plusIcon" onclick="openCreateJob()">Create
							Job</i>


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

		<section class="cards">
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
				<button class="apply-button">Detail</button>
			</div>
			<%
			}
			}
			} else {
			%>
			<div class="card">
				<h3>Jobs Not Created</h3>
			</div>
			<%
			}
			%>
		</section>



		<section class="form">
			<div class="blur"></div>
			<form id="form"
				action="<%=request.getContextPath()%>/CreateJobServlet"
				method="post">

				<h2>Upload your Requirement</h2>

				<div class="datas">
					<div>
						<input type="text" name="title" id="title"
							placeholder="Title of the job" pattern="[a-zA-Z\s]+" required />
						<br> <input type="text" name="location" id="location"
							placeholder="Location" pattern="[a-zA-Z\s]+" required /> <br>
						<input type="number" name="Salary" id="Salary"
							placeholder="Salary" pattern="[1-9]\d*" required /> <br> <input
							type="text" id="disc" name="disc" placeholder="Description"
							value="you will be responsible for installing, repairing, and maintaining plumbing systems in residential."
							required maxlength="110" /> <br>

						<textarea name="summary" id="summary" placeholder="Summary"
							required>We are seeking a skilled and experienced plumber to join our team. The ideal candidate should have a strong knowledge of plumbing systems, excellent problem-solving skills, and the ability to work independently. You should be detail-oriented, customer-focused, and committed to delivering high-quality plumbing services.</textarea>
					</div>

					<div>
						<textarea name="Qualifications" id="Qualifications"
							placeholder="Qualifications" required>High school diploma or equivalent.
Completion of a plumbing apprenticeship program or relevant vocational training.
State-issued plumbing license (required).
Strong knowledge of plumbing systems, tools, and equipment.
Excellent problem-solving and troubleshooting skills.
Attention to detail and accuracy.
Good communication and customer service skills.
Physical stamina and the ability to work in various environments.
Valid driver's license (may be required for some positions).</textarea>
						<textarea name="Responsibilities" id="Responsibilities"
							placeholder="Responsibilities" required>Install, repair, and maintain plumbing systems, including pipes, fixtures, and appliances.
Inspect plumbing systems and identify issues or potential problems.
Diagnose and troubleshoot plumbing problems and provide effective solutions.
Collaborate with team members and communicate with clients to explain repairs and costs.
Ensure compliance with plumbing codes and safety regulations.
Perform routine maintenance on plumbing systems to prevent issues.
Keep accurate records of work performed, materials used, and time spent.
Maintain and clean tools and equipment.
Provide excellent customer service and maintain a professional demeanor.
Stay up-to-date with industry trends and advancements in plumbing technology.</textarea>
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

<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						const titleInput = document.getElementById("title");
						const locationInput = document
								.getElementById("location");
						const salaryInput = document.getElementById("Salary");
						const descriptionInput = document
								.getElementById("disc");
						const summaryInput = document.getElementById("summary");
						const qualificationsInput = document
								.getElementById("Qualifications");
						const responsibilitiesInput = document
								.getElementById("Responsibilities");

						titleInput.addEventListener("input", validateTitle);
						locationInput.addEventListener("input",
								validateLocation);
						salaryInput.addEventListener("input", validateSalary);
						descriptionInput.addEventListener("input",
								validateDescription);
						summaryInput.addEventListener("input", validateSummary);
						qualificationsInput.addEventListener("input",
								validateQualifications);
						responsibilitiesInput.addEventListener("input",
								validateResponsibilities);

						function validateTitle() {
							const titleValue = titleInput.value;
							if (titleValue.trim() === "") {
								titleInput
										.setCustomValidity("Title should not be empty");
							} else if (!titleValue.match(/[a-zA-Z\s]+/)) {
								titleInput
										.setCustomValidity("Title should contain only letters and spaces.");
							} else {
								titleInput.setCustomValidity("");
							}
						}

						function validateLocation() {
							const locationValue = locationInput.value;
							if (locationValue.trim() === "") {
								locationInput
										.setCustomValidity("Location should not be empty");
							} else if (!locationValue.match(/[a-zA-Z\s]+/)) {
								locationInput
										.setCustomValidity("Location should contain only letters and spaces.");
							} else {
								locationInput.setCustomValidity("");
							}
						}

						function validateSalary() {
							const salaryValue = salaryInput.value;
							if (!salaryValue.match(/^[1-9]\d*$/)) {
								salaryInput
										.setCustomValidity("Salary should be a positive number.");
							} else {
								salaryInput.setCustomValidity("");
							}
						}

						function validateDescription() {
							const descriptionValue = descriptionInput.value;
							if (descriptionValue.trim() === "") {
								descriptionInput
										.setCustomValidity("Description cannot be empty.");
							} else {
								descriptionInput.setCustomValidity("");
							}
						}

						function validateSummary() {
							const summaryValue = summaryInput.value;
							if (summaryValue.trim() === "") {
								summaryInput
										.setCustomValidity("Summary cannot be empty.");
							} else {
								summaryInput.setCustomValidity("");
							}
						}

						function validateQualifications() {
							const qualificationsValue = qualificationsInput.value;
							if (qualificationsValue.trim() === "") {
								qualificationsInput
										.setCustomValidity("Qualifications cannot be empty.");
							} else {
								qualificationsInput.setCustomValidity("");
							}
						}

						function validateResponsibilities() {
							const responsibilitiesValue = responsibilitiesInput.value;
							if (responsibilitiesValue.trim() === "") {
								responsibilitiesInput
										.setCustomValidity("Responsibilities cannot be empty.");
							} else {
								responsibilitiesInput.setCustomValidity("");
							}
						}
					});
</script>

</html>