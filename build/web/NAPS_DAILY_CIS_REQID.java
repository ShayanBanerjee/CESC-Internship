/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ANCServerPk;
//package RB;

import ANCConnectionPackage.MakeConnectionANC;

import java.sql.ResultSet;
import java.sql.Statement;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import org.codehaus.jettison.json.JSONObject;
//import org.json.JSONObject;

/**
 *
 * @author ROSHNI
 */
@Path("/NAPS_DAILY_CIS_REQID/{reqid}")

public class NAPS_DAILY_CIS_REQID {

@Context
    private UriInfo context;

    /**
     * Creates a new instance of AncAddRequest
     */
    public NAPS_DAILY_CIS_REQID() {
           System.out.println("In NAPS_DAILY_CIS_REQID.java by roshni");
    }


    @GET
    @Produces("application/json")
    public Response getJson(@PathParam("reqid") String reqid ) throws Exception {

        
        System.out.println("*********************  begin individual request id enquiry for cis by Roshni Guhathakurta ***************** ");
        MakeConnectionANC mk = null;
        
        

        Statement st2 = null;
        String sql2 = new String();
        ResultSet rs  = null;
         //String dfcode = new String(" ");

        int count=0;

        JSONObject jres = new JSONObject();


        try{
            mk = new MakeConnectionANC();
       

            System.out.println("*********************   for NAPS_DAILY_CIS_REQID-"+reqid);

            
                sql2 = "SELECT COUNT(*) FROM ANC_APPLICANT_DETAILS WHERE REQUEST_ID='"+reqid+"'";
                st2=mk.con.createStatement();
                rs=st2.executeQuery(sql2);
                if(rs.next()){
                    count = rs.getInt(1);
                }
                rs.close();
                st2.close();
                System.out.println("####### is valid appl?  "+sql2+"   "+count);

                if(count==0){
                    jres.put("SUCCESS", "0");
                    jres.put("err", "Not a valid Request Id for NAPS");

                }else{

                    String name=new String("");
                    String addr=new String("");
                    String email=new String("");
                    String ph=new String("");
                    String SUPPLY_TY=new String("");
                    String REQFOR=new String("");
                    String PRIORITY_ID=new String("");
                    String APPLIED_LD=new String("");
                    String contract_demand=new String("");
                    String sco_print_dt=new String("");
                    String ini_payment_dt=new String("");
                    String SUPPLY_CAT=new String("");
                    String appldt=new String("");
                    String FORECAST_DATE=new String("");
                    String MOBILE=new String("");
                    String FORECAST_DT=new String("");
                    String STATUS=new String("");

                    sql2 = "SELECT to_char(a.application_dt,'dd/mm/yyyy') appldt,"
                            + "a.PERSON_INITIAL ||' '|| a.FIRST_NAME||' '||a.MIDDLE_NAME||' ' ||a.LAST_NAME name1,a.PHONE_NO, nvl(a.MOBILE_NO,' ') MOBILE_NO, nvl(a.EMAIL,' ') email,"+
                           " a.CONN_HOUSE_NO||' '|| a.CONN_STREETNAME1 ||' ' || a.CONN_STREETNAME2||'. '|| a.CONN_CITY_NAME||'-'|| a.CONN_PIN addres,"+
                           " (select DESCRIPTION from anc_requisition_for_lov where CODE=a.REQ_FOR and rownum=1) REQFOR, a.PRIORITY_ID,"+
                           " (select DESCRIPTION from ANC_SUPPLY_TYPE where CODE=a.SUPPLY_TYPE and rownum=1) SUPPLY_TY,TO_CHAR(FORECAST_DATE,'DD-MM-YYYY') FORECAST_DATE,"+
                           "  nvl(a.SUPPLY_CATEGORY,'DLT') SUPPLY_CAT,nvl(a.APPLIED_LOAD,0) APPLIED_LD,a.contract_demand,"
                            + "TO_CHAR(sco_print_dt,'DD-MM-YYYY') sco_print_dt,TO_CHAR(c.ini_payment_dt,'DD-MM-YYYY') ini_payment_dt,"
                            + "decode(status,'DN','DEMAND PRINTED','FCT','FORECAST DONE','OS','OUTSTANDING','PAID','DEMAND PAID','PRI','PRIORITY MADE','RET','JOB RETURNED','RQST','APPLICATION RECEIVED','SCO','SCO PRINTED','SJO','SJO PRINTED','SV','SITE VERIFICATION DONE') STAT  "+
                          "  from ANC_APPLICANT_DETAILS a,anc_sco_details b,anc_demand c WHERE a.REQUEST_ID = '"+reqid+"'"+
                          "  and  a.REQUEST_ID=b.REQUEST_ID(+) and  a.REQUEST_ID=c.REQUEST_ID(+)";
                    System.out.println("####### RB NAPS DAILY CIS INDIVIDUAL "+sql2);
                    st2=mk.con.createStatement();
                    rs=st2.executeQuery(sql2);
                    if(rs.next()){
                        appldt = rs.getString("appldt");
                        name = rs.getString("name1");
                        addr = rs.getString("addres");
                        REQFOR = rs.getString("REQFOR");
                        FORECAST_DATE = rs.getString("FORECAST_DATE");
                        PRIORITY_ID = rs.getString("PRIORITY_ID");
                        SUPPLY_TY = rs.getString("SUPPLY_TY");
                        APPLIED_LD = rs.getString("APPLIED_LD");
                        contract_demand = rs.getString("contract_demand");
                        sco_print_dt = rs.getString("sco_print_dt");
                        ini_payment_dt = rs.getString("ini_payment_dt");
                        SUPPLY_CAT = rs.getString("SUPPLY_CAT");
                        ph = rs.getString("PHONE_NO");
                        email = rs.getString("email");
                        MOBILE = rs.getString("MOBILE_NO");
                        STATUS = rs.getString("STAT");
                    }
                    rs.close();
                    st2.close();
                    

                    jres.put("SUCCESS", "1");
                    jres.put("REQID", reqid);
                    jres.put("NAME", name);
                    jres.put("ADDR", addr == null ? " " : addr);
                    jres.put("PHN", ph == null ? " " : ph);
                    jres.put("MOBILE", MOBILE == null ? " " : MOBILE);
                    jres.put("EMAIL", email == null ? " " :email);
                    jres.put("REQFOR", REQFOR);
                    jres.put("APPLIED_LOAD_KW", APPLIED_LD);
                    jres.put("CONTRACT_LOAD", contract_demand);
                    jres.put("SUPPLY_TYPE", SUPPLY_TY == null ? "LT" : SUPPLY_TY);
                    jres.put("SUPPLY_CATEGORY", SUPPLY_CAT == null ? " " : SUPPLY_CAT);
                    jres.put("SCO_PRINT_DT", sco_print_dt == null ? " " : sco_print_dt);
                    jres.put("INITIAL_PMNT_DT", ini_payment_dt == null ? " " : ini_payment_dt);
                    jres.put("FORECAST_DT", FORECAST_DT == null ? " " : FORECAST_DT);
                    jres.put("PRIORITY_ID", PRIORITY_ID == null ? " " : PRIORITY_ID);
                    jres.put("STATUS", STATUS == null ? " " : STATUS);
                }
            

              System.out.println("###$$$$ JRES:"+jres);  
            //return jres.toString();
            return Response.status(200)
	    .header("Access-Control-Allow-Origin", "*")
            .header("Access-Control-Allow-Headers", "origin, content-type, accept, authorization")
            .header("Access-Control-Allow-Credentials", "true")
            .header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD")
            .header("Access-Control-Max-Age", "1209600")
            .entity(jres + "")
            .build();

        } catch (Exception e) {

            e.printStackTrace();
           
                jres.put("SUCCESS", "0");
                jres.put("err", e);
            //return jres.toString();
            
            
            return Response.status(200)
	    .header("Access-Control-Allow-Origin", "*")
            .header("Access-Control-Allow-Headers", "origin, content-type, accept, authorization")
            .header("Access-Control-Allow-Credentials", "true")
            .header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD")
            .header("Access-Control-Max-Age", "1209600")
            .entity(jres + "")
            .build();

        } finally {
            try {
                mk.con.setAutoCommit(true);
                mk.con.close();
                System.out.println("Connection closed ");

            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
   // return null;
    }

    /**
     * PUT method for updating or creating an instance of AncAddRequest
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
 @PUT
    @Consumes("application/json")
    public void putJson(String content) {
    }
}

