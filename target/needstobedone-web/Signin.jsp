<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="icon" href="./assets/images/barLogo.png" type="image/x-icon">
<link rel="stylesheet" href="./assets/css/Signin.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&family=Barlow:wght@400;700&family=Outfit:wght@300&family=Roboto+Mono:ital,wght@0,300;1,300&family=Roboto+Slab:wght@300&family=Space+Mono:wght@700&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
<script type="text/javascript">
	(function() {
		emailjs.init("PJgY6h-r_KG_ejDC3");
	})();
</script>
<script src="./assets/JS/signIn.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<!-- This is sign in -->

<body>
	<section>

		<div class="left">
			<p class="login">
				<img src="./assets/images/user (1).png" alt="image"> LogIn
			</p>
			<form id="form" action="login" method="post">
			
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
				<label for="email">Email*</label><br> <input type="email"
					name="email" id="Email" placeholder="example@gmail.com" required /><br>

				<label for="password">Password*</label><br>
				<div class="inputs">
					<input type="password" name="password" id="Password"
						placeholder="*********" required /><i onclick="displayPassword()"
						class="fa fa-eye"></i>
				</div>
				<br> <a class="ftPwd" onclick="forgotPwdEmail()">Forgot
					Password ?</a><br>
				<div class="buttons">
					<button type="submit">LogIn</button>
					<button type="reset" >Register</button>
				</div>
			</form>
		</div>



	</section>
</body>
</html>