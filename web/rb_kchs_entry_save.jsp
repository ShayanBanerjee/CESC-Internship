<%-- 
    Document   : rb_kchs_entry_save
    Created on : 9 Jun, 2017, 12:14:06 AM
    Author     : roshni bose
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



                if (request.getParameter("nm_cmplnt") != null) {
                    nm_cmplnt = request.getParameter("nm_cmplnt");
                    nm_cmplnt = nm_cmplnt.replace("'", "''");
                } else {
                    nm_cmplnt = "";
                }

                String letdt=  request.getParameter("letdt");

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

                    String smax = "";
                    PreparedStatement ps = conn.prepareStatement("select DFN_UNIQUE_ID_GEN(?,?) from dual ");

                    ps.setString(1, "CN");
                    ps.setString(2, OFICID);

                    rs = ps.executeQuery();
                    while (rs.next()) {
                        smax = rs.getString(1);
                    }

                    rs.close();
                    ps.close();

                    //  smax = smax.replaceAll("-", "/");
                    String compl_no = "CN-" + smax;


                    sql = "INSERT INTO CHS.COMPL_DETAILS(COMPL_NO, NAPS_REQUEST_ID, KNO, CTYPE, CATEGORY, NAME1, ACTADD1, "
                            + " COMPL_NAME, COMPL_ADDR, RECDT, REFBY, REFTO, ADD_TO, LPNO, REMRKS, PHONE_NO, MOBILE_NO, "
                            + " EMAIL, STATUS, ACTIVITY_ID, SUPPLY_MODE, SUPPLY_TYPE,  CRT_DT, CRT_BY,letno)  "
                            + " VALUES ('" + compl_no + "','" + napsid + "','" + consno + "','" + ctype + "','" + subcat + "','" + name1 + "','" + add1 + "',"
                            + "'" + nm_cmplnt + "','" + compl_addr + "',to_date('" + rcvd_on + "','dd/mm/yyyy'),'" + refdby + "','" + refdto + "',"
                            + "'" + add_to + "','" + lp_no + "','" + rmk + "','" + phno + "','" + telno_mob + "',"
                            + "'" + email + "','ACCEPTED','1','" + sup_mode + "','" + sup_type + "',SYSDATE,'" + mcip + "','" + lttr_no + "')";

                    st = conn.createStatement();
                    int r1 = st.executeUpdate(sql);
                    st.close(); 

                    if(letdt!=null && !letdt.equals("") && !letdt.equals(" ") && letdt.length()>5){
                         sql = "update CHS.COMPL_DETAILS set LETDT=to_date('" + letdt + "','dd/mm/yyyy') "
                                 + "where COMPL_NO='" + compl_no + "' ";//for pending cases only

                    st = conn.createStatement();
                     r1 = st.executeUpdate(sql);
                    st.close();
                        }

                    conn.commit();

                    //----------------send mail-----------------
                    String ctypes = " ";
                    ps = conn.prepareStatement("select descrip from compl_type where code=? ");

                    ps.setString(1, ctype);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        ctypes = rs.getString(1);
                    }

                    rs.close();
                    ps.close();

                    String catgry = " ";
                    ps = conn.prepareStatement("select descrip from COMPL_CATEGORY where COMPL_TYPE=? and CODE=? ");

                    ps.setString(1, ctype);
                    ps.setString(2, subcat);

                    rs = ps.executeQuery();
                    while (rs.next()) {
                        catgry = rs.getString(1);
                    }

                    rs.close();
                    ps.close();

                    String text="<FONT STYLE=\"font-size: 14px;font-family: Arial\">Dear Sir/Madam, <br><br>This is to inform  that a new complaint has been docketed by you"
                            + " with reference to the<FONT COLOR=RED> Complaint Number " + compl_no + "</FONT> as received on "+rcvd_on+" at our SDO Office Counter"
                            + " as follows:<br><br>"
                            + "<font color=660066>Complaint Type:<font color=999999>"+ctypes
                            + "<br><font color=660066>Complaint Category:<font color=999999>"+catgry+"</font>"
                            + "<br><Br>Thank You";
                    String flags="";
                    sql="select CHS.COMPL_MAIL_SMS('E', 'New Complaint Docketed', '"+text+"', '" + email + "', '" + telno_mob + "') from dual";
                    st = conn.createStatement();
                    rs=st.executeQuery(sql);
                    if(rs.next()){
                            flags =rs.getString(1);
                        }
                    rs.close();
                    st.close();
                    String msg=" ";
                    if(flags.equals("OK")) msg=" Mail sent successfully to Complainant";

                    out.print("Data Saved successfully.   Complaint No is " + compl_no+". "+msg);
                    
                    response.getWriter().println("Data Saved successfully.   Complaint No is " + compl_no  +". "+msg+"$$_$$"+compl_no+"$$_$$"+OFICID+"$$_$$");

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