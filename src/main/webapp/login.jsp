<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }
    
    .container {
      width: 300px;
      margin: 0 auto;
      background-color: #fff;
      border: 1px solid #ccc;
      padding: 20px;
      margin-top: 100px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .input-group {
      margin-bottom: 15px;
    }
    
    .input-group label {
      display: block;
      margin-bottom: 5px;
    }
    
    .input-group input {
      width: 100%;
      padding: 5px;
      font-size: 16px;
      border-radius: 4px;
      border: 1px solid #ccc;
    }
    
    .btn {
      padding: 10px;
      font-size: 16px;
      width: 100%;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    
    .btn:hover {
      background-color: #45a049;
    }
    
    .register {
      margin-top: 5px;
      text-align: center;
    }
    
    .register a {
      text-decoration: none;
      display: inline-block;
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 17.2rem;
    }
    
    .register a:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Login</h2>
    <% 
     String errorMessage = request.getParameter("error");
     if(errorMessage != null){
    	 %>
    	 <div class="alert alert-danger" role="alert">
    	   <%=errorMessage %><!-- this will change based on invalid field entered -->
    	</div>
    	<%
     }
    %>
    <form action="login" method="POST">
      <div class="input-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="kishor@gmail.com" required>
      </div>
      <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="Test@123"required>
      </div>
      <button type="submit" class="btn">Login</button>
      
      <div class="register">
        <a href="register.jsp">Register</a>
      </div>
    </form>
  </div>
</body>
</html>
