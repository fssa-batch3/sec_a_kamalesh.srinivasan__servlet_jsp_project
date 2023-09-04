<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String job = request.getParameter("job");
	%>
	<form action="UpdateJobServlet" method="post">
		<input type="hidden" name="jobid" value="${job.jobid}"> <label
			for="title">Title:</label> <input type="text" id="title" name="title"
			value="${job.title}" required><br> <br> <label
			for="price">Price:</label> <input type="number" id="price"
			name="price" value="${job.price}" required><br> <br>
		<input type="submit" value="Update">
	</form>

</body>
</html>