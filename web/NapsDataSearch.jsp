<%--
    Document   : NapsDataSearch.jsp
    Created on : 7 Jun, 2017, 5:45:58 PM
    Author     : Shayan Banerjee
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
        <SCRIPT type='text/javascript' src='datetimepicker_css.js'></SCRIPT>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title class="color:#3859DC">Enquiry By NAPS Request ID</title>
<script src="jquery.min.js"></script>

  


    <!--this is one   -->
<style type="text/css">
.css_btn_class {
	font-size:16px;
	font-family:Arial;
	font-weight:normal;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	border:1px solid #dd5df4;
	padding:9px 18px;
	text-decoration:none;
	background:-moz-linear-gradient( center top, #eea1fc 5%, #d441ee 100% );
	background:-ms-linear-gradient( top, #eea1fc 5%, #d441ee 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eea1fc', endColorstr='#d441ee');
	background:-webkit-gradient( linear, left top, left bottom, color-stop(5%, #eea1fc), color-stop(100%, #d441ee) );
	background-color:#eea1fc;
	color:#ffffff;
	display:inline-block;
	text-shadow:1px 1px 0px #b63dcc;
 	-webkit-box-shadow:inset 1px 1px 0px 0px #f4cafc;
 	-moz-box-shadow:inset 1px 1px 0px 0px #f4cafc;
 	box-shadow:inset 1px 1px 0px 0px #f4cafc;
}.css_btn_class:hover {
	background:-moz-linear-gradient( center top, #d441ee 5%, #eea1fc 100% );
	background:-ms-linear-gradient( top, #d441ee 5%, #eea1fc 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d441ee', endColorstr='#eea1fc');
	background:-webkit-gradient( linear, left top, left bottom, color-stop(5%, #d441ee), color-stop(100%, #eea1fc) );
	background-color:#d441ee;
}.css_btn_class:active {
	position:relative;
	top:1px;
}
/* This css button was generated by css-button-generator.com */
</style>

   <style type="text/css">
<!--
.style1 {
 color: #027001
}
.style2 {

    /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,7db9e8+100&1+0,0.7+0,1+62,0+100 */
background: -moz-linear-gradient(top, rgba(30,87,153,0.7) 0%, rgba(89,148,202,1) 62%, rgba(125,185,232,0) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(30,87,153,0.7) 0%,rgba(89,148,202,1) 62%,rgba(125,185,232,0) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(30,87,153,0.7) 0%,rgba(89,148,202,1) 62%,rgba(125,185,232,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b31e5799', endColorstr='#007db9e8',GradientType=0 ); /* IE6-9 */

   }
.style3 {color: #af3d00;font-size: 13.5px;font-family: "Quicksand";font-weight:bold}
-->
td{

}
</style>
<style>
    div#grid1{
        border: 1px solid black;
        border-collapse: collapse;
        font-family:'Tangerine', serif;
        text-align: center;
        width: 100%;
        background-color:#F4F6F6;
    }
    tr:nth-child(even) {
        background-color:#FEF5E7;

    }
}
</style>

<script>

function cndf(){
    var df = document.getElementById("df").value;

}

function genrep()
{
        var df=document.getElementById("df").value;
        var srl=document.getElementById("cno").value;
        var yr=document.getElementById("cyr").value;
        var cno = df+"-"+srl+"-"+yr;
	var rid= cno;
	
        
	var url='http://10.40.16.26:8081/naps/naps_enquiry.jsp?reqid='+rid;
//alert(url);
        $.getJSON(url, function (data) {
             //   var message =data.message;

        //        alert(data.NAME);
                    document.getElementById("reqid").innerHTML = data.REQID;
                   document.getElementById("name").innerHTML=data.NAME;
                   document.getElementById("phone").innerHTML=data.PHN;
                   document.getElementById("mobile").innerHTML =data.MOBILE;
                   document.getElementById("add1").innerHTML=data.ADDR;
                   if(data.EMAIL.toString()==null){
                       document.getElementById("email").innerHTML="------"
                   }
                   document.getElementById("email").innerHTML=data.EMAIL;
                   document.getElementById("supplytype").innerHTML=data.SUPPLY_TYPE;
                   document.getElementById("reqfor").innerHTML = data.REQFOR;
                   document.getElementById("appliedloadkw").innerHTML =data.APPLIED_LOAD_KW;
                   document.getElementById("contractload").innerHTML = data.CONTRACT_LOAD;
                   document.getElementById("supplycat").innerHTML = data.SUPPLY_CATEGORY;
                   document.getElementById("scoprintdt").innerHTML = data.SCO_PRINT_DT;
                   document.getElementById("initialpmntdt").innerHTML = data.INITIAL_PMNT_DT;
                   document.getElementById("forecastdt").innerHTML=data.FORECAST_DT;
                   document.getElementById("priorityid").innerHTML = data.PRIORITY_ID;
                   document.getElementById("status").innerHTML =data.STATUS;
            });

	}
          ////////////////////////////////
            function disableSingleQuote() {//------roshni----------------
                var key = window.event.keyCode;
                if (key ==39){
                    window.event.returnValue = false;
                }
            }
            function onlydigit() {
                var key = window.event.keyCode;
                if (key <48 || key >57){
                    window.event.returnValue = false;
                }
            }
   </script>

    </head>
    <body>
 <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%@ page import="oracle.sql.*" %>
        <%@ page import="oracle.jdbc.*" %>

        <%@ page import="KotaChsConnectionPackage.*" %>
   <div>
<%
                MakeConnectionKotaChs mk = new MakeConnectionKotaChs();
                Connection conn = mk.con;
try{

                String suser = (String) session.getAttribute("sessuid");
		String soffcd = (String) session.getAttribute("sessoffcd"); 
/*		String scat = (String) session.getAttribute("sesscat"); //user category or role
		String susernm = (String) session.getAttribute("sessuname"); //Name of the user
                String subsuser = (String) soffcd.substring(0, 4);*/
                String napsid= request.getParameter("nrid");
               
                String[] napsArr = new String[3];
                if(napsid!=null){
                    napsArr=napsid.split("-");
                }
     //              out.println(napsid);
     //               out.println(napsArr[0]);
       //             out.println(napsArr[1]);
         //           out.print(napsArr[2]);

    //            suser="adm-a1";
    //            soffcd="2107210";
%>
<form name="form1"  method="post">
<!--

 -->

    <!-- Page Content -->
        <div  id="page-wrapper" style="background: rgb(246,248,249); /* Old browsers */
background: -moz-linear-gradient(top, rgba(246,248,249,1) 0%, rgba(229,235,238,1) 50%, rgba(215,222,227,1) 51%, rgba(245,247,249,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f8f9', endColorstr='#f5f7f9',GradientType=0 ); /* IE6-9 */">
           <!-- delete this portion for header removal-->
  
           
           
  <!--         -->




            <div class="row">
                <div class="col-lg-12" align="center">
                 <input type="hidden" name="napsid" id="napsid"  />
                 <input type="hidden" name="ecd" id="ecd" value="<%//=suser%>" />
                 <input type="hidden" name="ofcd" id="ofcd" value="<%//= soffcd%>" />
                     <span class="style3"> <font size="5" color="#4D00B2">ENQUIRY BY NAPS REQUEST ID</font>
                     </span>
                </div>



        <%
                    String sysdt="",mdist="";
                    String sql = "select to_char(sysdate,'dd/mm/yyyy') from dual";
                    Statement sst = conn.createStatement();
                    ResultSet srs = sst.executeQuery(sql);
                    srs.next();
                    sysdt = srs.getString(1);
                    srs.close();
                    sst.close();

        %>
                <!-- /.col-lg-12 -->
            </div>
           <div>
                  <center><br>  
              <table align="center" width="75%"  cellpadding="1" cellspacing="0" style="overflow:scroll; height: 450px; width:1060px; background-color:#FEF5E7 "
                                       border="2"   bordercolor="#ffffff" >
                   <tr style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#e4f5fc+0,bfe8f9+50,9fd8ef+51,2ab0ed+100;Blue+Gloss+%235 */
background: rgb(228,245,252); /* Old browsers */
color:indigo;
background: -moz-linear-gradient(top, rgba(228,245,252,1) 0%, rgba(191,232,249,1) 50%, rgba(159,216,239,1) 51%, rgba(42,176,237,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(228,245,252,1) 0%,rgba(191,232,249,1) 50%,rgba(159,216,239,1) 51%,rgba(42,176,237,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(228,245,252,1) 0%,rgba(191,232,249,1) 50%,rgba(159,216,239,1) 51%,rgba(42,176,237,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4f5fc', endColorstr='#2ab0ed',GradientType=0 ); /* IE6-9 */">
                       <th ALIGN="LEFT" colspan="3" class="style1"><span ><font style="color:#002B7D">&nbsp;&nbsp;Enter NAPS Request ID :</font></span> &nbsp;</th>
<!--                  <td   colspan="4" align="center"><b>
                       &nbsp;&nbsp;&nbsp;&nbsp; CN - <!-- <input type="text" id="df" maxlength='8' size=5 readonly name="df" value="<%//=soffcd%>"  onkeypress="onlydigit();" /> -
  -->
                     <%

%>
     <!--           
         -->

         <td colspan="2" class="style1"> <font style="color:#002B7D2"> NAPS ID</font>
                   <select class="style1" name="complaint type" id="df" >
                     <%
                      String sqlCode=new String("");

                    if( napsid!=null){ %>
                      <option value="<%=napsArr[0] %>" selected><%=napsArr[0] %></option>
                        <%
                  sqlCode="select code from anc.ANC_OFFICE_DETAILS where code like  '"+napsArr[0].toString().substring(0,4)+"%'";
                        }
                 else{
                    sqlCode="select code from anc.ANC_OFFICE_DETAILS where code like '2107%'";
                    }
                   //   out.print(sqlCode);
                    Statement st3=conn.createStatement();
                    ResultSet rs3=st3.executeQuery(sqlCode);
                    
               

                           while(rs3.next())
                            {

                              %>
                         <option value=<%=rs3.getString(1)%>><%=rs3.getString(1)%></option>
                               <%
                            }
                            rs3.close();
                           st3.close();
                   
                         %>

                        </select>


<!-- upto this-->
                       <%
                      // out.println("subsuser="+subsuser);
                      if(napsid!=null){
%>
                       <input type="text" id="cno" maxlength='5' size=5  name="cno" value="<%=napsArr[1]%>" title="enter 5 digit Complaint Number"  onkeypress="onlydigit();" /> -
                        <%}else{
               %>
                       <input type="text" id="cno" maxlength='5' size=5  name="cno"  title="enter 5 digit Complaint Number"  onkeypress="onlydigit();" /> -
                        <%
                        }
%>

<%
                      if(napsid!=null){
%>
                 <input type="text" id="cyr" maxlength='2' size=1  name="cyr" value="<%=napsArr[2]%>" title="enter 2 digit Complaint Number Year"  onkeypress="onlydigit();" />
                                 <%}else{
               %>
                   <input type="text" id="cyr" maxlength='2' size=1  name="cyr" title="enter 2 digit Complaint Number Year"  onkeypress="onlydigit();" />
                           <%
                        }
%>
                         &nbsp;&nbsp;  <input type="button"  id="btn_src" name="btn_src" value="Search"  onclick="genrep();" class="css_btn_class"/>
                         &nbsp;&nbsp;&nbsp;<input type="button"  class="css_btn_class" id="btn_rest" name="btn_rest" value="Reset"  onclick="location.reload();window.open('NapsDataSearch.jsp#home');" />&nbsp;&nbsp;

                    </td>
                    </tr>



                <tr style="">


                </tr>
                <tr>
                    <th ALIGN="LEFT"><span class="style1">&nbsp;&nbsp;Request Id: </span>&nbsp;</th>
                    <td colspan="2"  valign="middle" rowspan="1"><div type="text" id="reqid"  name="reqid" class="style3">&nbsp;&nbsp;</div></td>


                </tr>
                <tr>
                    <th ALIGN="LEFT"><span class="style1"> &nbsp;&nbsp;Name </span></th>
                    <td colspan="2" valign="center" rowspan="1"><div id="name" class="style3">&nbsp;&nbsp;</div></td>

                    <th ALIGN="LEFT"><span class="style1"> &nbsp;&nbsp;Phone Number:</span></th>
                    <td colspan="2" valign="middel">
                        <div id="phone" class="style3">
                        </div><br>
                        <div id="mobile" class="style3"></div>
                      </td>
                </tr>
                <tr>
                    <th ALIGN="LEFT" rowspan="2"><span class="style1">&nbsp;&nbsp;Address </span> &nbsp;</th>
                    <td colspan="2" valign="top" rowspan="2">
                        <br>
                        <div id="add1"  cols=32 rows="3" name="add1" class="style3" >&nbsp;&nbsp;</div><br>
                           </td>
                    <th ALIGN="LEFT"><span class="style1">&nbsp;&nbsp;Email</span>&nbsp;</th>
                    <td colspan="2" valign="middle">
                        <div id="email"  name="email" class="style3">&nbsp;&nbsp;</div>
                    </td>
                </tr>
                <tr>
                    <th ALIGN="LEFT"><span class="style1">&nbsp;&nbsp;Requested For: </span>&nbsp;</th>
                    <td colspan="2" valign="middle"><div type="text" id="reqfor"  name="reqfor" class="style3">&nbsp;&nbsp;</div></td>
                </tr>
                <tr>
                    <th ALIGN="LEFT"><span class="style1"> &nbsp;&nbsp;Applied Load (kw)</span></th>
                    <td colspan="2" valign="middle"><div id="appliedloadkw" class="style3">&nbsp;&nbsp;</div></td>
                    <th ALIGN="LEFT"><span class="style1" class="style3"> &nbsp;&nbsp;Contract Load</span></th>
                    <td colspan="2" valign="middle"><div id="contractload" class="style3">&nbsp;&nbsp;</div></td>
                </tr>
                <tr>
                    <th ALIGN="LEFT"><span class="style1"> &nbsp;&nbsp;Supply Type</span></th>
                    <td colspan="2" valign="middle"><div id="supplytype" class="style3">&nbsp;&nbsp;</div></td>
                    <th ALIGN="LEFT"><span class="style1" class="style3"> &nbsp;&nbsp;Supply Category</span></th>
                    <td colspan="2" valign="middle"><div id="supplycat" class="style3">&nbsp;&nbsp;</div></td>
                </tr>
                <tr>
                   <th height="30" ALIGN="LEFT" width="20%"  ><span class="style1"> &nbsp;&nbsp;Sco Print Date</span> &nbsp;</th>
                   <td height="30" width="15%" colspan="2" valign="middle"><div id="scoprintdt" name="scoprintdt" class="style3">&nbsp;&nbsp;</div></td>
                    <th height="30" ALIGN="LEFT" width="15%"><span class="style1"> &nbsp;&nbsp;Initial Payment Date</span> &nbsp;</th>
                    <td width="20%" colspan="2" valign="middle">
                        <div style="display:inline"  id="initialpmntdt" class="style3"> &nbsp;&nbsp;</div>
                    </td>
                 </tr>
                <tr>
                    <th ALIGN="LEFT"><span class="style1"> &nbsp;&nbsp;Forecast Date</span> &nbsp;</th>
                    <td colspan="2" valign="middle"><div id="forecastdt" name="forecastdt" class="style3">&nbsp;&nbsp;</div></td>
                    <th ALIGN="LEFT"><span class="style1"> &nbsp;&nbsp; Priority Id</span> &nbsp;</th>
                    <td colspan="2" valign="middle"><div id="priorityid" name="priorityid" class="style3">&nbsp;&nbsp;</div></td>
                </tr>
                <tr>
                    <th ALIGN="LEFT">&nbsp;<span class="style1"> &nbsp;Status </span>&nbsp;</th>
                    <td colspan="5" valign="middle">
                        <div name="complremarks" id="status" cols="120" rows="2" class="style3">&nbsp;&nbsp;</div>
                    </td>
                </tr>
            </table>

           </center>
         </div>
                        <div id="dv_msg" style="display:none;top:250px;z-index: 50;left:50%; position: fixed;width:100%">
                            <img src="loading3.gif"  width="270" height="280"/>
                        </div>


    </div>
        <!-- /#page-wrapper -->

        <script>
            genrep();
            </script>
    </form>

    </div>
</div>
    <!-- /#wrapper -->

    <jsp:include page="footer.jsp" />
<%

}catch(Exception e){
    out.print(e);
    }
                finally{
                    conn.close();
                    mk.con.close();
                    }
%>

</body>

</html>

