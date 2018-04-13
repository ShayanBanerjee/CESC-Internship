/*
 * BY ROSHNI GUHATHAKURTA
 */
package ANCServerPk;

/**
 *
 * @author ROSHNI........
 */
import ANCConnectionPackage.MakeConnectionANC;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.NumberFormat;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import org.codehaus.jettison.json.JSONObject;

//

@Path("/NAPS_CIS_EXEC_COUNT/{dfcode}/{buttontype}/{level}")

public class NAPS_CIS_EXEC_COUNT {

@Context
    private UriInfo context;

    /**
     * Creates a new instance of AncAddRequest
     */
    public NAPS_CIS_EXEC_COUNT() {
           System.out.println("In NAPS_CIS_EXEC_COUNT.java by roshni");
    }

    
    @GET
    @Produces("application/json")
    public Response getJson(@PathParam("dfcode") String dfcode,@PathParam("buttontype") String  buttontype,@PathParam("level") String  level ) throws Exception{
        

        System.out.println("*********************  begin data sending to cis for executed cases by Roshni Guhathakurta ***************** ");
        MakeConnectionANC mk = null;
        mk = new MakeConnectionANC();
        mk.con.setAutoCommit(false);
        PreparedStatement ps = null;

        Statement st2 = null;
        String sql2 = new String();
        ResultSet rs  = null;
        
                NumberFormat nf = NumberFormat.getNumberInstance() ; 
		nf.setGroupingUsed(false) ; 
		nf.setMaximumFractionDigits(2) ;
		nf.setMinimumFractionDigits(0) ;
                
        double cntAPPLICATION = 0,cntCOMPLETED = 0, cntEXEONEDAY=0;
        int cntHTAPPL = 0,cntLTAPPL = 0, cntLTEXE=0, cntHTEXE=0, cntRET=0;
        
        JSONObject jres = new JSONObject();
        try{
            System.out.println(buttontype+"*********************    dfcode-"+dfcode+" LEVEL:"+level);

           if(buttontype.equals("EXE") && level.equals("2")){//---------execution part --------

                sql2 = "SELECT COUNT(*) FROM ANC_APPLICANT_DETAILS a,ANC_SCO_DETAILS b"
                        + " WHERE nvl(IS_TEMP,'P')='P' and substr(a.REQUEST_ID,0,4)='"+dfcode+"'"
                        + " and a.REQUEST_ID= b.REQUEST_ID and b.COMPLETION_DATE is not null "
                        + "  and nvl(a.SUPPLY_TYPE,'1')='1'";
                st2=mk.con.createStatement();
                rs=st2.executeQuery(sql2);
                if(rs.next()){
                    cntLTEXE = rs.getInt(1);
                }
                rs.close();
                st2.close();
                System.out.println("####### Count 3 LT EXEC "+sql2+"   "+cntLTEXE);

                sql2 = "SELECT COUNT(*) FROM ANC_APPLICANT_DETAILS a,ANC_SCO_DETAILS b"
                        + " WHERE nvl(IS_TEMP,'P')='P' and substr(a.REQUEST_ID,0,4)='"+dfcode+"'"
                        + " and a.REQUEST_ID= b.REQUEST_ID and b.COMPLETION_DATE is not null "
                        + "  and nvl(a.SUPPLY_TYPE,'1') IN ('2','3')";
                st2=mk.con.createStatement();
                rs=st2.executeQuery(sql2);
                if(rs.next()){
                    cntHTEXE = rs.getInt(1);
                }
                rs.close();
                st2.close();
                System.out.println("####### Count 4 HT EHT EXECUTE "+sql2+"   "+cntHTEXE);

                jres.put("SUCCESS", "1");
                jres.put("DF", dfcode);
                jres.put("COUNT_EXEC_LT", cntLTEXE);
                jres.put("COUNT_EXEC_HEHT", cntHTEXE);

            }
         
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
            jres.put("err", e+sql2);
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
                System.out.println("Connection closed in Naps_mf1_error_ws.java");

            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
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


