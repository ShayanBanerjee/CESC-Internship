<%-- 
    Document   : navbar
    Created on : Jul 13, 2016, 9:08:05 AM
    Author     :roshni bose
--%>

        <!-- Navigation -->
	<%
	//String uid = session.getAttribute("suser").toString();
       // String soffcd = session.getAttribute("soffcd").toString();
        String uid="adm-a1";
	%>
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <!--img src="RP-SG-logo.png" alt="" class="img-responsive" /-->
                    <img src="RP-SG-logo.png" alt="125x125"  width="150" height="15" class="img-responsive">
                </a>
                <label style="left:300px;position:absolute;"> <a class="navbar-brand" href="home.jsp" align="center">Kota Electricity Distribution Limited</a></label>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                  <ul class="dropdown-menu dropdown-user">
                        
                        <li class="divider"></li>
                        <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
            <div class="navbar-collapse collapse navbar-right scroll-me">
               <img src="kota_logo.jpg" alt="65x65"  width="125" height="34" class="img-responsive">
            </div>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
		    
	                <li>
                            <a href="../naps/menus/index.jsp"><i class="fa fa-dashboard fa-fw"></i> CRIS</a>
                        </li>	    
		    

                        <li>
                            <a href="kchs.jsp"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                        </li>
		        <%
			if(!uid.equals("guest"))
			{
			%>
                        <li>
                           
                          <a href="rb_kchs_entry.jsp">Complaint Entry</a>
                               
                        </li>
                        
                        
                         <li>
                           
                          <a href="rb_kchs_edit.jsp">Complaint Edit</a>
                               
                        </li>
			
			<li>
                           
                          <a href="rb_kchs_upd.jsp">Complaint Update</a>
                               
                        </li>
			
			
			
			
		        <%
			}
			%>			
		    
		          <li>
                           
                                    <a href="#">Enquiry / Reports</a>
				    <ul class="nav nav-second-level">
					      <li>

                          <a href="rb_kchs_enq.jsp">Complaint Enquiry</a>

                        </li>
                                            
                                             
				    
				    </ul>
                               
                        </li>
                        
			<%
			if(!uid.equals("guest"))
			{
			%>
			
                        <!-- <li>
                           
                          <a href="change_pass.jsp">Change Password</a> 
                               
                        </li> -->
                        
			<%
			}
			%>
                         <li>
                           
                          <a href="logout.jsp">Log Out</a> 
                               
                        </li>
                   
                        <li class="sidebar-search">
                          
                            <!-- /input-group -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
