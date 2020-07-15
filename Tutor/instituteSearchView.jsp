
<!DOCTYPE html>
    <html>

        <head>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.css">
            <link rel="stylesheet" href="dist/css/bootstrap-navbar-dropdowns.css">
            <link rel="stylesheet" type="text/css" href="style.css">
            
            <script src="https://code.jquery.com/jquery-3.4.1.slim.js" defer></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js" defer></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.js" defer></script>
            <script src="dist/js/bootstrap-navbar-dropdowns.js" defer></script>
            
            <style>
				* {margin: 0; padding: 0;}
				 
				
				 
				ul div{
		          display: table;
                  margin: 0 auto;
				  list-style-type: none;
				  width: 500px;
				}
				 
				h3 {
				  font: bold 20px/1.5 Helvetica, Verdana, sans-serif;
				}
				h4 {
				  font:  18px/1.5 Helvetica, Verdana, sans-serif;
				}
				h5 {
				  font:  17px/1.5 Helvetica, Verdana, sans-serif;
				}
				li img {
				  float: left;
				  margin: 0 15px 0 0;
				}
				 
				li p {
				  font: 200 15px/1.5 Georgia, Times New Roman, serif;
				}
				 
				li div {
				  border: 1px solid black;
				  padding-right: 0px;
				  padding-left: 28px;
				  width: 700px;
				  border-radius: 5px;
				  background-color: #fff5d2;
				  padding: 10px;
				  overflow: auto;
				}
				 
				li:hover {
				  background: #eee;
				  cursor: pointer;
				}
				.login-box {
				  position: fixed;
				  right: 0;
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
                        <li class="nav-item active">
                            <a class="nav-link" href="instituteHome.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="instituteCreateAD.jsp" >Post AD</a>
                        </li>
                        <li class="nav-item">
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
		      				 	<option value = <%=rs.getString(1) %> ><%=rs.getString(2) %>(<%=rs.getString(3) %> <%=rs.getString(4) %> Medium)</option>
		      				 	<%}}
                            	catch(Exception e){}%> 
                        </select>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </div>
            </header>
          
            <div>
           
				   <ul><div>
					    <%@page import="java.sql.*" %>
	      				<%@page import="Tutor.ConnectionProvider" %>
	      			
	      				<%try
	      				{
		    	 			Connection con = ConnectionProvider.getCon();
		    	 			String search = (String)session.getAttribute("Search");
		   	  				Statement st = con.createStatement();
		   	  			    Statement st1 = con.createStatement();
		    	  			ResultSet rs = st.executeQuery("SELECT Subject.Subject_Name ,Teacher.Teacher_Name,Teacher_Ad.Contact_Number,Teacher_Ad.Area,Teacher_Ad.Description,Subject.Stream,Subject.Medium from Subject,Teacher,Teacher_Ad where Teacher_Ad.Subject_ID = '"+search+"' and Teacher.Teacher_ID = Teacher_Ad.Teacher_ID and Subject.Subject_ID = '"+search+"' ");
		    	  			ResultSet rs1 = st1.executeQuery("SELECT Institute.Institute_Name,Subject.Subject_Name ,Institute_Ad.Teacher_Name, Institute.Contact_Number, Institute_Ad.Area, Institute_Ad.Description,Subject.Stream,Subject.Medium,Institute_Ad.Area from Subject,Institute,Institute_Ad where Institute_Ad.Subject_ID = '"+search+"' and Institute.Institute_ID = Institute_Ad.Institute_ID and Subject.Subject_ID = '"+search+"' ");
		    	  			while(rs.next()){
	      				%>
				    	<li><div>
						    <img src="images/user.png" width= 150 height = 150/>
						    <h3><%=rs.getString(1) %> (<%=rs.getString(6) %> <%=rs.getString(7) %> Medium)</h3>
						    <h5>Tutor : <%=rs.getString(2) %> </h5>
						    <p>Contact : <%=rs.getString(3) %> <br>
						         Areas : <%=rs.getString(4) %> <br>
						         <%=rs.getString(5) %> </p>
					      
					    </div></li>
				     	<%}while(rs1.next()){
		      				%>
					    	<li><div>
							    <img src="images/institute2.png" width= 150 height = 150/>
							   
							    <h3><%=rs1.getString(2) %> (<%=rs1.getString(7) %> <%=rs1.getString(8) %> Medium)</h3>
							    <h5>Tutor : <%=rs1.getString(3) %></h5>
							    <p>  Place : <%=rs1.getString(1) %> Institute,<%=rs1.getString(9) %><br>
							         Contact : <%=rs1.getString(4) %> <br>
							         Location : <%=rs1.getString(5) %> <br>
							         <%=rs1.getString(6) %> </p>
						      
						    </div></li>
		    	  		
		    	  		<%}}
                     	catch(Exception e){}%> 
                   				 
				  </div></ul>
			</div>
			
            
        </body>

    </html>
    