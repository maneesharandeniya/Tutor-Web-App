<%@page import="java.sql.*" %>
<%@page import="Tutor.ConnectionProvider" %>

<%try
{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
Statement st1 = con.createStatement();
String SID = request.getParameter("SID");		   	  			    
				   	  			        
String email = (String)session.getAttribute("instituteEmail");
ResultSet rs1 = st1.executeQuery("SELECT Institute.Institute_ID FROM Tutor.Institute WHERE Institute.Institute_Email = '"+email+"'");
rs1.next();
String IID = rs1.getString(1);

st.executeUpdate("DELETE from Tutor.Institute_Ad where Institute_Ad.Institute_Id = '"+IID+"' and Institute_Ad.Subject_ID = '"+SID+"'");
response.sendRedirect("instituteAccount.jsp");
}
catch(Exception e){
    out.println(e);
    }
    
%>    