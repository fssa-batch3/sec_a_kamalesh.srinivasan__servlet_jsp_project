<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Update Job</title>
</head>
<style>
.required {
	color: red;
	margin-left: 5px;
}
</style>
<body>
	<%
	String job = request.getParameter("job");
	String error = (String) request.getAttribute("error");
	%>
	<form action="UpdateJobServlet" method="post">
		<%
		if (error != null) {
		%>
		<div class="alert alert-danger" role="alert">

			<%=error%>
		</div>
		<%
		}
		%>
		<input type="hidden" name="jobid" value="${job.jobid}"
			autofocus="autofocus"> <label for="title">Title:<span
			class="required">*</span></label> <input type="text" id="title" name="title"
			value="${job.title}" required><br> <br> <label
			for="price">Price:<span class="required">*</span></label> <input
			type="number" id="price" name="price" min="1" value="${job.price}"
			required><br> <br> <input type="submit"
			value="Update">
	</form>

</body>
</html>