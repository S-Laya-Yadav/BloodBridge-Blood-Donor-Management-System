<!DOCTYPE html>
<html>
<head>
<title>All Donors</title>

<style>
body{
font-family:Arial;
text-align:center;
background:#e3f2fd;
}

.box{
background:white;
padding:25px;
display:inline-block;
margin-top:60px;
border-radius:10px;
}

input{
padding:10px;
margin:8px;
}

button{
padding:10px 20px;
background:#0d47a1;
color:white;
border:none;
}
</style>
</head>

<body>

<div class="box">

<h2>View All Donors 💙</h2>

<form action="ViewDonorsServlet" method="get">

<input name="place" placeholder="Filter by Place">

<input name="age" placeholder="Filter by Age">

<input name="blood" placeholder="Filter by Blood Group">

<br><br>

<button>Search</button>

</form>

<br>
<a href="dashboard.jsp">Back</a>

</div>

</body>
</html>