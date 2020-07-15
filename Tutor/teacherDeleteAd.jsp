<%@page import="java.sql.*" %>
<%@page import="Tutor.ConnectionProvider" %>

<%try
{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
Statement st1 = con.createStatement();
String SID = request.getParameter("SID");		   	  			    
				   	  			        
String email = (String)session.getAttribute("userEmail");
ResultSet rs1 = st1.executeQuery("SELECT Teacher.Teacher_ID FROM Tutor.Teacher WHERE Teacher.Teacher_Email = '"+email+"'");
rs1.next();
String TID = rs1.getString(1);

st.executeUpdate("DELETE from Tutor.Teacher_Ad where Teacher_Ad.Teacher_Id = '"+TID+"' and Teacher_Ad.Subject_ID = '"+SID+"'");
response.sendRedirect("teacherAccount.jsp");
}
catch(Exception e){
    out.println(e);
    }
    
%>    