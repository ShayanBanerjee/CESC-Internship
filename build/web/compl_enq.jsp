<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">

    <meta name="author" content="">
<html>
    <head>
        <SCRIPT type='text/javascript' src='datetimepicker_css.js'></SCRIPT>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Complaint Entry</title>
<script src="jquery.min.js"></script>
    <meta name="author" content="">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/mootools/1.3.2/mootools-yui-compressed.js"></script>
    <script type="text/javascript" src="https://raw.github.com/monkeyphysics/mootools-datepicker/master/datepicker.js"></script>
    <link type="text/css" rel="stylesheet"
   href="https://raw.github.com/monkeyphysics/mootools-datepicker/master/datepicker.css">        
<html>
    <head>
        <SCRIPT type='text/javascript' src='datetimepicker_css.js'></SCRIPT>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>__Complaint Entry</title>
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
         background-color: #E8F6F3;
          font-size: 15px;
	  font-family: "Arial";
    }
.style2 {color: #0E6655;font-size: 12px;font-family: "Verdana";font-weight:bold}
.style3 {color: #000000;font-size: 14px;font-family: "Verdana";font-weight:bold}
.tableClass{font-family:Cursive;
           background-color: #884EA0;
           color: #FFFFFF;
           height:55px;
           font-size: 0.9em;}
-->
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
   

       var x;

            function writeFunction(){
                var hey= document.getElementById("DateSelection").value;
                if(hey=="RECDT"){
                    document.getElementById("writehere").innerHTML = "Receive Date";
                }
                else{
                    document.getElementById("writehere").innerHTML = "Action Date";
                }
            }

//////////////////////////////////////

function giveStatusVal(){
    status= document.getElementById("status").value;
}
function ctypeSelect(){
    var ctype = document.getElementById("ctype").value;

}
var rb;
function Valuefetch(){


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
                {
                    alert("inside if");
                    alert("Browser does not support XMLHTTP Request");
                    return

                 }
              
                   var fromDate = document.getElementById("rcvdt1").value;
                   var toDate = document.getElementById("rcvdt2").value;
                   var status = document.getElementById("status").value;
                   var datetype= document.getElementById("DateSelection").value;
                   var ctype= document.getElementById("ctype").value;
                   

                   //this is the starting of loading
                   
                   //ending of loading
                   url='date_entry.jsp?fromDate='+fromDate+'&toDate='+toDate+'&status='+status+'&datetype='+datetype+'&ctype='+ctype;
                   //alert(url);

                   document.getElementById("grid1").innerHTML='<br><br><br><br><br><img src=loading.gif />';
                 
                rb.onreadystatechange = stateChangerb;
                rb.open("GET", url, true);
                rb.send(null);
            }

           function stateChangerb()
            {
                if (rb.readyState==4 || rb.readyState=="complete")
                {

                    var str=rb.responseText.split("$$_$$")
                    
                   if(str[0].substring(0,1)=="E")
                    {
                        alert(rb.responseText.split("$$_$$")[1])
                        return false
                    }
                    var s=rb.responseText.split("$$_$$");
                 //  alert(s)
                      //  str.append(rs.getString("name1")+"$$_$$"+rs.getString("appldt")+"$$_$$"+rs.getString("PHONE_NO")+"$$_$$"+rs.getString("MOBILE_NO")+"$$_$$");
                         //    str.append(rs.getString("email")+"$$_$$"+rs.getString("addres")+"$$_$$"+rs.getString("REQFOR")+"$$_$$"+rs.getString("SUPPLY_TY")+"$$_$$");
//
              //  alert(s[0]);
                   document.getElementById("grid1").innerHTML=s[0];



                }
            }
            //----------
   </script>

   <script type="text/javascript">
     new DatePicker('.picker', {
     pickerClass: 'datepicker ',
     allowEmpty: true
     });
   </script>
</head>

<body bgcolor="#39CCCC")>
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


   <div id="wrapper">

<form name="fentry"  method="post">
<jsp:include page="navbar.jsp?suser=<%=suser%>&soffcd=<%=soffcd%>" />
   <!-- Page Content -->
         <div  id="page-wrapper" style="/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#dceaef+1,d8ffdd+100 */

background: #dceaef; /* Old browsers */
background: -moz-linear-gradient(top, #dceaef 1%, #d8ffdd 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #dceaef 1%,#d8ffdd 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #dceaef 1%,#d8ffdd 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dceaef', endColorstr='#d8ffdd',GradientType=0 ); /* IE6-9 */">
            <div class="row">
                <div class="col-lg-12" align="center">
                    <input type="hidden" name="ecd" id="ecd" value="adm-a1" />
                    <input type="hidden" name="ofcd" id="ofcd" value="2107210" />
                    <input type="hidden" name="napsid" id="napsid"  />
                    <span class="style3"> <font  align="centre" size="4" color="#08357c">COMPLAINT REPORT MODULE</font> </span>
                </div>

                <!-- /.col-lg-12 -->
            </div>
           <%
                 Statement st1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                String sysdatesql="select to_char(sysdate,'dd/mm/yyyy')sdate from dual";
                String str2="";
                ResultSet rs1=null;
                        rs1 = st1.executeQuery(sysdatesql);
                        if(rs1.next()){
                            str2=rs1.getString("sdate");
                            }
                        rs1.close();
                        st1.close();
            %>
            <div id="dv_msg" style="display: none;background-color: #ffff00;height: 35px;top:350px;z-index: 50; position: fixed;width:100%">
            </div><br>
           <table align="center" width="100%" cellpadding="1" cellspacing="0" style="border:2px solid #ffffff;"  border="1" bgcolor="#E8F8F5" bordercolor="ffffff">
                <tr class="style1">
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;Date Selection</span></span> &nbsp;</th>
                    <td colspan="2">
                        <select class="style2" id="DateSelection" name="date type" onchange="writeFunction()">
                          <option value="RECDT" name="Receive Date" selected>Receive Date</option>
                          <option value="ACTDT" name="Action Date">Action Date</option>
                        </select>
                    </td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;<div id="writehere" style="display:inline">Receive Date</div> From </span></span> &nbsp;</th>
                    <td colspan="2"><input type="text"  id="rcvdt1" maxlength='10' size=10  name="rcvdt1" readonly value="<%=str2%>" onclick="NewCssCal('rcvdt1','ddMMYYYY');"  /></td>
                    <th ALIGN="RIGHT"><span class="style1"> &nbsp;To </span>&nbsp;</th>
                    <td colspan="2"><input type="text"  id="rcvdt2" maxlength='10' size=10  name="rcvdt2" readonly value="<%=str2%>" onclick="NewCssCal('rcvdt2','ddMMYYYY'); " />
                    <input type="button"  class="css_btn_class" id="btn_search" name="btn_search" value="Search"  onclick="Valuefetch()" />&nbsp;&nbsp;
                    <input type="button"  class="css_btn_class" id="btn_rest" name="btn_rest" value="Reset"  onclick="window.location.reload();" />&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT" class="style1"><span> &nbsp;Complaint Type </span> &nbsp;</th>
                    <td colspan="2" class="style1">
                        <select class="style2" name="complaint type" id="ctype" onchange="ctypeSelect()">
                          <option value="0" selected>ALL</option>
                                <%
                String sql="select CODE,DESCRIP from compl_type order by 1";
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
                    <th ALIGN="RIGHT" class="style1"><span> &nbsp;Action Status</span> &nbsp;</th>
                    <td colspan="2" bordercolor="#839192" class="style1">
                        <select name="status" class="style2" id="status" onchange="giveStatusVal()">
                          <option value="0" selected>ALL</option>
                          <option value="RESOLVED">RESOLVED</option>
                          <option value="PENDING">PENDING</option>
                        </select>
                    </td>
                </tr>
             
                 <tr>

                </tr>
            </table>
            <br><br>

        
            <table class="tableClass"  border=3 bordercolor="#FAD7A0">
                 <tr><th width='50px'style=' text-align:center'>Sl.No</th>
                 <th width='95px' style='text-align:center''>Complaint Number</th>
                 <th width='126px'style='text-align:center'>Complain Type<br> & Description</th>
       <!--          <th width='120px' style='text-align:center'>Name <br>& Address</th>  -->
        <!--         <th width='140px' style='text-align:center'>Phone no<br>& Mobile No<br>& Email</th>  -->
                 <th width='130px' style='text-align:center'>NAPS Request ID/<br> KNO</th>
                 <th width='90px' style='text-align:center'>Receive date</th>
                 <th width='80px' style='text-align:center'>Refer to</th>
                 <th width='135px' style='text-align:center'>Complainant's Name<br>&  Details</th>
                 <th width='90px' style='text-align:center'>Escalated to</th>
                 <th width='70px' style='text-align:center'>Status</th>
                 <th width='85px' style='text-align:center'>Action Date</th>
                 <th width='90px' style='text-align:center'>Resolved at Counter</th>
    <!--             <th width='90px' style='text-align:center'>Closing Remarks<br>(if any)</th></tr>  -->
            </table>  
        <div id="grid1" style="overflow:scroll; height: 300px; width:1060px; background-color:#FEF5E7">
        </div>
    </div>
        <!-- /#page-wrapper -->

<%
}catch(Exception e){
    out.print(e);
    }
                finally{
                    conn.close();
                    mk.con.close();
                    }
%>
    </form>


    </div>
    <!-- /#wrapper -->



    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>


<jsp:include page="footer.jsp" />
</body>

</html>

