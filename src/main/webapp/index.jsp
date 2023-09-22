<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Needs To Be Done</title>
<link rel="icon" href="./assets/Images/barLogo.png" type="image/x-icon">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Aref+Ruqaa+Ink&family=Barlow+Condensed:wght@700;800&family=Barlow:wght@400;700&family=Lato&family=Outfit:wght@300&family=Roboto+Mono:ital,wght@0,300;1,300&family=Roboto+Slab:wght@300&family=Space+Mono:wght@700&display=swap')
	;
</style>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa+Ink&display=swap"
	rel="stylesheet">
<script src="./assets/JS/index.js"></script>
</head>

<body>
	<main>
		<header>
			<div class="logo">
				<img
					src="<%=request.getContextPath()%>/assets/images/logo-transparent-svg.svg"
					alt="Logo"/>
			</div>
			<div class="Rightlinks">
				<a class="login" href="Signin.jsp">Log In</a> <a class="register"
					href="register.jsp">Register</a>
			</div>
		</header>

		<section class="first">
			<div class="leftFirst">
				<div class="websiteDescription">STOP FINDING JOBS AND WORKERS
					IN OFFLINE</div>
				<div class="ownerPoint">
					Get More workers with less effort <a href="register.jsp">SignUp</a>
				</div>
			</div>
			<div class="rightFirst">
				<div>
					<img class="grid"
						src="<%=request.getContextPath()%>/assets/images/grid.jpg"
						alt="image"> <img class="arrow"
						src="https://assets.website-files.com/6391f853d48f24401d03ff53/63923e27660f51a82618af9a_hero-compos-line-01.svg"
						alt="image"> <img class="arrowEnd"
						src="https://assets.website-files.com/6391f853d48f24401d03ff53/63923e27c0634948286d1f62_hero-compos-line-02.svg"
						alt="arrowEnd">

				</div>

				<div class="multiStar">
					<img
						src="https://assets.website-files.com/6391f853d48f24401d03ff53/6391f853d48f24b4b103ff70_hero_star-svg.svg"
						alt="image">
				</div>

				<div class="userCount">
					<div class="users">Users</div>
					<div class="numberOfUsers">
						<p>50</p>
						<p>K</p>
					</div>
				</div>

				<div class="createdBy">
					<div class="created">Created By</div>
					<div class="creator">Kamalesh</div>
				</div>
			</div>
		</section>

		<section class="second">
			<div class="secondLeft">
				<div class="totalAmount">
					<div class="videoSec">
						<video width="500" autoplay loop>
							<source
								src="https://assets.website-files.com/6391f853d48f24401d03ff53/6391f853d48f24ea6303ff9d_video-1-transcode.mp4"
								type="video/mp4">

						</video>
						<div class="videoRight">
							<div class="amount">$12M</div>
							<div class="amountShared">Has been paid by owners to the
								workers</div>
						</div>

					</div>




				</div>
			</div>

			<div class="secondRight">
				<div class="secondRightTop">
					Our innovation will save your <i>Energy</i> and <i>Time</i>
				</div>

				<div class="contact">
					<div class="images">
						<img class="contactOne" src="  ./assets/images/blackPeople.webp"
							alt="BlackPeople"> <img class="contactTwo"
							src="./assets/images/indianPeople.avif" alt="IndianPeople">
						<img class="contactThree" src="./assets/images/whitePeople.jpeg"
							alt="whitePeople">
					</div>
					<div class="aboutContact">These are our top owners</div>
				</div>
			</div>
		</section>


		<section class="topFeatures">
			<div class="notification">
				<div class="notificationLeft">
					<img src="./assets/images/notificationIllustration.avif"
						alt="notificationImage">
				</div>
				<div class="notificationRight">
					<div class="worker">If you are a worker in this website you
						will receive notification, Once the owner approved your Request.</div>

					<div class="owner">If you are a owner in this website you
						will receive a notification, Once the worker requested you to
						satrt the job and after completed the job.</div>
				</div>
			</div>

			<div class="chat">
				<div class="chatLeft">
					<div class="chatText">You can chat with all workers and
						owners in this website to clarify your doubt about the jobs and
						works and you can find the chatter by their name.</div>
				</div>
				<div class="chatRight">
					<img src="./assets/images/chatIllutration.avif"
						alt="chatIllutration">
				</div>

			</div>
		</section>

		<section class="topJobs">
			<h1>Top Jobs</h1>
			<div class="cards">
				<div class="card">
					<div class="pro">
						<img class="cardProfile" src="./assets/images/indianPeople.avif"
							alt="image">
						<p class="profileName">Mr.John</p>
					</div>
					<div class="datas">
						<p class="title">WebDevelopment</p>
						<p class="location">Chennai</p>
					</div>
					<div class="price">Rs.20,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>

				<div class="card">
					<div class="pro">
						<img class="cardProfile" src="./assets/images/whitePeople.jpeg"
							alt="image">
						<p class="profileName">Ms.Deepika</p>
					</div>
					<div class="datas">
						<p class="title">QA Tester</p>
						<p class="location">Chennai</p>
					</div>
					<div class="price">Rs.15,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>


				<div class="card">
					<div class="pro">
						<img class="cardProfile" src="./assets/images/blackPeople.webp"
							alt="image">
						<p class="profileName">Ms.Meha</p>
					</div>
					<div class="datas">
						<p class="title">Cook</p>
						<p class="location">Trichy</p>
					</div>
					<div class="price">Rs.50,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>


				<div class="card">
					<div class="pro">
						<img class="cardProfile"
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIHmZoJqNTTbsSg_It-1a_wh2xBGg78AIcSw&usqp=CAU"
							alt="image">
						<p class="profileName">Mr.Karthik</p>
					</div>
					<div class="datas">
						<p class="title">Electrician</p>
						<p class="location">Madurai</p>
					</div>
					<div class="price">Rs.12,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>


				<div class="card">
					<div class="pro">
						<img class="cardProfile"
							src="data:image/jpeg;base64,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"
							alt="image">
						<p class="profileName">Mr.Vivin</p>
					</div>
					<div class="datas">
						<p class="title">FullStack webdeveloper</p>
						<p class="location">Trichy</p>
					</div>
					<div class="price">Rs.50,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>


				<div class="card">
					<div class="pro">
						<img class="cardProfile"
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReRQC7_K9mENQzmKTtigEeFjWCgbJLmcjlzA&usqp=CAU"
							alt="image">
						<p class="profileName">Mr.Vinoth</p>
					</div>
					<div class="datas">
						<p class="title">Game Developer</p>
						<p class="location">Chennai</p>
					</div>
					<div class="price">Rs.100,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>


				<div class="card">
					<div class="pro">
						<img class="cardProfile"
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzTWI_omzV1GYy8D3rtl0HC9Kf5pP-gJuPuw&usqp=CAU"
							alt="image">
						<p class="profileName">Mr.Ajmal</p>
					</div>
					<div class="datas">
						<p class="title">Plumber</p>
						<p class="location">Pudukkottai</p>
					</div>
					<div class="price">Rs.10,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>

				<div class="card">
					<div class="pro">
						<img class="cardProfile"
							src="data:image/jpeg;base64,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"
							alt="image">
						<p class="profileName">Mr.Muniyappan</p>
					</div>
					<div class="datas">
						<p class="title">Farming</p>
						<p class="location">Trichy</p>
					</div>
					<div class="price">Rs.100,000</div>

					<div class="buttons">
						<a class="applyCard" onclick="workerLogin()">Apply</a> <a
							class="cardChat">Chat</a>

					</div>
				</div>
			</div>
		</section>

		<footer class="footer">
			<p>&copy;2023 Needs To Be Done | All Rights Reserved</p>
		</footer>
	</main>
</body>

</html>