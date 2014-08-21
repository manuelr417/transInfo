package controllers;

import com.fasterxml.jackson.databind.node.ObjectNode;
import play.Logger;
import play.db.DB;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Results;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String query = "SELECT * FROM User WHERE Username=? and Password=MD5(?);";
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query);
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
                stmt.setString(1, username);
                stmt.setString(2, password);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    Map<String, String> out = new HashMap();

                    ObjectNode payload = Json.newObject();

                    json.put("success", true);
                    json.put("message", "");
                    json.put("error_code", "");

                    payload.put("AuthKey", "123456");
                    payload.put("FirstName", "Omar");
                    payload.put("LastName", "Soto Fortuno");
                    json.put("payload", payload);

                    /* TODO:
                        * Create UserSession
                        * Get Officer information
                        * Send UserSession and Officer Information
                     */

                    return ok(toJson(json));
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

                Logger.error("Problem executing query! " + e.getStackTrace());

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
