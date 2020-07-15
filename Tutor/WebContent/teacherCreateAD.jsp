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
                            <a class="nav-link" href="teacherHome.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="teacherCreateAD.jsp" >Post AD</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="teacherAccount.jsp">My Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="teacherLogin.html">Logout</a>
                        </li>
                        
                    </ul>
                    <form class="form-inline mt-2 mt-md-0" action = "searchAction.jsp">
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
                    <h2 class="title">Create new Ad</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action = "teacherAdAction.jsp">
                        
                        <div class="form-row">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="input-group">
                                    <%try
				      				{
					    	 			Connection con = ConnectionProvider.getCon();
					   	  				Statement st = con.createStatement();
					   	  				String name = (String)session.getAttribute("userEmail");
					    	  			ResultSet rs = st.executeQuery("SELECT Teacher.Teacher_Name FROM Tutor.Teacher WHERE Teacher.Teacher_Email = '"+name+"'");
					    	  			rs.next();
				      				%>
                                    <input disabled="disabled" class="input--style-5" type="text" name="name" value="<%=rs.getString(1) %>" required = "required">
                                    <%}
                            	    catch(Exception e){}%> 
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Subject</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject" required = "required">
                                            <option disabled="disabled" selected="selected">Choose Subject</option>
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
                                          <input class="input--style-5" type="text" name="phone" placeholder="Contact Numbers" required = "required">                                            
                                     </div>
                                </div>                              
                           </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Areas</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="areas" placeholder="Areas of teaching" required = "required">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Description</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-5" type="text" name="description" placeholder="Tell about the class" required = "required"> </textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit" style="float: right;">Post</button>
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