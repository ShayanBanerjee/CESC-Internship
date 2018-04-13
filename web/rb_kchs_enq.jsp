<%-- 
    Document   : rb_kchs_enq
    Created on : 7 Jun, 2017, 6:40:03 PM
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
        <SCRIPT type='text/javascript' src='datetimepicker_css.js'></SCRIPT>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>COMPLAINT HANDLING SYSTEM</title>
<script src="jquery.min.js"></script>

    <jsp:include page="header.jsp" />
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

    <input type="hidden" name="ecd" id="ecd" value="<%//=suser%>" />
    <input type="hidden" name="ofcd" id="ofcd" value="<%//= soffcd%>" />
        <span class="style3"> <font size="4" color="4E2722">COMPLAINT ENQUIRY MODULE</font>
                                             </span>

                                            <hr color="911D0E">
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
                            <center>
                                <table align="center" width="100%" cellpadding="1" cellspacing="0" style="border:2px solid #ffffff"  border="1" bgcolor="#EBECF2" bordercolor="ffffff">
                   <tr>
                    <th bgcolor="ffcc99" ALIGN="RIGHT" colspan="2"><span class="style1">Complaint Number </span></span> &nbsp;</th>
                    <td  bgcolor="ffffcc" colspan="4" align="center"><input type="text" id="cno" maxlength='20' size=20 readonly name="cno"   />
                        &nbsp;&nbsp;<input type="button" value="Search">
                    </td>
                    </tr>
                                    <tr>
                    <th ALIGN="RIGHT"><span class="style1">Received On </span></span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="rcvddt" maxlength='10' size=10 readonly name="rcvddt" value="<%= sysdt%>" onclick="javascript:NewCssCal('rcvddt','ddMMYYYY','','','','','past');"  /></td>
                    <th ALIGN="RIGHT"><span class="style1">Entered On </span>&nbsp;</th>
                    <td colspan="2"><input type="text" id="entrdt" maxlength='10' size=10 readonly name="entrdt" value="<%= sysdt%>"/></td>
                </tr>

                <tr >
                   <th ALIGN="RIGHT" width="20%" ><span class="style1">Complaint Type</span> &nbsp;</th>
                    <td width="15%" colspan="2">
                        <select id="ctype"  name="ctype" onchange="showSub(this.value)">
                             <option value="NAPS" selected>New Application Complaint from NAPS</option>
                            <option value="OTH">Other Technical Complaints</option>

                        </select>
                    </td>
                    <th ALIGN="RIGHT" width="15%" ><span class="style1">Complaint Category</span> &nbsp;</th>
                    <td width="20%" colspan="2">
                        <div style="display:inline"  id="subcat">
                        <select id="cat"  name="ctype">
                            <option value=""></option>
                            <option value="N1">Applied but Demand not Recvd.</option>
                            <option value="N2">Paid but Supply not Recvd.</option>

                        </select>
                            </div>
                    </td>
                 </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Cons No.</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="consno" name="consno" onkeypress="onlydigit();" onchange="chkCons();" value="" size="11" maxlength="11" />
                    </td>
                    <th ALIGN="RIGHT"><span class="style1">NAPS Request ID.</span> &nbsp;</th>
                    <td colspan="2">
                        <input type="text" id="mrdst" maxlength='2' size=7 readonly name="mrdst" value="<%=soffcd%>" onkeypress="onlydigit();"  />
                        <strong><font size="4px">/</font></strong><input type="text" id="mrref" maxlength='5' size=5 name="mrref" value="" onkeypress="onlydigit();"  />
                        <strong><font size="4px">/</font></strong><input type="text" id="mryr" maxlength='2' size=2 name="mryr" value="" onkeypress="onlydigit();" onblur="chkMRexist();" />
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT" width="15%" ><span class="style1">Addressed To</span> &nbsp;</th>
                    <td width="15%" ><select id="addto"  name="addto">
                            <option value=""></option>
                            <option value="AEN">AEN</option>
                            <option value="CCA">CCA</option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT" rowspan="2"><span class="style1">Name & Address </span> &nbsp;</th>
                    <td colspan="2" valign="top" rowspan="2">
                        <input type="text" id="nm1" maxlength='24' size=24 name="nm1" value="" onchange="enbl_disbl('RS');" style="text-transform: uppercase" onkeypress="disableSingleQuote()"  /><br>
                        <input type="text" id="nm2" maxlength='24' size=24 name="nm2" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" /><br>
                        <input type="text" id="add1" maxlength='24' size=24 name="add1" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" /><br>
                        <input type="text" id="add2" maxlength='24' size=24 name="add2" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" /><br>
                        <input type="text" id="add3" maxlength='24' size=24 name="add3" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" /><br>
                        <input type="text" id="add4" maxlength='24' size=24 name="add4" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" /><br>
                        <input type="text" id="add7" maxlength='24' size=24 name="add7" readonly value="" />
                    </td>
                    <th ALIGN="RIGHT"><span class="style1">Application Date:</span></th>
                    <td colspan="2" valign="middel">
                             <input type="text" id="adt" maxlength='24' size=24 name="adt" value="" /><br>
                      </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Email Id </span>&nbsp;</th>
                    <td colspan="2" valign="middle">
                        <input type="text" id="email" maxlength='100' size=30 name="email" value="" onchange="emailVali();" onkeyup="if (/^\s+|\s+$/g.test(this.value)) this.value=this.value.replace(/^\s+|\s+$/g,'');  " onkeypress="disableSingleQuote()" />
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">L/P No: </span>&nbsp;</th>
                    <td colspan="2"><input type="text" id="lpno" maxlength='21' size=21 name="lpno" value="" onkeypress="disableSingleQuote()" /></td>
                    <th ALIGN="RIGHT"><span class="style1">Phone No.</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="phno" maxlength='19' size=10 name="phno"  onkeypress="onlydigit();"  value="" /></td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Telno_Res</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="telno_res" maxlength='10' size=10 name="telno_res" onkeypress="onlydigit();"  readonly value="" /></td>
                    <th ALIGN="RIGHT"><span class="style1">Telno_Off</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="telno_off" maxlength='10' size=10 name="telno_off"  onkeypress="onlydigit();"  readonly value="" /></td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Telno_Mob</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="telno_mob" maxlength='10' size=10 name="telno_mob" onkeypress="onlydigit();"  readonly value="" /></td>
                    <th ALIGN="RIGHT"><span class="style1">Source</th>
                    <td colspan="2">

                            <select id="source"  name="source">
                                <option value="COUNTER" SELECTED>COUNTER</option>

                            </select><input type="hidden" id="h_source" name="h_source" value="" />
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Name of Complainant</span> &nbsp;</th>
                    <td colspan="5"><input type="text" id="nm_cmplnt" maxlength='30' size=30 name="nm_cmplnt" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" /></td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Mail Address</span></span> &nbsp;</th>
                    <td colspan="5">
                        <input type="text" id="mad1" maxlength='24' size=24 name="mad1" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" />
                        &nbsp;&nbsp;&nbsp;<input type="text" id="mad2" maxlength='24' size=24 name="mad2" value="" style="text-transform: uppercase"onkeypress="disableSingleQuote()"  />
                        <br><input type="text" id="mad3" maxlength='24' size=24 name="mad3" value="" style="text-transform: uppercase" onkeypress="disableSingleQuote()" />
                        &nbsp;&nbsp;&nbsp;<input type="text" id="mad4" maxlength='24' size=24 name="mad4" value="" style="text-transform: uppercase"onkeypress="disableSingleQuote()"  />
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Complaint Code </span>&nbsp;</th>
                    <td colspan="5">
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Supply Type</span></th>
                    <td colspan="2"><select id="sup_type" name="sup_type">
                            <option value="UG">UG</option>
                            <option value="OH">OH</option>
                        </select></td>
                    <th ALIGN="RIGHT"><span class="style1">Supply Mode</span></th>
                    <td colspan="2"><select id="sup_mode" name="sup_mode">
                            <option value="AC">AC</option>
                            <option value="DC">DC</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th ALIGN="RIGHT"><span class="style1">Refd By</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="refdby" name="refdby" value="" size="10" maxlength="10" style="text-transform: uppercase" onkeypress="disableSingleQuote()"  /></td>
                    <th ALIGN="RIGHT"><span class="style1">Refd To</span> &nbsp;</th>
                    <td colspan="2"><input type="text" id="refdto" maxlength='10' size=10 name="refdto" style="text-transform: uppercase" value="" onkeypress="disableSingleQuote()"  /></td>

                </tr>
                <tr>
                    <th ALIGN="RIGHT">&nbsp;<span class="style1"> Complaint Remarks </span>&nbsp;</th>
                    <td colspan="5">
                        <textarea name="crcmpl" id="crcmpl" cols="120" rows="5" onKeyPress='return maxLength(this,490);' onpaste="return maxLengthPaste(this,490);" onkeypress="disableSingleQuote()"   ></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <input type="button" class="buttoncss" id="btn_sub" name="btn_sub" value="Save" onclick="sv_Entry();" />&nbsp;&nbsp;
                        <input type="button" class="buttoncss" id="btn_print" disabled name="btn_print" value="Complaint Slip" onclick="print_slip();" />&nbsp;&nbsp;
                        <input type="button" class="buttoncss" id="btn_rest" name="btn_rest" value="Reset"  onclick="window.location.reload();" />&nbsp;&nbsp;
                        <input type="button" class="buttoncss" value="EXIT" id="btn_resetd" name="btn_resetd" onclick="window.close();" /></td>
                </tr>


            </table>

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
                finally{
                    conn.close();
                    mk.con.close();
                    }
%>

    </form>

    </div>
    <!-- /#wrapper -->

    <jsp:include page="footer.jsp" />

</body>

</html>

