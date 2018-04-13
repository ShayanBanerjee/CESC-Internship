<%--
    Document   : date_entry
    Created on : 9 Jun, 2017, 3:34:51 PM
      Author     : Shayan Banerjee
--%>



<%@ page import="java.util.*" %>
<%@ page import="java.sql.*,java.text.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="KotaChsConnectionPackage.*" %>

<%
 MakeConnectionKotaChs mk = new MakeConnectionKotaChs();
                Connection conn = mk.con;
                try {
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");
                String status=  request.getParameter("status");
                String datetype= request.getParameter("datetype");          
                String ctype=request.getParameter("ctype");
                String sql = "";

                response.setContentType("text/html");
                response.setHeader("Cache-Control", "no-cache");

                //-----------------------by Roshni------------------------------
                try {

                    StringBuffer str = new StringBuffer("");
                    
                    int count = 0;
                    sql = "SELECT count(*) FROM COMPL_DETAILS WHERE TRUNC("+datetype+") BETWEEN TO_DATE('"+fromDate+"','DD/MM/YYYY') AND TO_DATE('"+toDate+"','DD/MM/YYYY')  ";
                    if(ctype.equals("0")){}
                    else{
                        sql=sql+ " AND CTYPE="+ctype+"";
                    }
                    if(status.trim().equals("0")){}
                    else{
                         sql=sql+" AND STATUS='"+status+"'";
                    }

                    out.print(sql);
                    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    ResultSet rs = st.executeQuery(sql);
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }

                    rs.close();
                    st.close();
                    int i=0;
                    if (count > 0) {

                        str.append("<table style='font-family:arial; background-color: 	#FBFCFC; text-align:centre; font-size: 0.85em' border='1'>");

                        sql = "SELECT  COMPL_NO,"
                                + "(SELECT descrip FROM COMPL_TYPE WHERE CODE=CTYPE)ctype,"
                                + "(SELECT descrip FROM COMPL_CATEGORY WHERE CODE=CATEGORY AND COMPL_TYPE=CTYPE)cCategory,"
                                + "NVL( TO_CHAR(NAME1), '--' )NAME1,"
                                + "NVL( TO_CHAR(ACTADD1), '--' )ACTADD1,"
                                + "NVL( TO_CHAR(PHONE_NO), '--' )PHONE_NO,"
                                + "NVL( TO_CHAR(MOBILE_NO), '--' )MOBILE_NO,"
                                + "NVL( TO_CHAR(EMAIL), '--' )EMAIL,"
                                + "decode(NAPS_REQUEST_ID,null,'--',NAPS_REQUEST_ID)NAPS_REQUEST_ID,"
                                + "decode(KNO,null,'--',KNO)KNO,"
                                + "To_CHAR(RECDT,'DD/MM/YYYY')RECDT,"
                                + "NVL(REFTO,'--')REFTO,"
                                + "NVL(ADD_TO,'--')ADD_TO,"
                                + "NVL( TO_CHAR(COMPL_NAME), ' ' )COMPL_NAME,"
                                + "NVL( TO_CHAR(COMPL_ADDR), ' ' )COMPL_ADDR,"
                                + "NVL( TO_CHAR(STATUS), ' ' )STATUS,"
                                + "decode(ACTDT,null,'--',TO_CHAR(ACTDT,'DD/MM/YYYY'))ACTDT,"
                                +"NVL(RESOLVED_COUNTER,'--')RESOLVED_COUNTER"
                       //         + "decode(CLOSEREMK,null,'--',CLOSEREMK)CLOSEREMK"
                                + " FROM COMPL_DETAILS WHERE TRUNC("+datetype+") BETWEEN TO_DATE('"+fromDate+"','DD/MM/YYYY') AND TO_DATE('"+toDate+"','DD/MM/YYYY') ";
                                if(ctype.equals("0")){}
                                else{
                                    sql=sql+ " AND CTYPE="+ctype+"";
                                }
                                if(status.equals("0")){}
                                else{
                                    sql=sql+" AND STATUS='"+status+"'";
                                }



                        String MAJORZN = "";
                        
                        st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        rs = st.executeQuery(sql);
                        
                        while(rs.next()) {
                            i++;
                            str.append("<tr><td width='50px'>"+"<div style='color:#7B241C'>"+i+"</div>"+"</td>"
                                    + "                    <td  width='95px' style='text-align:center'><a href='complNumber.jsp?complNum="+rs.getString("COMPL_NO")+"' target='_blank'>"+rs.getString("COMPL_NO")+"</a></td>"
                                    + "                    <td width='127px' style='text-align:center'>"+"<div style='color:#0000FF'>"+rs.getString("ctype")+"</div>"+"<br>"+rs.getString("cCATEGORY")+"</td>"
                                    + "                    <td width='128px' style='text-align:center'><a href='NapsDataSearch.jsp?nrid="+rs.getString("NAPS_REQUEST_ID")+"<div style='color:#AF601A'>"+rs.getString("NAPS_REQUEST_ID")+"</div>"+"<br>"+rs.getString("KNO")+"</td>"
                                    + "                    <td width='90px' style='text-align:center'>"+rs.getString("RECDT")+"</td>"
                                    +"                     <td width='80px' style='text-align:center'>"+rs.getString("REFTO")+"</td>"
                                    + "                    <td width='135px' style='text-align:center'>"+"<div style='color:#0000FF'>"+rs.getString("COMPL_NAME")+"</div>"+"<br>"+rs.getString("COMPL_ADDR")+rs.getString("ACTADD1")+"<div style='color:#06490e'>"+rs.getString("MOBILE_NO")+"</div>"+"</td>"
                                   +  "                    <td width='89px' style='text-align:center'>"+rs.getString("ADD_TO")+"</td>"
                                    + "                    <td width='70px' style='text-align:center'>"+rs.getString("STATUS")+"</td>"
                                    + "                    <td width='85px' style='text-align:center'>"+rs.getString("ACTDT")+"</td>"
                                    + "                    <td width='89px' style='text-align:center'>");
                                    /*+rs.getString("ACTDT")*/
                                    if(rs.getString("RESOLVED_COUNTER").equals("Y")){
                                        str.append("YES");
                                    }
                                    else if(rs.getString("RESOLVED_COUNTER").equals("N")){
                                        str.append("NO");
                                    }
                                    else{
                                        str.append(" "+rs.getString("RESOLVED_COUNTER"));
                                    }
                                    str.append("</td></tr>");
                              //      + "                    <td width='60px' style='text-align:center'>"+rs.getString("CLOSEREMK")+"</td>"
                                     


                          
                        }
                        rs.close();
                        st.close();
                        str.append("</table>");
                    }
                    else{
                        str.append("No records found $$$#");
                    }


               
                    response.getWriter().println(str + "$$_$$");


                } catch (Exception es) {
                    response.getWriter().println("E$$_$$Some error occurred:\n\n" + es + "...\n" + sql);
                   
                } finally {
                    try {
                         conn.close();
                        mk.con.close();

                    } catch (Exception e) {
                    }
                }
            } catch (Exception e) {
                response.getWriter().println("E$$_$$Some error occurred:\n\n" + e);
            }
%>