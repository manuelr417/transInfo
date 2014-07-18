package controllers;

import play.Logger;
import play.db.DB;
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
    public static Result doLogin() {
        Connection conn = DB.getConnection();
        String query = "SELECT * FROM User WHERE Username=? and Password=MD5(?);";
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException e) {
            Logger.error("Problem preparing statement!");
            return internalServerError();
        }

        final Map<String, String[]> values = request().body().asFormUrlEncoded();

        if (values.containsKey("username") && values.containsKey("password")) {
            String username = values.get("username")[0];
            String password = values.get("password")[0];

            try {
                stmt.setString(1, username);
                stmt.setString(2, password);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    Map<String, String> out = new HashMap();

                    out.put("AuthKey", "123456");
                    out.put("FirstName", "Omar");
                    out.put("LastName", "Soto Fortuno");
                    /* TODO:
                        * Create UserSession
                        * Get Officer information
                        * Send UserSession and Officer Information
                     */

                    return ok(toJson(out));
                } else {
                    return Results.forbidden("Wrong authentication information.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                Logger.error("Problem executing query! " + e.getStackTrace());
                return internalServerError();
            }
        } else {
            Logger.error("Invalid fields!");
            return badRequest("Username and Password are required fields.");
        }
    }
}
