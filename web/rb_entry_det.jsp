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
                String kid = request.getParameter("kid");
                String kno = request.getParameter("kno");
                String flag = request.getParameter("flag");
                String ctype =request.getParameter("ctype");

                String sql = "";
                response.setContentType("text/html");
                response.setHeader("Cache-Control", "no-cache");

                //-----------------------by Roshni------------------------------
                try {

                    StringBuffer str = new StringBuffer("");

                    if(flag.equals("2")){
                    int count = 0;
                    sql = "select count(*) from anc.anc_applicant_details where request_id = '" + kid + "' "
                            + "  ";
                    //out.print(sql);
                    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    ResultSet rs = st.executeQuery(sql);
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }

                    rs.close();
                    st.close();

                    if (count > 0) {

                        sql = "SELECT to_char(a.application_dt,'dd/mm/yyyy') appldt,"
                            + "a.PERSON_INITIAL ||' '|| a.FIRST_NAME||' '||a.MIDDLE_NAME||' ' ||a.LAST_NAME name1,a.PHONE_NO, nvl(a.MOBILE_NO,' ') MOBILE_NO, nvl(a.EMAIL,' ') email,"+
                           " a.CONN_HOUSE_NO||' '|| a.CONN_STREETNAME1 ||' ' || a.CONN_STREETNAME2||'. '|| a.CONN_CITY_NAME||'-'|| a.CONN_PIN addres,"+
                           " (select DESCRIPTION from anc.anc_requisition_for_lov where CODE=a.REQ_FOR and rownum=1) REQFOR, a.PRIORITY_ID,"+
                           " (select DESCRIPTION from anc.ANC_SUPPLY_TYPE where CODE=a.SUPPLY_TYPE and rownum=1) SUPPLY_TY,TO_CHAR(FORECAST_DATE,'DD-MM-YYYY') FORECAST_DATE,"+
                           "  nvl(a.SUPPLY_CATEGORY,'DLT') SUPPLY_CAT,nvl(a.APPLIED_LOAD,0) APPLIED_LD,a.contract_demand"+
                          "  from anc.ANC_APPLICANT_DETAILS a WHERE a.REQUEST_ID = '"+kid+"'";
                        String MAJORZN = "";
                        st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                             str.append(rs.getString("name1")+"$$_$$"+rs.getString("appldt")+"$$_$$"+rs.getString("PHONE_NO")+"$$_$$"+rs.getString("MOBILE_NO")+"$$_$$");
                             str.append(rs.getString("email")+"$$_$$"+rs.getString("addres")+"$$_$$"+rs.getString("REQFOR")+"$$_$$"+rs.getString("SUPPLY_TY")+"$$_$$");

                        }
                        rs.close();
                        st.close();

                    }
                    else{
                        str.append("No records found $$$#");
                    }


                    }else  if(flag.equals("1")){//---subcatgory
                    int count = 0;
                    sql = "select count(*) from compl_category where COMPL_TYPE = '" + ctype + "'  ";
                    //out.print(sql);
                    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    ResultSet rs = st.executeQuery(sql);
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }

                    rs.close();
                    st.close();

                    if (count > 0) {

                        sql = "SELECT code,descrip from compl_category where COMPL_TYPE = '" + ctype + "' order by 1 ";

                        String cols="#FAFF4A";
                      //  if(ctype.equals("1")) cols="#78FFFB";
                      //  if(ctype.equals("2")) cols="#FAFF4A";

                        str.append("<select id='cat' name='cat' style='background:"+cols+";font-size: 18px'>");

                        st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        rs = st.executeQuery(sql);
                        while (rs.next()) {

                          str.append("<option value='"+rs.getString("code")+"'>"+rs.getString("descrip")+"</option>");

                        }
                        rs.close();
                        st.close();
                        str.append("</select>");
                    }
                    else{
                        str.append("No records found $$_$$");
                    }


                    }
                    else  if(flag.equals("3")){//---kno


                        sql = "SELECT CHS.COMPL_DFN_GET_NAME('" + kno + "') FROM DUAL  ";

                        Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        ResultSet rs = st.executeQuery(sql);
                        if (rs.next()) {

                         str.append(rs.getString(1)+"$$_$$ $$_$$ $$_$$ $$_$$ $$_$$");

                        }
                        rs.close();
                        st.close();

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