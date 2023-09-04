<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	max-width: 400px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

h1 {
	text-align: center;
	color: #333;
}
</style>
</head>
<body>
	<div class="container">
		<h1>User Registration</h1>
		<%
		String errorMessage = request.getParameter("error");
		if (errorMessage != null) {
		%>
		<div class="alert alert-danger" role="alert">
			<%=errorMessage%><!-- this will change based on invalid field entered -->
		</div>
		<%
		}
		%>
		<form action="register" method="post">
			<div class="mb-3">
				<label for="email" class="form-label">Email:</label> <input
					type="email" class="form-control" id="email" name="email" value="kishor@gmail.com" required>
			</div>

			<div class="mb-3">
				<label for="password" class="form-label">Password:</label> <input
					type="password" class="form-control" id="password" name="password" value="Test@123"
					required>
			</div>

			<div class="mb-3">
				<label for="firstName" class="form-label">First Name:</label> <input
					type="text" class="form-control" id="firstName" name="firstName" value="kishore" 
					required>
			</div>

			<div class="mb-3">
				<label for="lastName" class="form-label">Last Name:</label> <input
					type="text" class="form-control" id="lastName" name="lastName" value="muruganantham"
					required>
			</div>

			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="isOwner"
					name="isOwner"> <label class="form-check-label" 
					for="isOwner">Are you an owner?</label>
			</div>

			<div class="mb-3">
				<label for="DOB" class="form-label">Date of Birth:</label> <input
					type="date" class="form-control" id="DOB" name="DOB" value="2000-09-01" required>
			</div>

			<div class="mb-3">
				<label for="phoneNumber" class="form-label">Phone Number:</label> <input
					type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="7670987654"
					required>
			</div>

			<div class="mb-3">
				<label for="aadhar" class="form-label">Aadhar:</label> <input
					type="number" class="form-control" id="aadhar" name="aadhar" value="456756569898"
					required>
			</div>

			<div class="mb-3">
				<label for="address" class="form-label">Address:</label> 
				<textarea class="form-control" id="address" name="address"  required>Chennai</textarea>
			</div>

			<button type="submit" class="btn btn-primary">Register</button>
		</form>
	</div>
</body>
</html>
