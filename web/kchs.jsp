<%-- 
    Document   : index
    Created on : 6 Jun, 2017, 3:01:01 PM
    Author     : ROSHNI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Complaint System</title>
<script src="jquery.min.js"></script>

    <jsp:include page="header.jsp" />
   <style type="text/css">
<!--
.style1 {color: #000000;
          font-size: 11px;
	  font-family: "Verdana";
    }
.style2 {color: #285C01;font-size: 12px;font-family: "Verdana";font-weight:bold}
.style3 {color: #000000;font-size: 14px;font-family: "Verdana";font-weight:bold}
-->
</style>
    </head>
    <body>
    
   <div id="wrapper">
<%
try{

                    String suser = (String) session.getAttribute("sessuid"); //user id
		String scat = (String) session.getAttribute("sesscat"); //user category or role
		String soffcd = (String) session.getAttribute("sessoffcd"); // office code
		String susernm = (String) session.getAttribute("sessuname"); //Name of the user

                suser="adm-a1";
                soffcd="2107210";
%>

<jsp:include page="navbar.jsp?suser=<%=suser%>&soffcd=<%=soffcd%>" />
        <!-- Page Content -->
        <div id="page-wrapper" style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f7cdbe+0,aed3e8+21,acf99d+51,9be0f2+84,cfe2c0+100 */
background: #f7cdbe; /* Old browsers */
background: -moz-linear-gradient(left, #f7cdbe 0%, #aed3e8 21%, #acf99d 51%, #9be0f2 84%, #cfe2c0 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(left, #f7cdbe 0%,#aed3e8 21%,#acf99d 51%,#9be0f2 84%,#cfe2c0 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to right, #f7cdbe 0%,#aed3e8 21%,#acf99d 51%,#9be0f2 84%,#cfe2c0 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7cdbe', endColorstr='#cfe2c0',GradientType=1 ); /* IE6-9 */">
            <div class="row">
                <div class="col-lg-12" align="center">

    <input type="hidden" name="ecd" id="ecd" value="<%//=suser%>" />
    <input type="hidden" name="ofcd" id="ofcd" value="<%//= soffcd%>" />
        <span class="style3"> <font size="5" color="1699D5">Centralized Customer Care System (C3S)</font>
                                             </span>
                                  
                                            <hr color="911D0E">
                </div>
                <!-- /.col-lg-12 -->
            </div>
                        <BR><BR><BR><BR>
                        <div  >
                            <center>
                                <table width="95%" align="center"><tr><th align="center">
                                <img src="c2.jpg" width="270" height="260"></th><th align="center">
                         <img src="help.jpg" width="270" height="260"></th><th align="center">
                          <img src="rd.jpg" width="270" height="260"></th></tr></table>
                            </center>
                        </div>
                        <div class="panel-body">
                        <div class="row" >
                                
                        </div>
</div>
                           
                     

    </div>
        <!-- /#page-wrapper -->
<%

}catch(Exception e){
    out.print(e);
    }
%>

    </form>

    </div>
    <!-- /#wrapper -->

    <jsp:include page="footer.jsp" />

</body>

</html>

