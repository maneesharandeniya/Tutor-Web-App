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
    st.executeUpdate("INSERT INTO Tutor.Student ( Student_Name, Contact_Number,Student_Email,Student_Password) VALUES ('"+name+"','"+contact+"','"+email+"','"+password+"')");
    response.sendRedirect("studentLogin.html");
}
catch(Exception e){
    out.println(e);
    }
    
%>    