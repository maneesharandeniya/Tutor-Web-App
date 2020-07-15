<%@page import = "Tutor.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
String searchName = request.getParameter("search");
session.setAttribute("Search",searchName);
PreparedStatement preparedStatement;
ResultSet rs = null;
PreparedStatement preparedStatement1;
ResultSet rs1 = null;

try{
    Connection con = ConnectionProvider.getCon();
    String sql = "SELECT Teacher_Ad.Subject_ID FROM Teacher_Ad WHERE Teacher_Ad.Subject_ID  = ?";
    String sql1 = "SELECT Institute_Ad.Subject_ID FROM Institute_Ad WHERE Institute_Ad.Subject_ID  = ?";

    preparedStatement = con.prepareStatement(sql);
    preparedStatement1 = con.prepareStatement(sql1);
    preparedStatement.setString(1, searchName); 
    preparedStatement1.setString(1, searchName);

    rs = preparedStatement.executeQuery();
    rs1 = preparedStatement1.executeQuery();

    if(rs.next() || rs1.next()) {
         response.sendRedirect("searchView.jsp");
    } else {
    	response.sendRedirect("errorSearchView.jsp");
    }
    
}
catch(Exception e){
    out.println(e);
}
%>