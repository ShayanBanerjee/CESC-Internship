<%-- 
    Document   : rb_kchs_edit_det
    Created on : 11 Jun, 2017, 4:12:15 PM
    Author     : roshni
--%>

<%--
    Document   : rb_entry_det
    Created on : 9 Jun, 2017, 3:34:51 PM
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
                String cno = request.getParameter("cno");
                String flag = request.getParameter("flag");

                String sql = "";
                response.setContentType("text/html");
                response.setHeader("Cache-Control", "no-cache");

                //-----------------------by Roshni------------------------------
                try {

                    StringBuffer str = new StringBuffer("");

                    if(flag.equals("1")){
                    int count = 0;
                    sql = "select count(*) from compl_details where COMPL_NO= '" + cno + "' "
                            + "  ";
                    //out.print(sql);
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }

                    rs.close();
                    st.close();

                    if (count > 0) {

                        sql = "select nvl(NAPS_REQUEST_ID,' ') NAPSID,nvl(KNO,0) KNO,"
                                + "   (SELECT descrip FROM COMPL_TYPE WHERE CODE=CTYPE)ctype,(SELECT descrip FROM COMPL_CATEGORY WHERE CODE=CATEGORY AND COMPL_TYPE=CTYPE)cCategory,to_char(CRT_DT,'dd/mm/yyyy') CRT_DT,nvl(letno,' ') letno,"
                                + "  NAME1,ACTADD1,nvl(COMPL_NAME,' ') CNAME,nvl(COMPL_ADDR,' ') CADD,to_char(RECDT,'dd/mm/yyyy') recdt,"
                                + "  nvl(REFBY,' ') REFBY,nvl(REFTO,' ') REFTO ,ADD_TO ,nvl(LPNO,' ') LP,trim(activity_id) ACT,"
                                + "  nvl(REMRKS,' ') REMRKS,nvl(PHONE_NO ,' ') PH,nvl(MOBILE_NO,' ') MOB,nvl(EMAIL,' ') EMAIL"
                                + "  supply_type,supply_mode,source,LETNO,LETDT,REFTO,ADD_TO,REMRKS,ACTDT,CLOSEREMK"
                                + "  from compl_details where COMPL_NO='" + cno + "'";
                        
                        st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                             str.append(rs.getString("NAPSID")+"$$_$$"+rs.getString("KNO")+"$$_$$"+rs.getString("CTYPE")+"$$_$$"+rs.getString("CATEGORY")+"$$_$$");
                             str.append(rs.getString("NAME1")+"$$_$$"+rs.getString("ACTADD1")+"$$_$$"+rs.getString("CNAME")+"$$_$$"+rs.getString("CADD")+"$$_$$");
                             str.append(rs.getString("recdt")+"$$_$$"+rs.getString("REFBY")+"$$_$$"+rs.getString("REFTO")+"$$_$$"+rs.getString("ADD_TO")+"$$_$$");
                             str.append(rs.getString("LP")+"$$_$$"+rs.getString("REMRKS")+"$$_$$"+rs.getString("PH")+"$$_$$"+rs.getString("MOB")+"$$_$$");
                             str.append(rs.getString("email")+"$$_$$"+rs.getString("CRT_DT")+"$$_$$"+rs.getString("letno")+"$$_$$"+rs.getString("ACT")+"$$_$$");
                             str.append(rs.getString("supply_type")+"$$_$$"+rs.getString("supply_mode")+"$$_$$"+rs.getString("source")+"$$_$$"+rs.getString("LETNO")+"$$_$$");
                             str.append(rs.getString("LETDT")+"$$_$$"+rs.getString("REFTO")+"$$_$$"+rs.getString("ADD_TO")+"$$_$$"+rs.getString("REMRKS")+"$$_$$");
                             str.append(rs.getString("ACTDT")+"$$_$$"+rs.getString("CLOSEREMK")+"$$_$$");
                        }
                        rs.close();
                        st.close();

                    }
                    else{
                        str.append("E$$_$$No records found for Complaint Number "+cno);
                    }


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