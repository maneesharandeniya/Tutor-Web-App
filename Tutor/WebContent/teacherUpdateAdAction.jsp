<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
String name = (String)session.getAttribute("userEmail");
String SID = request.getParameter("subject");
String contact = request.getParameter("phone");
String area = request.getParameter("area");
String description = request.getParameter("description");

try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
        
    ResultSet rs = st.executeQuery("SELECT Teacher.Teacher_ID FROM Tutor.Teacher WHERE Teacher_Email = '"+name+"'");
    rs.next();
    String TID = rs.getString(1);
    
    PreparedStatement ps = con.prepareStatement("UPDATE Tutor.Teacher_Ad SET Teacher_Ad.Contact_Number=?,Teacher_Ad.Area=?,Teacher_Ad.Description=? WHERE Teacher_Ad.Teacher_ID = '"+TID+"' and Teacher_Ad.Subject_ID='"+SID+"'");
    ps.setString(1,contact);
    ps.setString(2,area);
    ps.setString(3,description);
    ps.executeUpdate();
    response.sendRedirect("teacherAccount.jsp");
}
catch(Exception e){
    out.println(e);
    }
    
%>    