<%
    // Clear the user data from memory
    session.invalidate(); 
    // Send them back to the login page
    response.sendRedirect("login.jsp");
%>