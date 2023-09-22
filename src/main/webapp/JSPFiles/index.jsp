<html>
<body>
<!-- This is how you write comments in JSP -->
	
	<!--  Example of JSP Declaration -->
	<%!public String getMessage() {
		return "Success";
	}%>
	
	<!--  Example of Scriptlet -->
	<%
	String message = "Success";
	%>
	
	<!-- Expressions -->
	<%=message%>
	<%=getMessage()%>
</body>
</html>
