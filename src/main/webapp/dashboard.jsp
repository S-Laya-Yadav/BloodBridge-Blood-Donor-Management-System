<%@ page session="true" %>
<%
String name = (String) session.getAttribute("name");

if(name == null){
response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
body{
font-family:Arial,sans-serif;
background:linear-gradient(to right,#e3f2fd,#ffffff);
text-align:center;
margin:0;
padding:0;
}

.container{
margin-top:90px;
}

h2{
color:#0d47a1;
margin-bottom:30px;
}

.card{
background:white;
width:320px;
margin:15px auto;
padding:18px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
transition:0.3s;
}

.card:hover{
transform:scale(1.04);
}

a{
text-decoration:none;
font-size:18px;
font-weight:bold;
color:#0d47a1;
}
</style>
</head>

<body>

<div class="container">

<h2>Welcome, <%= name %></h2>

<div class="card">
<a href="donor.jsp">Register as Donor</a>
</div>

<div class="card">
<a href="request.jsp">Find Donors</a>
</div>

<div class="card">
<a href="viewdonors.jsp">View All Donors</a>
</div>

<div class="card">
<a href="logout.jsp">Logout</a>
</div>

</div>

</body>
</html>