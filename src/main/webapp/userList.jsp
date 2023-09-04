<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.needstobedone.servlet.modal.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
table {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid black;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

h2{
margin-top:50px;
margin-bottom: 10px;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
<h2>Data Table</h2>

	<% List<User> userList = (List<User>) request.getAttribute("userlist");
if(userList !=  null && !userList.isEmpty()){
	
	for(User user:userList){

%>



	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email ID</th>
			
		</tr>
		<tr>
			<td><%= user.getId() %></td>
			<td><%= user.getName() %></td>
			<td><%= user.getEmailId() %></td>
			
		</tr>
		<!-- Add more rows as needed -->
	</table><br><br>
	<%

	}
	}

	else{%>
	<h2>Users Not Found</h2>
	<%
	}

%>


</body>
</html>