<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
String useremail =(String)session.getAttribute("userEmail");
String subject = request.getParameter("subject");
String contact = request.getParameter("phone");
String area = request.getParameter("areas");
String des = request.getParameter("description");

try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    ResultSet rs = st1.executeQuery("SELECT Teacher.Teacher_ID from Tutor.Teacher where Teacher.Teacher_Email = '"+useremail+"'");
    rs.next();
    String teacherID = rs.getString(1);
    
    st.executeUpdate("INSERT INTO Tutor.Teacher_Ad ( Teacher_ID,Subject_ID, Contact_Number,Area,Description ) VALUES ('"+teacherID+"','"+subject+"','"+contact+"','"+area+"','"+des+"')");
    response.sendRedirect("teacherHome.jsp");
}
catch(Exception e){
    out.println(e);
    }
    
%>    