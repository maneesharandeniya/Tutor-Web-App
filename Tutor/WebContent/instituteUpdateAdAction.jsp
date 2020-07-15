<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<%
String name = (String)session.getAttribute("instituteEmail");
String SID = request.getParameter("subject");
String tutor = request.getParameter("tutor");
String area = request.getParameter("area");
String description = request.getParameter("description");

try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
        
    ResultSet rs = st.executeQuery("SELECT Institute.Institute_ID FROM Tutor.Institute WHERE Institute_Email = '"+name+"'");
    rs.next();
    String IID = rs.getString(1);
    
    PreparedStatement ps = con.prepareStatement("UPDATE Tutor.Institute_Ad SET Institute_Ad.Teacher_Name=?,Institute_Ad.Area=?,Institute_Ad.Description=? WHERE Institute_Ad.Institute_ID = '"+IID+"' and Institute_Ad.Subject_ID='"+SID+"'");
    ps.setString(1,tutor);
    ps.setString(2,area);
    ps.setString(3,description);
    ps.executeUpdate();
    response.sendRedirect("instituteAccount.jsp");
}
catch(Exception e){
    out.println(e);
    }
    
%>    