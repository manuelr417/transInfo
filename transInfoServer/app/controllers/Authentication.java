package controllers;

import com.fasterxml.jackson.databind.node.ObjectNode;
import play.Logger;
import play.db.DB;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.Result;
import play.mvc.Results;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import static play.libs.Json.toJson;

/**
 * Created by omarpr on 7/18/14.
 */
public class Authentication extends Controller {
    /* Errors:
     * 1 Internal server error
     * 2 Missing required fields
     * 3 Wrong authentication information
     */
    public static Result doLogin() {
        Logger.debug("doLogin()");
        ObjectNode json = Json.newObject();
        Connection conn = DB.getConnection();
        String query[] = {"SELECT * FROM User WHERE Username=? and Password=MD5(?);",
                "INSERT INTO UserSession VALUES (UUID(), ?, ?, ?, NOW(), DATE_ADD(NOW(), INTERVAL 8 HOUR));",
                "SELECT *, CONVERT_TZ(ExpirationDate, @@session.time_zone, '+00:00') as ExpirationDateGMT FROM UserSession WHERE UserID=? ORDER BY CreationDate DESC LIMIT 1;",
                "SELECT * FROM Officer WHERE OfficerID=?;"};
        PreparedStatement stmt[] = new PreparedStatement[4];
        ResultSet rs;

        try {
            for (int i = 0; i < stmt.length; i++) {
                stmt[i] = conn.prepareStatement(query[i]);
            }
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error("Problem preparing statement!");

            return internalServerError(json);
        }

        final Map<String, String[]> values = request().body().asFormUrlEncoded();

        if (values != null && values.containsKey("username") && values.containsKey("password")) {
            String username = values.get("username")[0];
            String password = values.get("password")[0];

            try {
                Logger.debug("Username " + username + ", Password: " + password);
                stmt[0].setString(1, username);
                stmt[0].setString(2, password);
                rs = stmt[0].executeQuery();

                if (rs.next()) {
                    String officerID = rs.getString("OfficerID");
                    String userID = rs.getString("UserID");

                    ObjectNode payload = Json.newObject();

                    json.put("success", true);
                    json.put("message", "");
                    json.put("error_code", "");

                    payload.put("UserID", Integer.valueOf(userID));
                    payload.put("OfficerID", Integer.valueOf(officerID));

                    // Creating UserSession
                    String[] userAgent = request().headers().get(Http.HeaderNames.USER_AGENT);

                    stmt[1].setString(1, userID);
                    stmt[1].setString(2, (userAgent.length > 0) ? userAgent[0] : "");
                    stmt[1].setString(3, "0.0.0.0");
                    // Verify data too long...
                    //stmt[1].setString(3, request().remoteAddress());
                    //Logger.info(request().remoteAddress());

                    if (stmt[1].executeUpdate() > 0) {
                        stmt[2].setString(1, userID);

                        rs = stmt[2].executeQuery();

                        if (rs.next()) {
                            payload.put("UserSessionUUID", rs.getString("UserSessionUUID"));
                            payload.put("ExpirationDate", rs.getString("ExpirationDateGMT"));

                            stmt[3].setString(1, officerID);
                            rs = stmt[3].executeQuery();

                            if (rs.next()) {
                                payload.put("AgencyID", rs.getInt("AgencyID"));
                                payload.put("PlateNumber", rs.getInt("PlateNumber"));
                                payload.put("FirstName", rs.getString("FirstName"));
                                payload.put("LastName", rs.getString("LastName"));
                                payload.put("Testt", "1");

                                json.put("payload", payload);

                                return ok(toJson(json));
                            } else {
                                Logger.info("[LOGIN] Unable to get Officer information for OfficerID=" + officerID + ".");
                            }
                        }
                    } else {
                        Logger.info("[LOGIN] UserSession for UserID=" + userID + " can't be created.");
                    }

                    json.put("success", false);
                    json.put("message", "Internal Server Error");
                    json.put("error_code", 1);

                    return internalServerError(json);
                } else {
                    json.put("success", false);
                    json.put("message", "Wrong authentication information.");
                    json.put("error_code", 3);

                    return Results.forbidden(json);
                }
            } catch (SQLException e) {
                json.put("success", false);
                json.put("message", "Internal Server Error");
                json.put("error_code", 1);

                //e.printStackTrace();
                Logger.error("[LOGIN] Problem executing query... " + e.getLocalizedMessage());

                return internalServerError(json);
            }
        } else {
            json.put("success", false);
            json.put("message", "Username and Password are required fields.");
            json.put("error_code", 2);

            return badRequest(json);
        }
    }
}