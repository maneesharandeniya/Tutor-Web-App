
<html>

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="dist/css/bootstrap-navbar-dropdowns.css">
<link rel="stylesheet" type="text/css" href="style.css">

<script src="https://code.jquery.com/jquery-3.4.1.slim.js" defer></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js" defer></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.js" defer></script>
<script src="dist/js/bootstrap-navbar-dropdowns.js" defer></script>
<style>
body{
   background: -webkit-linear-gradient(left, grey, #25f7c4);
   background: linear-gradient(to right, grey, #90a7c4);
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
    width: 65%;
    
}

.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 100%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}

.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
    
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
​
</style>
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
	  font:  20px/1.5 Helvetica, Verdana, sans-serif;
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
                        <li class="nav-item ">
                            <a class="nav-link" href="studentHome.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="studentAccount.jsp">My Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="studentLogin.html">Logout</a>
                        </li>
                        
                    </ul>
                    <form class="form-inline mt-2 mt-md-0" action = "studentSearchViewAction.jsp">
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
          
<div class="container emp-profile">
            <form method="post">
                <div class="row">
                    
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <%try
					 				{
						 			Connection con = ConnectionProvider.getCon();
					  				Statement st = con.createStatement();
					  				String email = (String)session.getAttribute("studentEmail");
						  			ResultSet rs = st.executeQuery("SELECT * FROM Tutor.Student WHERE Student.Student_Email = '"+email+"'");
						  			rs.next();
					 				%>
                                    <h5>
                                        <%=rs.getString(2)%>
                                    </h5>                                   
                                    
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> <%=rs.getString(1)%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> <%=rs.getString(2)%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> <%=rs.getString(4)%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> <%=rs.getString(3)%></p>
                                            </div>
                                        </div>
                                       
                                        <%}
                     	               catch(Exception e){}%> 
                            </div>
    
                        </div>
                    </div>
                </div>
            </form>           
        </div>
   </body>     
   </html>