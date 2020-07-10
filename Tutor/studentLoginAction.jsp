<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
String username = request.getParameter("username");
session.setAttribute("studentEmail",username);
String password = request.getParameter("password");
PreparedStatement preparedStatement;
ResultSet rs = null;

try{
    Connection con = ConnectionProvider.getCon();
    String sql = "SELECT Student_Email,Student_Password FROM Tutor.Student WHERE Student_Email  = ? AND Student_Password  = ?";

    preparedStatement = con.prepareStatement(sql);
    preparedStatement.setString(1, username);
    preparedStatement.setString(2, password);

    rs = preparedStatement.executeQuery();

    if(rs.next()) {
         response.sendRedirect("studentHome.jsp");
    } else {
    	response.sendRedirect("errorStudentLogin.html");
    }
    
}
catch(Exception e){
    out.println(e);
}
%>