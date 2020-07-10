<%@page import="java.sql.*" %>
<%@page import="Tutor.ConnectionProvider" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.css">
    <link rel="stylesheet" href="dist/css/bootstrap-navbar-dropdowns.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.js" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js" defer></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.js" defer></script>
    <script src="dist/js/bootstrap-navbar-dropdowns.js" defer></script>
    <!-- Icons font CSS-->
    <link href="AD-form/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="AD-form/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="AD-form/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="AD-form/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="AD-form/css/main.css" rel="stylesheet" media="all">
    <style >
     	textarea {
   			resize: none;
   			width: 100%;
     	}
     	.work a:link, a:visited {
		  background-color: green;
		  color: white;
		  padding: 14px 25px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		}
		
		.work a:hover, a:active {
		  background-color: red;
    </style>
</head>

<body>
     <header>
            <div class="navbar navbar-expand-md navbar-dark bg-dark mb-4" role="navigation">
               
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <a class="nav-link" href="instituteHome.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="instituteCreateAD.jsp" >Post AD</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="instituteAccount.jsp">My Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="instituteLogin.html">Logout</a>
                        </li>
                        
                    </ul>
                    <form class="form-inline mt-2 mt-md-0" action = "instituteSearchAction.jsp">
                        <select name="search" class="form-control mr-sm-2">
                            <option disabled="disabled" selected="selected">Choose Subject</option>
                        	<%@page import="java.sql.*" %>
		      				<%@page import="Tutor.ConnectionProvider" %>
		      				<%try
		      				{
			    	 			Connection con = ConnectionProvider.getCon();
			   	  				Statement st = con.createStatement();				   	  				
			    	  			ResultSet rs = st.executeQuery("SELECT Subject.Subject_ID,Subject.Subject_Name,Subject.Stream,Subject.Medium from Subject");
			    	  			while(rs.next()){
		      				%>
		      				 	<option value = <%=rs.getString(1) %> ><%=rs.getString(2) %>(<%=rs.getString(3)%> <%=rs.getString(4)%> medium)</option>
		      				 	<%}}
                            	catch(Exception e){}%> 
                        </select>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </div>
            </header>
          
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Edit Ad</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action = "instituteUpdateAdAction.jsp">
                        
                        <div class="form-row">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <%try
				      				{
					    	 			Connection con = ConnectionProvider.getCon();
					   	  				Statement st = con.createStatement();
					   	  			    Statement st1 = con.createStatement();
					   	  			    Statement st2 = con.createStatement();
					   	  			    String SID = request.getParameter("SID");		   	  			    
				   	  			        
					   	  				String email = (String)session.getAttribute("instituteEmail");
					   	  			    ResultSet rs1 = st1.executeQuery("SELECT Institute.Institute_ID FROM Tutor.Institute WHERE Institute.Institute_Email = '"+email+"'");
				    	  			    rs1.next();
				    	  			    String IID = rs1.getString(1);
				    	  			    
					    	  			ResultSet rs = st.executeQuery("SELECT Subject.Subject_Name FROM Tutor.Subject WHERE Subject.Subject_ID = '"+SID+"'");
					    	  			rs.next();
					    	  			
					    	  			ResultSet rs2 = st2.executeQuery("SELECT Institute.Institute_Name,Subject.Subject_Name,Institute.Contact_Number,Institute_Ad.Area ,Institute_Ad.Description,Subject.Stream,Subject.Medium,Institute_Ad.Teacher_Name FROM Tutor.Institute,Tutor.Subject,Tutor.Institute_Ad WHERE Institute.Institute_ID = '"+IID+"' and Subject.Subject_Id='"+SID+"' and Institute_Ad.Institute_ID = '"+IID+"' and Institute_Ad.Subject_Id='"+SID+"'");
					    	  			rs2.next();
				      				%>
                                    <input disabled="disabled" class="input--style-5" type="text" name="name" value="<%=rs2.getString(1) %>" required = "required">
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Tutor Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="tutor" value="<%=rs2.getString(8) %>" required = "required">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Subject</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject" required = "required">
                                            <option  value = "<%=SID%>"><%=rs2.getString(2) %>(<%=rs2.getString(6)%> <%=rs2.getString(7)%> medium)</option>
                                
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            
                        <div class="form-row">
                            <div class="name">Phone</div>
                            <div class="value">                                                               
                               	<div class="input-group">
                                     <div class="input-group">
                                          <input disabled="disabled" class="input--style-5" type="text" name="phone" value="<%=rs2.getString(3) %>" required = "required">                                            
                                     </div>
                                </div>                              
                           </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Address</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="area" value="<%=rs2.getString(4) %>" required = "required">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Description</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-5"  name="description" required = "required"> <%=rs2.getString(5) %></textarea>
                                </div>
                            </div>
                        </div>
                        <%}
            	    	  catch(Exception e){}%> 
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit" style="float: right;">Update</button>
                        </div>
                        <div style="text-align:left;" class = "work">
                             <a href="instituteAccount.jsp " class="loginhere-link">Back</a>									         
					    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="AD-form/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="AD-form/vendor/select2/select2.min.js"></script>
    <script src="AD-form/vendor/datepicker/moment.min.js"></script>
    <script src="AD-form/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="AD-form/js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->