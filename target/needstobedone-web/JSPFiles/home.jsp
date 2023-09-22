<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.needstobedone.services.JobService"%>
<%@ page import="com.fssa.needstobedone.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	<title>Needs To Be Done</title>
	
	<style>
	body{
	overflow:hidden;
	}
	</style>

<script>
        function filterJobs() {
            const searchQuery = document.getElementById("searchQuery").value.toLowerCase();
            const jobList = document.getElementById("jobList");

            // Remove all existing job cards
            while (jobList.firstChild) {
                jobList.removeChild(jobList.firstChild);
            }

            // Rebuild job cards based on search
            <c:forEach items="${jobs}" var="job">
                if ("<c:out value="${job.title}" />".toLowerCase().includes(searchQuery)) {
                    const jobCard = document.createElement("div");
                    jobCard.classList.add("col-md-4", "mb-3");
                    jobCard.innerHTML = `
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title job-title"><c:out value="${job.title}"/></h5>
                                <p class="card-text">Price: Rs. <c:out value="${job.price}" /></p>
                                <a href="UpdateJobServlet?jobId=<c:out value='${job.jobid}'/>"
                                    class="btn btn-primary">Update</a>
                                <a href="DeleteJobServlet?jobId=<c:out value='${job.jobid}'/>"
                                    class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    `;
                    jobList.appendChild(jobCard);
                }
            </c:forEach>
        }
    </script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<c:set var="error" value="${param.error}" />

	<c:if test="${not empty error}">
		<h2>
			<c:out value="${error}" />
		</h2>
	</c:if>
	<!-- Search input -->
	<form id="searchForm">
		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="Search by title"
				id="searchQuery" onkeyup="filterJobs()">
		</div>
	</form>
	<%

	%>

	<!-- Job list -->
	<div id="jobList" class="row">
		<!-- Job cards will be dynamically added here -->
		<c:forEach items="${jobs}" var="job" >
			<div class="col-md-4 mb-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title job-title">
							<c:out value="${job.title}" />
						</h5>
						<p class="card-text">
							Price: Rs.  
							<c:out value="${job.price}" />
						</p>
						<a href="UpdateJobServlet?jobId=<c:out value='${job.jobid}'/>"
							class="btn btn-primary">Update</a> <a
							href="DeleteJobServlet?jobId=<c:out value='${job.jobid}'/>"
							class="btn btn-danger">Delete</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>