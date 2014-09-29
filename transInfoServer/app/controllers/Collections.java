package controllers;

import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import play.Logger;
import play.db.DB;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static play.libs.Json.toJson;

/**
 * Created by omarpr on 7/1/14.
 */
public class Collections extends Controller {
    public static Result getReportTypes() {
        Logger.debug("getReportTypes()");

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "SELECT * FROM ReportType;";
        Connection conn = DB.getConnection();
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error("[GET:ReportType] Problem preparing statement!");

            return internalServerError(json);
        }

        try {
            rs = stmt.executeQuery();

            while (rs.next()) {
                ObjectNode rec = Json.newObject();

                rec.put("ReportTypeID", rs.getInt("ReportTypeID"));
                rec.put("DescriptionES", rs.getString("DescriptionES"));
                rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                payload.add(rec);
            }

            json.put("success", true);
            json.put("message", "");
            json.put("error_code", "");
            json.put("payload", payload);

        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error("[GET:ReportType] Problem executing query... " + e.getLocalizedMessage());

            return internalServerError(json);
        }

        return ok(toJson(json));
    }

    public static Result getCounties() {
        String[] counties = {"Puerto Rico", "Florida", "Alaska", "New York"};

        return ok(toJson(counties));
    }
}
