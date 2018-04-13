
<%--
    Document   : rb_kchs_edit_save
    Created on : 11 Jun, 2017, 5:04:15 PM
    Author     : roshni
--%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>

<%@ page import="KotaChsConnectionPackage.*" %>

<%try {
            MakeConnectionKotaChs mk = new MakeConnectionKotaChs();
            Connection conn = mk.con;
            String sql=null;
            response.setContentType("text/html");
            response.setHeader("Cache-Control", "no-cache");

            try {
                String  log_usr = new String(""), actdt = new String(""), cremk = new String(""), mcip = new String("");

                String OFICID = request.getParameter("ofcd");


                if (request.getParameter("ecd") != null) {
                    log_usr = request.getParameter("ecd");
                } else {
                    log_usr = "";
                }
                mcip = request.getRemoteAddr();
                mcip = log_usr + "-" + mcip;

                if (request.getParameter("actdt") != null) {
                    actdt = request.getParameter("actdt") ;
                }
                cremk = request.getParameter("closermk") ;
                cremk = cremk.replace("\n", " ");
                cremk = cremk.replace("\r", " ");
                cremk = cremk.replace("'", "''");

                out.println("#### ROSHNI rmk=" + cremk);
                if (cremk != null && cremk.length() > 498) {
                    System.out.println("#### huge length of  rmk=" + cremk);
                    cremk = cremk.substring(0, 498);
                }//roshni

                Statement st = null;
                    try {
               // out.println("<br><Br>-----BY ROSHNI-------");
                    conn.setAutoCommit(false);

                    String compl_no = "CN-" + request.getParameter("cno") ;


                    sql = "update CHS.COMPL_DETAILS set ACTDT=to_date('" + actdt + "','dd/mm/yyyy'), CLOSEREMK='" + cremk + "'"
                            + ",  upd_DT=sysdate, upd_BY='" + mcip + "',activity_id='2',STATUS='ATTENDED'"
                            + " where COMPL_NO='" + compl_no + "' and trim(activity_id)='1'";//for pending cases only

                    st = conn.createStatement();
                    int r1 = st.executeUpdate(sql);
                    st.close();

                    conn.commit();
 
                    response.getWriter().println("Action Date Updated successfully for Complaint No  " + compl_no  +"$$_$$"+compl_no+"$$_$$"+OFICID+"$$_$$");


//----------------roshni-------------------

                } catch (Exception e) {
                    response.getWriter().println("E$$_$$Some error occurred:\n\n" + e + "...\n" + sql);

                    conn.rollback();

                } finally {
                    if (conn != null) {
                        conn.close();
                    }
                    conn = null;
                    if (st != null) {
                        st.close();
                    }
                    st = null;
                   

                }



            } catch (Exception e) {
               response.getWriter().println("E$$_$$Some error occurred:\n\n" + e );
            } finally {
                conn.close();
                mk.con.close();
            }
           } catch (Exception e) {
               out.println("E$$_$$Some error occurred:WW" + e );
            }
%>