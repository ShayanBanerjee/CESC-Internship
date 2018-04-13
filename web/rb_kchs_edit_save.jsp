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

            response.setContentType("text/html");
            response.setHeader("Cache-Control", "no-cache");

            try {
                String  log_usr = new String(""), rcvd_on = new String(""), lttr_no = new String(""), lttr_on = new String(""), sup_type = new String(""), sup_mode = new String(""), street = "";
                String add_to = new String(""), entry_dt = new String(""), compl_addr = new String(""), comsrlno = new String(""), source = new String(""), refdby = new String(""), refdto = new String(""), fwdon = "";
                String cons_no = new String(""), mr_dst = new String(""), mr_ref = new String(""), mr_yr = new String(""), name1 = new String(""), name2 = new String(""), add1 = new String("");
                String ctype = new String(""), subcat = new String(""), consno = new String(""),  nm_cmplnt = new String(""), email = "";
                String phno = new String(""), lp_no = new String(""), telno_res = new String(""), telno_off = new String(""), telno_mob = new String(""), cmpl_cd = new String(""), rmk = new String("");
                String sql = new String(""), ref_srl = new String(""), ref_yer = new String(""), sql1 = new String(""), napsid = new String(""), mcip = new String("");

                String OFICID = request.getParameter("ofcd");


                if (request.getParameter("ecd") != null) {
                    log_usr = request.getParameter("ecd");
                } else {
                    log_usr = "";
                }
                mcip = request.getRemoteAddr();
                mcip = log_usr + "-" + mcip;


                if (request.getParameter("rcvddt") != null) {
                    rcvd_on = request.getParameter("rcvddt");
                } else {
                    rcvd_on = "";
                }
                if (request.getParameter("entrdt") != null) {
                    entry_dt = request.getParameter("entrdt");
                } else {
                    entry_dt = "";
                }

                if (request.getParameter("letno") != null) {
                    lttr_no = request.getParameter("letno");
                } else {
                    lttr_no = "";
                }
                if (request.getParameter("leton") != null) {
                    lttr_on = request.getParameter("leton");
                } else {
                    lttr_on = "";
                }
                if (request.getParameter("addto") != null) {
                    add_to = request.getParameter("addto");
                } else {
                    add_to = "";
                }

                if (request.getParameter("nm1") != null) {
                    name1 = request.getParameter("nm1");
                } else {
                    name1 = "";
                }

                if (request.getParameter("add1") != null) {
                    add1 = request.getParameter("add1");
                } else {
                    add1 = "";
                }

                if (request.getParameter("subcat") != null) {
                    subcat = request.getParameter("subcat");
                } else {
                    subcat = "";
                }
                if (request.getParameter("ctype") != null) {
                    ctype = request.getParameter("ctype");
                } else {
                    ctype = "";
                }
                if (request.getParameter("email") != null) {
                    email = request.getParameter("email");
                } else {
                    email = "";
                }

                String letdt=  request.getParameter("letdt");

                if (request.getParameter("nm_cmplnt") != null) {
                    nm_cmplnt = request.getParameter("nm_cmplnt");
                    nm_cmplnt = nm_cmplnt.replace("'", "''");
                } else {
                    nm_cmplnt = "";
                }


                if (request.getParameter("compl_addr") != null) {
                    compl_addr = request.getParameter("compl_addr");
                    compl_addr = compl_addr.replace("'", "''");
                } else {
                    compl_addr = "";
                }

                if (request.getParameter("phno") != null) {
                    phno = request.getParameter("phno");
                } else {
                    phno = "";
                }
                if (request.getParameter("lpno") != null) {
                    lp_no = request.getParameter("lpno");
                } else {
                    lp_no = "";
                }
                if (request.getParameter("telno_mob") != null) {
                    telno_mob = request.getParameter("telno_mob");
                } else {
                    telno_mob = "";
                }

                if (request.getParameter("sup_type") != null) {
                    sup_type = request.getParameter("sup_type");
                } else {
                    sup_type = "";
                }
                if (request.getParameter("sup_mode") != null) {
                    sup_mode = request.getParameter("sup_mode");
                } else {
                    sup_mode = "";
                }
                if (request.getParameter("refdby") != null) {
                    refdby = request.getParameter("refdby");
                } else {
                    refdby = "";
                }
                if (request.getParameter("refdto") != null) {
                    refdto = request.getParameter("refdto");
                } else {
                    refdto = "";
                }

                if (request.getParameter("consno") != null) {
                    consno = request.getParameter("consno");
                } else {
                    consno = "";
                }
                if (request.getParameter("napsid") != null) {
                    napsid = request.getParameter("napsid");
                } else {
                    napsid = "";
                }
                mcip = request.getRemoteAddr();
                mcip = log_usr + "-" + mcip;


                if (request.getParameter("lp_no") != null) {
                    lp_no = lp_no.replace("'", "");
                }


                if (request.getParameter("refdby") != null) {
                    refdby = refdby.replace("'", "");
                }
                if (request.getParameter("refdto") != null) {
                    refdto = refdto.replace("'", "");
                }
                if (request.getParameter("email") != null) {
                    email = email.replace("'", "");
                }
                if (request.getParameter("letno") != null) {
                    lttr_no = lttr_no.replace("'", "");
                }
                rmk = request.getParameter("rmk");

                rmk = rmk.replace("\n", " ");
                rmk = rmk.replace("\r", " ");
                rmk = rmk.replace("'", "''");
                out.println("#### ROSHNI rmk=" + rmk);
                if (rmk != null && rmk.length() > 498) {
                    System.out.println("#### huge length of  rmk=" + rmk);
                    rmk = rmk.substring(0, 498);
                }//roshni

                Statement st = null;
                Statement st1 = null;
                Statement st2 = null;
                Statement st3 = null;
                ResultSet rs = null;
                ResultSet rs1 = null;
                CallableStatement proc_stmt = null;
                try {
               // out.println("<br><Br>-----BY ROSHNI-------");
                    conn.setAutoCommit(false);

                    String compl_no = "CN-" + request.getParameter("cno") ;


                    sql = "update CHS.COMPL_DETAILS set COMPL_NAME='" + nm_cmplnt + "', COMPL_ADDR='" + compl_addr + "',  REFBY='" + refdby + "', "
                            + " REFTO='" + refdto + "', ADD_TO='" + add_to + "', LPNO='" + lp_no + "', REMRKS='" + rmk + "', "
                            + " PHONE_NO='" + phno + "', MOBILE_NO='" + telno_mob + "', "
                            + " EMAIL='" + email + "',  upd_DT=sysdate, upd_BY='" + mcip + "',letno='" + lttr_no + "' "
                            + " where COMPL_NO='" + compl_no + "' and trim(activity_id)='1'";//for pending cases only

                    st = conn.createStatement();
                    int r1 = st.executeUpdate(sql);
                    st.close();

                    if(letdt!=null && !letdt.equals("") && !letdt.equals(" ") && letdt.length()>5){
                         sql = "update CHS.COMPL_DETAILS set LETDT=to_date('" + letdt + "','dd/mm/yyyy') "
                                 + "where COMPL_NO='" + compl_no + "' and trim(activity_id)='1'";//for pending cases only

                    st = conn.createStatement();
                     r1 = st.executeUpdate(sql);
                    st.close();
                        }



                    conn.commit();

                    response.getWriter().println("Data edited successfully for Complaint No  " + compl_no  +"$$_$$"+compl_no+"$$_$$"+OFICID+"$$_$$");

                    if (st1 != null) {
                        st1.close();
                    }
                    if (st2 != null) {
                        st2.close();
                    }
                    if (st3 != null) {
                        st3.close();
                    }

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
                    if (rs != null) {
                        rs.close();
                    }
                    rs = null;
                    if (proc_stmt != null) {
                        proc_stmt.close();
                    }
                    if (st1 != null) {
                        st1.close();
                    }
                    st1 = null;
                    if (st2 != null) {
                        st2.close();
                    }
                    st2 = null;
                    if (st3 != null) {
                        st3.close();
                    }
                    st3 = null;

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