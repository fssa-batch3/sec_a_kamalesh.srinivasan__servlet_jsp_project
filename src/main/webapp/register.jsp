<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.needstobedone.model.User"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Needs To Be Done</title>
<link rel="icon" href="./assets/Images/barLogo.png" type="image/x-icon">

<link rel="stylesheet" href="./assets/css/Register.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Barlow:wght@400;700&family=Outfit:wght@300&family=Roboto+Mono:ital,wght@0,300;1,300&family=Roboto+Slab:wght@300&family=Space+Mono:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script src="./assets/JS/register.js"></script>
</head>
<!-- This is register page -->

<body>
	<section class="register">
		

		<form id="form" method="post" action="userRegister">
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
		<%
		User user = (User) request.getAttribute("regUser");
		%>
			<h2>Registration</h2>
			<div class="inputs">
				<div class="email">
					<label for="email"> Email:- * </label><br> <input type="email"
						name="email" id="email" placeholder="example@gmail.com"
						value="<%=user != null ? user.getEmail() : ""%>"
						required />
				</div>
				<div class="first-name">
					<label for="first-name"> FirstName:- * </label><br> <input
						type="text" id="first-name" name="firstName"
						placeholder="firstname" pattern="^[A-Za-z]{3,}$" value="<%=user != null ? user.getFirstName() : ""%>" required />
				</div>
				<div class="last-name">
					<label for="last-name"> LastName:- * </label><br> <input
						type="text" id="last-name" name="lastName" placeholder="lastname"
						pattern="^[A-Za-z]{3,}$" value="<%=user != null ? user.getLastName() : ""%>" required />
				</div>

				<div class="is-owner">
					<input type="checkbox" id="is-owner" name="isOwner" checked="<%=user != null ? (user.getisOwner()) : false%>" > <label
						for="is-owner">I am an Owner</label>
				</div>
				<div class="password">
					<label for="password">Password:- *</label> <br> <input
						type="password" id="password" placeholder="Examplepassword"
						name="password" value="<%=user != null ? user.getPassword() : ""%>" required /> <i id="passwordEye"
						onclick="passwordEye()" class="fa fa-eye"></i> <br>
					<p>Password should have one UpperCase,LowerCase and more than 7
						charecters</p>

				</div>

				<div class="repeatPassword">
					<label for="repeatPassword"> Confirm password:- * </label><br>
					<input type="password" id="repeatPassword"
						placeholder="Examplepassword" value="<%=user != null ? user.getPassword() : ""%>"  required/><i id="repeatPasswordEye"
						onclick="RepasswordEye()" class="fa fa-eye" ></i> <br>
					<p>Confirm password should be same as password</p>
				</div>


			</div>

			<div class="buttons">
				<button id="reset" type="reset">
					<img src="<%= request.getContextPath() %>/assets/images/cross.svg" alt="cancelImage">
				</button>
				<button id="submit" type="submit">
					<img src="<%= request.getContextPath() %>/assets/images/tick.svg" alt="tickImage">
				</button>
			</div>

			<p class="signIn">
				If you already have an account? <a href="Signin.jsp">SignIn</a>
			</p>
		</form>

		<div class="registerIllutration">
			<img src="<%= request.getContextPath() %>/assets/images/register.avif" alt="image">
		</div>


	</section>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
</body>

</html>