<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
String useremail =(String)session.getAttribute("instituteEmail");
String subject = request.getParameter("subject");
String tutor = request.getParameter("tutor");
String area = request.getParameter("areas");
String des = request.getParameter("description");

try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    ResultSet rs = st1.executeQuery("SELECT Institute.Institute_ID from Tutor.Institute where Institute.Institute_Email = '"+useremail+"'");
    rs.next();
    String instituteID = rs.getString(1);
    
    st.executeUpdate("INSERT INTO Tutor.Institute_Ad ( Institute_ID,Subject_ID, Teacher_Name,Area,Description ) VALUES ('"+instituteID+"','"+subject+"','"+tutor+"','"+area+"','"+des+"')");
    response.sendRedirect("instituteHome.jsp");
}
catch(Exception e){
    out.println(e);
    }
    
%>    