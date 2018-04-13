<%--
    Document   : ComplNumInter
    Created on : 11 Jun, 2017, 4:12:15 PM
    Author     : roshni
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
                String napsid = request.getParameter("napsid");

                String flag = request.getParameter("flag");

                String sql = "";
                String sql2="";
                response.setContentType("text/html");
                response.setHeader("Cache-Control", "no-cache");

                //-----------------------by Roshni------------------------------
                try {

                    StringBuffer str = new StringBuffer("");
                    StringBuffer str1=new StringBuffer("");
                    if(flag.equals("1")){
                    int count = 0;
                    int count1 = 0;

//out.print(sql);

                     sql = " select count(*) from COMPL_DETAILS where NAPS_REQUEST_ID= '" + napsid + "' ";

                    out.print(sql);
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery(sql);
// for the 2nd sql ....the table
                      if (rs.next()) {
                        count = rs.getInt(1);
                    }

                    rs.close();
                    st.close();
  //for the 2nd sql

                    sql2="select count(*) from COMPL_DOC_DETAILS where CNO='"+cno+"' ";
                    out.print(sql2);
                    Statement st1 = conn.createStatement();
                    ResultSet rs1 = st1.executeQuery(sql2);
//this if for the 1st result set

                      if (rs1.next()) {
                        count1 = rs1.getInt(1);
                    }

                    rs1.close();
                    st1.close();

 //remove this above block
                    if (count > 0) {

                        sql = "select nvl(NAPS_REQUEST_ID,' ')NAPSID,nvl(KNO,0)KNO,"
                                + " (SELECT descrip FROM COMPL_TYPE WHERE CODE=CTYPE)ctype,(SELECT descrip FROM COMPL_CATEGORY WHERE CODE=CATEGORY AND COMPL_TYPE=CTYPE)cCategory,to_char(CRT_DT,'dd/mm/yyyy')CRT_DT,nvl(letno,' ')letno,"
                                + "  nvl(NAME1,'--')NAME1,nvl(ACTADD1,'--')ACTADD1,nvl(COMPL_NAME,'--')CNAME,nvl(COMPL_ADDR,'--')CADD,to_char(RECDT,'dd/mm/yyyy')recdt,"
                                + "  nvl(REFBY,' ')REFBY,nvl(REFTO,'--')REFTO,ADD_TO,nvl(LPNO,'--')LP,trim(activity_id)ACT,"
                                + "  nvl(REMRKS,' ')REMRKS,nvl(PHONE_NO ,' ')PH,nvl(MOBILE_NO,' ')MOB,nvl(EMAIL,' ')EMAIL,"
                                + "  supply_type,supply_mode,nvl(source,'--')source,nvl(to_char(LETDT,'dd/mm/yyyy'),'--')LETDT,REFTO,ADD_TO,nvl(to_char(ACTDT,'dd/mm/yyyy'),'--')actdt,nvl(CLOSEREMK,'--')CLOSEREMK,"
                                + "  nvl(ref_remk,'--')refremk "
                                + "  from compl_details where COMPL_NO='" + cno + "'";

                        st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                             str.append(rs.getString("NAPSID")+"$$_$$"+rs.getString("KNO")+"$$_$$"+rs.getString("ctype")+"$$_$$"+rs.getString("cCategory")+"$$_$$");
                             str.append(rs.getString("NAME1")+"$$_$$"+rs.getString("ACTADD1")+"$$_$$"+rs.getString("CNAME")+"$$_$$"+rs.getString("CADD")+"$$_$$");
                             str.append(rs.getString("recdt")+"$$_$$"+rs.getString("REFBY")+"$$_$$"+rs.getString("REFTO")+"$$_$$"+rs.getString("ADD_TO")+"$$_$$");
                             str.append(rs.getString("LP")+"$$_$$"+rs.getString("REMRKS")+"$$_$$"+rs.getString("PH")+"$$_$$"+rs.getString("MOB")+"$$_$$");
                             str.append(rs.getString("email")+"$$_$$"+rs.getString("CRT_DT")+"$$_$$"+rs.getString("letno")+"$$_$$"+rs.getString("ACT")+"$$_$$");
                             str.append(rs.getString("supply_type")+"$$_$$"+rs.getString("supply_mode")+"$$_$$"+rs.getString("source")+"$$_$$"+rs.getString("LETDT")+"$$_$$");
                             str.append(rs.getString("REFTO")+"$$_$$"+rs.getString("ADD_TO")+"$$_$$"+rs.getString("actdt")+"$$_$$"+rs.getString("CLOSEREMK")+"$$_$$");
                             str.append(rs.getString("refremk")+"$$_$$");
                        }
                        rs.close();
                        st.close();

                    }
                    else{
                        str.append("E$$_$$No records found for Complaint Number "+cno);
                    }
//this is for the 2nd sql block
                    if (count1 > 0) {
                        int i=0;
                        sql2 = "select DOC_NAME,to_char(CRT_DT,'dd/mm/yyyy')CRT_DT from COMPL_DOC_DETAILS where cno='"+cno+"'";
                        st1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        rs1 = st1.executeQuery(sql2);
                       str1.append("<table id='upl_docs' class='table table-striped table-bordered table-hover'>");
                        while (rs1.next()) {
                            i++;
                            str1.append("<tr><td width='95'>"+"<div style='color:#7B241C'>"+i+"</div>"+"</td>");
                             str1.append("<td width='500'>"+"<div style='color:#7B241C'>"+"<a href='../upload/"+rs1.getString("DOC_NAME")+"' target='_blank'>"+rs1.getString("DOC_NAME")+"</a>"+"</div>"+"</td>");
                             str1.append("<td>"+"<div style='color:#7B241C'>"+rs1.getString("CRT_DT")+"</div>"+"</td></tr>");
                        }
                        str1.append("</table>");
                        rs1.close();
                        st1.close();

                    }
                    else{
                        str1.append("E$$_$$No records found for Complaint Number "+cno);
                    }

//2nd sql block ends here

                    }
                        str.append(str1);
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