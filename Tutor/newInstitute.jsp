<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
String name = request.getParameter("name");
String contact = request.getParameter("contact");
String email = request.getParameter("email");
String password = request.getParameter("password");

try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    st.executeUpdate("INSERT INTO Tutor.Institute (Institute_Name , Contact_Number, Institute_Email ,Institute_Password) VALUES ('"+name+"','"+contact+"','"+email+"','"+password+"')");
    response.sendRedirect("instituteLogin.html");
}
catch(Exception e){
    out.println(e);
    }
    
%>    