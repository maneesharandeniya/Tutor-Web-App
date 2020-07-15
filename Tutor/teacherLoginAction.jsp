<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
String username = request.getParameter("username");
session.setAttribute("userEmail",username);
String password = request.getParameter("password");
PreparedStatement preparedStatement;
ResultSet rs = null;

try{
    Connection con = ConnectionProvider.getCon();
    String sql = "SELECT Teacher_Email ,Teacher_Password FROM Tutor.Teacher WHERE Teacher_Email  = ? AND Teacher_Password = ?";

    preparedStatement = con.prepareStatement(sql);
    preparedStatement.setString(1, username);
    preparedStatement.setString(2, password);

    rs = preparedStatement.executeQuery();

    if(rs.next()) {
         response.sendRedirect("teacherHome.jsp");
    } else {
    	response.sendRedirect("errorTeacherLogin.html");
    }
    
}
catch(Exception e){
    out.println(e);
}
%>