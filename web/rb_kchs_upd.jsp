<%--
    Document   : rb_kchs_entry
    Created on : 7 Jun, 2017, 5:45:58 PM
    Author     : roshni bose
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
          <title>Complaint Update Module</title>
<script src="jquery.min.js"></script>

    <jsp:include page="header.jsp" />
    <style type="text/css">
.css_btn_class1 {
	font-size:16px;
	font-family:Arial;
	font-weight:normal;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	border:1px solid #d02718;
	padding:9px 18px;
	text-decoration:none;
	background:-moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );
	background:-ms-linear-gradient( top, #f24537 5%, #c62d1f 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');
	background:-webkit-gradient( linear, left top, left bottom, color-stop(5%, #f24537), color-stop(100%, #c62d1f) );
	background-color:#f24537;
	color:#ffffff;
	display:inline-block;
	text-shadow:1px 1px 0px #810e05;
 	-webkit-box-shadow:inset 1px 1px 0px 0px #f5978e;
 	-moz-box-shadow:inset 1px 1px 0px 0px #f5978e;
 	box-shadow:inset 1px 1px 0px 0px #f5978e;
}.css_btn_class1:hover {
	background:-moz-linear-gradient( center top, #c62d1f 5%, #f24537 100% );
	background:-ms-linear-gradient( top, #c62d1f 5%, #f24537 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537');
	background:-webkit-gradient( linear, left top, left bottom, color-stop(5%, #c62d1f), color-stop(100%, #f24537) );
	background-color:#c62d1f;
}.css_btn_class1:active {
	position:relative;
	top:1px;
}
/* This css button was generated by css-button-generator.com */
</style>
    <style type="text/css">
.css_btn_class {
	font-size:16px;
	font-family:Arial;
	font-weight:normal;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	border:1px solid #337fed;
	padding:9px 18px;
	text-decoration:none;
	background:-moz-linear-gradient( center top, #3d94f6 5%, #1e62d0 100% );
	background:-ms-linear-gradient( top, #3d94f6 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0');
	background:-webkit-gradient( linear, left top, left bottom, color-stop(5%, #3d94f6), color-stop(100%, #1e62d0) );
	background-color:#3d94f6;
	color:#ffffff;
	display:inline-block;
	text-shadow:1px 1px 0px #1570cd;
 	-webkit-box-shadow:inset 1px 1px 0px 0px #97c4fe;
 	-moz-box-shadow:inset 1px 1px 0px 0px #97c4fe;
 	box-shadow:inset 1px 1px 0px 0px #97c4fe;
}.css_btn_class:hover {
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	background:-ms-linear-gradient( top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background:-webkit-gradient( linear, left top, left bottom, color-stop(5%, #1e62d0), color-stop(100%, #3d94f6) );
	background-color:#1e62d0;
}.css_btn_class:active {
	position:relative;
	top:1px;
}
/* This css button was generated by css-button-generator.com */
</style>
   <style type="text/css">
<!--
.style1 {color: #000000;
          font-size: 14px;
	  font-family: "Arial";
    }
.style2 {color: #285C01;font-size: 12px;font-family: "Verdana";font-weight:bold}
.style3 {color: #000000;font-size: 14px;font-family: "Verdana";font-weight:bold}
-->
</style>

   <script>
       var rb;
function searchCno(val){


  var url;
		//var val=1;
              if (typeof XMLHttpRequest != "undefined")
                {
                    rb= new XMLHttpRequest();
                }
                else if (window.ActiveXObject)
                {
                    rb= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (rb==null)
                {alert("inside if");
                    alert ("Browser does not support XMLHTTP Request")
                    return

                 }

                   var df=document.getElementById("df").value;
                   var srl=document.getElementById("cno").value;
                   var yr=document.getElementById("cyr").value;
                   var cno=df+"-"+srl+"-"+yr

                   url='rb_kchs_edit_det.jsp?flag=1&cno=CN-'+cno;


                   document.getElementById("nm1").value="";
                   document.getElementById("appldt").value=""
                   document.getElementById("phno").value=""
                   document.getElementById("telno_mob").value=""
                   document.getElementById("email").value=""
                   document.getElementById("add1").value=""
                   document.getElementById("letno").value="";
                   document.getElementById("refdto").value=""
                   document.getElementById("refdby").value=""
                   document.getElementById("compl_addr").value=""
                   document.getElementById("nm_cmplnt").value=""
                   document.getElementById("mrref").value=""
                   document.getElementById("entrdt").value=""
                   document.getElementById("consno").value=""
                   document.getElementById("mryr").value=""
                   document.getElementById("dv_msg").style.display="block"
                 //alert(url)
                rb.onreadystatechange = stateChangerb;
                rb.open("GET", url, true);
                rb.send(null);
            }

           function stateChangerb()
            {
                if (rb.readyState==4 || rb.readyState=="complete")
                {
                    document.getElementById("dv_msg").style.display="none"
                    var str=rb.responseText.split("$$_$$")
                   if(str[0].substring(0,1)=="E")
                    {
                        alert(rb.responseText.split("$$_$$")[1])
                        document.getElementById("dv_msg").display="none"
                        return false
                    }
                    var s=rb.responseText.split("$$_$$");
                    document.getElementById("dv_msg").display="none"

                //    alert(s)
                             var ctype=s[2]
                             if(ctype=='1'){
                                 //naps
                                 var napsid=s[0];
                                 document.getElementById("napsid").value=napsid;
                                 var df=napsid.split("-")[0]
                                 var ref=napsid.split("-")[1]
                                 var yr=napsid.split("-")[2]

                                 document.getElementById("mrdst").value=df
                                 document.getElementById("mrref").value=ref
                                 document.getElementById("mryr").value=yr
                             }else if(ctype=='2'){
                                 //technical
                                 document.getElementById("consno").value=s[1];
                             }
                   document.getElementById("ctype").value=s[2];
                   document.getElementById("cat").value=s[3]
                   document.getElementById("nm1").value=s[4];
                   document.getElementById("add1").value=s[5]
                   document.getElementById("nm_cmplnt").value=s[6]
                   document.getElementById("compl_addr").value=s[7]
                   document.getElementById("rcvddt").value=s[8]
                   document.getElementById("refdto").value=s[10]
                   document.getElementById("refdby").value=s[9]
                   document.getElementById("addto").value=s[11]
                   document.getElementById("lpno").value=s[12]
                   document.getElementById("crcmpl").value=s[13]
                   document.getElementById("phno").value=s[14];
                   document.getElementById("telno_mob").value=s[15]
                   document.getElementById("email").value=s[16];
                   document.getElementById("entrdt").value=s[17]
                   document.getElementById("letno").value=s[18]

                   var ALLOW=s[19];
                   if(s[19]=='1'){
                       document.getElementById("btn_sub").style.display='inline';
                       document.getElementById("btn_sub").disabled=false
                        document.getElementById("stat").innerHTML="STATUS: <font color=red size=5>PENDING"
                   }else{
                       alert("This complaint is already attended. No further editing is allowed.")

                       document.getElementById("btn_sub").disabled=true
                       document.getElementById("btn_sub").style.display='none';
                        document.getElementById("stat").innerHTML="STATUS: <font color=green size=5>ATTENDED"
                   }

                }
            }
            /////////////////////////////////////////////////////
function disableSingleQuote() {//------roshni----------------
                var key = window.event.keyCode;
                if (key ==39){
                    window.event.returnValue = false;
                }
            }

       var xx
       function sv_Entry(){
            var url;
		//var val=1;
              if (typeof XMLHttpRequest != "undefined")
                {
                    xx= new XMLHttpRequest();
                }
                else if (window.ActiveXObject)
                {
                    xx= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xx==null)
                {alert("inside if");
                    alert ("Browser does not support XMLHTTP Request")
                    return

                 }
               var cno=document.getElementById("cno").value;
               var CNO=document.getElementById("df").value+"-"+document.getElementById("cno").value+"-"+document.getElementById("cyr").value;

               if(cno=='' || cno==' ' || cno=='0'){
                alert("Please specify complaint number to edit")
                return false
            }
               var url="rb_kchs_upd_save.jsp?cno="+CNO;
                url=url+"&actdt="+document.getElementById("actdt").value;
                url=url+"&closermk="+document.getElementById("closermk").value;
                //document.write(url)
                //alert(url)
                var sc=confirm("Are you sure to update action date for Complaint No: CN-"+CNO+"?")
                if(sc){

                document.getElementById("btn_sub").disabled=true
                xx.onreadystatechange = stateChangexx;

                xx.open("GET", url, true);
                xx.send(null);
                }
            }

           function stateChangexx()
            {
                if (xx.readyState==4 || xx.readyState=="complete")
                {

                    var str=xx.responseText.split("$$_$$")
                   if(str[0].substring(0,1)=="E")
                    {
                        alert(xx.responseText.split("$$_$$")[1])
                        return false
                    }
                    var s=xx.responseText.split("$$_$$");
                    alert(s[0])
                    searchCno('1');
                   // window.open('rb_kchs_slip.jsp?cno='+s[1]+'&ofice='+s[2],'printout','width=500,height=600,menubar,status,scrollbar,resizable')
                   // window.location.reload();
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
   <div id="wrapper">
<%
                MakeConnectionKotaChs mk = new MakeConnectionKotaChs();
                Connection conn = mk.con;
try{

                    String suser = (String) session.getAttribute("sessuid"); //user id
		String scat = (String) session.getAttribute("sesscat"); //user category or role
		String soffcd = (String) session.getAttribute("sessoffcd"); // office code
		String susernm = (String) session.getAttribute("sessuname"); //Name of the user

                suser="adm-a1";
                soffcd="2107210";
%>
<form name="form1"  method="post">

<jsp:include page="navbar.jsp?suser=<%=suser%>&soffcd=<%=soffcd%>" />
        <!-- Page Content -->
        <div id="page-wrapper" style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#dceaef+1,d8ffdd+100 */
background: #dceaef; /* Old browsers */
background: -moz-linear-gradient(top, #dceaef 1%, #d8ffdd 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #dceaef 1%,#d8ffdd 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #dceaef 1%,#d8ffdd 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dceaef', endColorstr='#d8ffdd',GradientType=0 ); /* IE6-9 */">
                  <div class="row">
                <div class="col-lg-12" align="center">
 <input type="hidden" name="napsid" id="napsid"  />
    <input type="hidden" name="ecd" id="ecd" value="<%=suser%>" />
    <input type="hidden" name="ofcd" id="ofcd" value="<%= soffcd%>" />
        <span class="style3"> <font size="4" color="0CADF7">COMPLAINT UPDATE MODULE</font>
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
                        <div  >
                            <center><br>
                                <table align="center" width="100%" cellpadding="1" cellspacing="0" style="border:3px solid #ffffff"
                                       border="2"   bordercolor="#ffffff" >
                   <tr style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#febbbb+0,fcd6d6+45,ffc4f3+100 */
background: #febbbb; /* Old browsers */
background: -moz-linear-gradient(left, #febbbb 0%, #fcd6d6 45%, #ffc4f3 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(left, #febbbb 0%,#fcd6d6 45%,#ffc4f3 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to right, #febbbb 0%,#fcd6d6 45%,#ffc4f3 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#febbbb', endColorstr='#ffc4f3',GradientType=1 ); /* IE6-9 */">
                    <th ALIGN="RIGHT" colspan="3" ><span class=style1>&nbsp;&nbsp;Enter Complaint Number :</span></span> &nbsp;</th>
                    <td   colspan="4" align="center"><b>
                       &nbsp;&nbsp;&nbsp;&nbsp; CN - <input type="text" id="df" maxlength='8' size=5 readonly name="df" value="<%=soffcd%>"  onkeypress="onlydigit();" /> -
                        <input type="text" id="cno" maxlength='5' size=5  name="cno" title="enter 5 digit Complaint Number"  onkeypress="onlydigit();" /> -
                        <input type="text" id="cyr" maxlength='2' size=1  name="cyr" title="enter 2 digit Complaint Number Year"  onkeypress="onlydigit();" />
                        &nbsp;&nbsp;  <input type="button"  id="btn_src" name="btn_src" value="Search"  onclick="searchCno('1');" class="css_btn_class1"/>
                    </td>
                    </tr>


               <tr height="30"  style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffa8+1,f5ff75+100 */
background: #ffffa8; /* Old browsers */
background: -moz-linear-gradient(top, #ffffa8 1%, #f5ff75 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #ffffa8 1%,#f5ff75 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #ffffa8 1%,#f5ff75 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffa8', endColorstr='#f5ff75',GradientType=0 ); /* IE6-9 */">

                   <th height="30" ALIGN="RIGHT" width="20%"  ><span class="style1"> &nbsp;Complaint Type</span> &nbsp;</th>
                    <td height="30" width="15%" colspan="2">
                         <select id="ctype"  name="ctype" disabled style="background:#F2FF75;font-size: 18px">
                          <%
                sql="select CODE,DESCRIP from compl_type order by 1";
                Statement st=conn.createStatement();
                ResultSet rs4=st.executeQuery(sql);
                while(rs4.next())
                {

                   %>
                   <option value=<%=rs4.getString(1)%>><%=rs4.getString(2)%></option>
                   <%
                }
                rs4.close();
                st.close();
                            %>

                        </select>
                    </td>
                    <th height="30" ALIGN="RIGHT" width="15%">
                        <span class="style1"> &nbsp;Complaint Category *</span> &nbsp;</th>
                    <td width="20%" colspan="2" >
                        <div style="display:inline"  id="subcat">
                        <select id="cat"  name="cat" style="background:#FFF064;font-size: 18px" disabled>
                            <option value="0"></option>
 <option value="0">-----select------</option>
                          <%
                sql="select CODE,DESCRIP from compl_category  order by 1";
                 st=conn.createStatement();
                 rs4=st.executeQuery(sql);
                while(rs4.next())
                {

                   %>
                   <option value=<%=rs4.getString(1)%>><%=rs4.getString(2)%></option>
                   <%
                }
                rs4.close();
                st.close();
                            %>
                        </select>
                            </div>
                    </td>
                 </tr>
                <tr style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#d2ff52+0,91e842+100;Neon */
background: #d2ff52; /* Old browsers */
background: -moz-linear-gradient(top, #d2ff52 0%, #91e842 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #d2ff52 0%,#91e842 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #d2ff52 0%,#91e842 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d2ff52', endColorstr='#91e842',GradientType=0 ); /* IE6-9 */">
                    <th ALIGN="RIGHT" >
                        <span class="style1"> &nbsp;K-No.</span> &nbsp;</th>
                    <td colspan="2" >
                        <input type="text" id="consno" disabled name="consno" onkeypress="onlydigit();"  value="" size="15" maxlength="11" />
                    </td>
                    <th ALIGN="RIGHT" ><span class="style1"> &nbsp;NAPS Request ID.</span> &nbsp;</th>
                    <td colspan="2">
                        <input type="text" id="mrdst" size=7  name="mrdst" disabled value="<%=soffcd%>"  disabled  />
                        <strong><font size="4px">-</font></strong><input type="text" disabled id="mrref" maxlength='5' size=5 name="mrref" value="" onkeypress="onlydigit();"  />
                        <strong><font size="4px">-</font></strong><input type="text" disabled id="mryr" maxlength='2' size=2 name="mryr" value="" onkeypress="onlydigit();"  />

                    </td>
                </tr> <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Received On </span></span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="rcvddt" disabled maxlength='10' size=10 readonly name="rcvddt"   /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Entered On </span>&nbsp;</th>
                    <td colspan="2"><input type="text" id="entrdt" disabled maxlength='10' size=10 readonly name="entrdt" /></td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT" width="15%" ><span class="style1"> &nbsp;Addressed To</span> &nbsp;</th>
                    <td width="15%" colspan="2"><select id="addto"  disabled name="addto">
                            <option value=""></option>
                            <option value="AEN">AEN</option>
                            <option value="CCA">CCA</option>

                        </select>
                    </td>
                    <td>&nbsp;</td> <td>&nbsp;</td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT" rowspan="2"><span class="style1"> &nbsp;Name & Address </span> &nbsp;</th>
                    <td colspan="2" valign="top" rowspan="2">
                        <input type="text" id="nm1" maxlength='24' size=31 name="nm1" value="" disabled style="text-transform: uppercase;height: 20px" onkeypress="disableSingleQuote()"  /><br>
                         <textarea id="add1"  cols=32 rows="3" name="add1" disabled style="text-transform: uppercase" onkeypress="disableSingleQuote()" ></textarea><br>
                           </td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Application Date:</span></th>
                    <td colspan="2" valign="middel">
                             <input type="text" id="appldt" maxlength='24' size=24 name="appldt" value="" disabled /><br>
                      </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Email Id </span>&nbsp;</th>
                    <td colspan="2" valign="middle">
                        <input type="text" id="email" maxlength='100' disabled size=30 name="email" value="" onchange="emailVali();" onkeyup="if (/^\s+|\s+$/g.test(this.value)) this.value=this.value.replace(/^\s+|\s+$/g,'');  " onkeypress="disableSingleQuote()" />
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;L/P No: </span>&nbsp;</th>
                    <td colspan="2"><input type="text" id="lpno" disabled maxlength='21' size=21 name="lpno" value="" onkeypress="disableSingleQuote()" /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Phone No.</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="phno" disabled maxlength='19' size=10 name="phno"  onkeypress="onlydigit();"  value="" /></td>
                </tr>
                 <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Telno_Mob</span> &nbsp;</th>
                    <td colspan="2"><input type="text" disabled id="telno_mob" maxlength='10'   size=10 name="telno_mob" onkeypress="onlydigit();"  readonly value="" /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Source</th>
                    <td colspan="2">

                            <select id="source"  name="source">
                                <option value="COUNTER" SELECTED>COUNTER</option>

                            </select><input type="hidden" id="h_source" name="h_source" value="" />
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Name of Complainant</span> &nbsp;</th>
                    <td colspan="5">
                        <input type="text" id="nm_cmplnt"  disabled maxlength='50' size=50 name="nm_cmplnt" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" />
                        &nbsp; &nbsp; <div id="stat" style="display:inline"> </div>
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Mail Address</span></span> &nbsp;</th>
                    <td colspan="5">
                         <textarea id="compl_addr"  disabled cols=32 rows="3" name="compl_addr"  style="text-transform: uppercase" onkeypress="disableSingleQuote()" ></textarea><br>

                    </td>
                </tr>

                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Supply Type</span></th>
                    <td colspan="2"><select id="sup_type" disabled name="sup_type">
                            <option value="UG">UG</option>
                            <option value="OH" selected>OH</option>
                        </select></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Supply Mode</span></th>
                    <td colspan="2"><select id="sup_mode" disabled name="sup_mode">
                            <option value="AC">AC</option>
                         </select>
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Refd By</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="refdby" disabled name="refdby" value="" size="10" maxlength="10" style="text-transform: uppercase" onkeypress="disableSingleQuote()"  /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Refd To</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="refdto" disabled maxlength='10' size=10 name="refdto" style="text-transform: uppercase" value="" onkeypress="disableSingleQuote()"  /></td>

                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Letter No</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="letno" disabled name="letno" value="" size="10" maxlength="10" style="text-transform: uppercase" onkeypress="disableSingleQuote()"  /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp; Letter Date</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="letdt" disabled maxlength='10' size=10 name="letdt"  value="" readonly /></td>

                </tr>
                <tr>
                    <th ALIGN="RIGHT">&nbsp;<span class="style1"> Complaint Remarks </span>&nbsp;</th>
                    <td colspan="5">
                        <textarea name="crcmpl" id="crcmpl" disabled cols="120" rows="2"  onkeypress="disableSingleQuote()"   ></textarea>
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT">&nbsp;</th>
                    <td colspan="5">&nbsp;                   </td>
                </tr>
                 <tr style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#d7cee8+1,f3c5f9+100,b321e0+100,71ceef+100,b7deed+100,c785dd+100,c785dd+104,cca0db+105,c67edd+105,c67edd+105 */
background: #d7cee8; /* Old browsers */
background: -moz-linear-gradient(left, #d7cee8 1%, #f3c5f9 100%, #b321e0 100%, #71ceef 100%, #b7deed 100%, #c785dd 100%, #c785dd 104%, #cca0db 105%, #c67edd 105%, #c67edd 105%); /* FF3.6-15 */
background: -webkit-linear-gradient(left, #d7cee8 1%,#f3c5f9 100%,#b321e0 100%,#71ceef 100%,#b7deed 100%,#c785dd 100%,#c785dd 104%,#cca0db 105%,#c67edd 105%,#c67edd 105%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to right, #d7cee8 1%,#f3c5f9 100%,#b321e0 100%,#71ceef 100%,#b7deed 100%,#c785dd 100%,#c785dd 104%,#cca0db 105%,#c67edd 105%,#c67edd 105%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d7cee8', endColorstr='#c67edd',GradientType=1 ); /* IE6-9 */">
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;  Action Date:</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="actdt"  name="actdt" value="" size="10" maxlength="10"  value="<%= sysdt%>" onclick="javascript:NewCssCal('actdt','ddMMYYYY');" /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp; Call Closing Remarks</span> &nbsp;</th>
                    <td colspan="2"> <textarea name="closermk" id="closermk"  cols="60" rows="1"  onkeypress="disableSingleQuote()"   ></textarea></td>

                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <input type="button"  class="css_btn_class" id="btn_sub" name="btn_sub" value="UPDATE" onclick="sv_Entry();" />&nbsp;&nbsp;
                        <input type="button"  class="css_btn_class" id="btn_rest" name="btn_rest" value="Reset"  onclick="window.location.reload();" />&nbsp;&nbsp;
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


    </form>

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

