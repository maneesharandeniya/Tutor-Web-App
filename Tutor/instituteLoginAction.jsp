<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
String username = request.getParameter("username");
session.setAttribute("instituteEmail",username);
String password = request.getParameter("password");
PreparedStatement preparedStatement;
ResultSet rs = null;

try{
    Connection con = ConnectionProvider.getCon();
    String sql = "SELECT Institute_Email,Institute_Password FROM Tutor.Institute WHERE Institute_Email  = ? AND Institute_Password  = ?";

    preparedStatement = con.prepareStatement(sql);
    preparedStatement.setString(1, username);
    preparedStatement.setString(2, password);

    rs = preparedStatement.executeQuery();

    if(rs.next()) {
         response.sendRedirect("instituteHome.jsp");
    } else {
    	response.sendRedirect("errorInstituteLogin.html");
    }
    
}
catch(Exception e){
    out.println(e);
}
%>