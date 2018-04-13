<%-- 
    Document   : rb_kchs_slip
    Created on : 11 Jun, 2017, 1:14:33 AM
    Author     : roshni bose
--%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <style type="text/css">
            <!--
            .style1 {font-size: 14px;font-family:Arial;}
            .style2 {font-size: 16px;font-family:Arial;color:blue}

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

        <%
                    MakeConnectionKotaChs mk = new MakeConnectionKotaChs();
                    Connection conn = mk.con;
                    String sql = null;
                    try {


                        String cno = request.getParameter("cno");
                        String ofice = request.getParameter("ofice");

                        StringBuffer str = new StringBuffer("");
                        str.append("<br><table border=0 bgcolor=ffffff width=90% align=center style='border:2px solid #000000' cellpadding=0 cellspacing=0><tr bgcolor=ffffff><td>");

                        str.append("<br><table border=0 bgcolor=ffffff width=80% align=center bordercolor=000000 cellpadding=0 cellspacing=0><tr bgcolor=ffffff>");


                        str.append("<td align=left width=10% > ");
                        if (ofice.substring(0, 4).equals("1201")) { //roshni on 27-feb-17
                        } else {
                            str.append("<img src=rpsg.png width=160 height=85>");
                        }
                        str.append(" </td>");
                        str.append("<td align=CENTER width=80% ><span class=style2><b>Complaint Slip </td>");

                        str.append("<td align=left width=10% > ");
                        if (ofice.substring(0, 4).equals("1201")) { //roshni on 27-feb-17
                        } else {
                            str.append("<img src=kota_logo.jpg width=100 height=55>");
                        }
                        str.append("</td></tr>");
                        str.append("<tr><td colspan=3><hr></td></tr></table>");
                        str.append("<table border=0 bgcolor=ffffff width=80% align=center bordercolor=000000 cellpadding=0 cellspacing=0>");

                        sql = "select nvl(NAPS_REQUEST_ID,' ') NAPSID,nvl(KNO,0) KNO,"
                                + "  (select descrip from compl_type where code=ctype) CTYPE,"
                                + "  (select descrip from COMPL_CATEGORY where COMPL_TYPE=ctype and CODE=CATEGORY) CATEGORY,"
                                + "  NAME1,ACTADD1,nvl(COMPL_NAME,' ') CNAME,nvl(COMPL_ADDR,' ') CADD,to_char(RECDT,'dd/mm/yyyy') recdt,"
                                + "  nvl(REFBY,' ') REFBY,nvl(REFTO,' ') REFTO ,ADD_TO ,nvl(LPNO,' ') LP,"
                                + "  nvl(REMRKS,' ') RMK,nvl(PHONE_NO ,' ') PH,nvl(MOBILE_NO,' ') MOB,nvl(EMAIL,' ') EMAIL"
                                + "  from compl_details where COMPL_NO='" + cno + "'";

                        PreparedStatement ps = conn.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            String kno=rs.getString("KNO") == "0" ? "NIL" : rs.getString("KNO");
                            
                            str.append("<tr><td align=center colspan=4> <span class=style1><b><font color=red>Complaint No: <font color=330000>" + cno + "</font></td>");
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                            str.append("<tr><td align=left > <span class=style1><b>Received On: </td><td align=left><span class=style1>" + rs.getString("RECDT") + "</td>");
                            str.append("<td align=left  ><span class=style1><b> Address To: </td><td  align=left><span class=style1>" + rs.getString("ADD_TO") + "</td></tr>");
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                            str.append("<tr><td align=left > <span class=style1><b>NAPS ID: </td><td align=left><span class=style1>" + rs.getString("NAPSID") + "</td>");
                            str.append("<td align=left  > <span class=style1><b>KNO: </td><td  align=left><span class=style1>" + kno + "</td></tr>");
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                            str.append("<tr><td align=left rowspan=4> <span class=style1><b> Name & Address: </td><td align=left rowspan=4><span class=style1>" + rs.getString("NAME1") + "<br><span class=style1>" + rs.getString("ACTADD1") + "</td>");
                            str.append("<td align=left  > <span class=style1><b>Phone: </td><td  align=left><span class=style1>" + rs.getString("PH") + "</td>");
                            str.append("<tr><td align=left  > <span class=style1><b>Mobile: </td><td  align=left><span class=style1>" + rs.getString("MOB") + "</td>");
                            str.append("<tr><td align=left  > <span class=style1><b>Email: </td><td  align=left><span class=style1>" + rs.getString("EMAIL") + "</td>");
                            str.append("<tr><td align=left  > <span class=style1><b>LP No: </td><td  align=left><span class=style1>" + rs.getString("LP") + "</td></tr>");
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                            str.append("<tr><td align=left > <i><span class=style1><b>Complaint Type:</i> </td><td align=left colspan=3><span class=style1>" + rs.getString("ctype") + "</td></TR>");
                            str.append("<tr><td align=left > <i><span class=style1><b>Complaint Category:</i> </td><td align=left colspan=3><span class=style1>" + rs.getString("CATEGORY") + "</td></TR>");

                            if (rs.getString("CNAME") != null && !rs.getString("CNAME").equals("") && !rs.getString("CNAME").equals(" ")) {
                                str.append("<tr><td align='right'>&nbsp;</td><td align='left' colspan='3'>&nbsp;</td></tr>");
                                str.append("<tr><td align='left'><span class=style1><b>Name of Complainant : </b></font></td>");
                                str.append("<td align='left' colspan='3'><span class=style1>" + rs.getString("CNAME") + "<br><span class=style1>" + rs.getString("cadd") + "</font></td> </tr>");

                            }

                            if (rs.getString("rmk") != null) {
                                String remk = rs.getString("rmk").trim();

                                if (remk.length() > 400) {
                                    remk = remk.substring(0, 400);
                                }

                                str.append("<tr><td align='right'>&nbsp;</td><td align='left' colspan='3'>&nbsp;</td></tr>");
                                str.append("<tr><td align='left'><span class=style1><b> Complainant's Remarks : </b></font></td>");
                                str.append("<td align='left' colspan='3'><span class=style1>" + remk + "</font></td>      </tr>");


                            }
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                            str.append("<tr><td colspan=4>&nbsp;</td></tr>");
                        }
                        str.append("</table>");
                        rs.close();
                        ps.close();


                        out.println(str);


                    } catch (Exception es) {
                        out.println("Some error occurred:" + es);
                    } finally {
                        try {
                            conn.close();
                            mk.con.close();

                        } catch (Exception e) {
                        }
                    }

        %>
    </body>
</html>
