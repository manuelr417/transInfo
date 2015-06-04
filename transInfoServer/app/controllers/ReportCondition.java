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
import java.sql.Statement;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Iterator;

import static play.libs.Json.toJson;

/**
 * Created by omarpr on 5/11/15.
 */
public class ReportCondition extends Controller {

    public static Result addReportCondition() {
        Logger.debug("Inserting ReportCondition...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "INSERT INTO ReportCondition (ReportID, FirstHarmfulEventTypeID, FirstHarmfulEventID, RelToTrafficwayID, MannerOfCollisionID, Narrative) VALUES (?, ?, ?, ?, ?, ?);";
        Connection conn = DB.getConnection();
        PreparedStatement stmt;
        ResultSet rs;

        int reportID = (values.containsKey("ReportID") ? integerValueOf(values.get("ReportID")[0]) : -1);

        if (reportID == -1) {
            return internalServerError();
        }

        try {
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, reportID);
                stmt.setObject(2, (values.containsKey("FirstHarmfulEventTypeID") ? integerValueOf(values.get("FirstHarmfulEventTypeID")[0]) : -1));
                stmt.setObject(3, (values.containsKey("FirstHarmfulEventID") ? integerValueOf(values.get("FirstHarmfulEventID")[0]) : -1));
                stmt.setObject(4, (values.containsKey("RelToTrafficwayID") ? integerValueOf(values.get("RelToTrafficwayID")[0]) : -1));
                stmt.setObject(5, (values.containsKey("MannerOfCollisionID") ? integerValueOf(values.get("MannerOfCollisionID")[0]) : -1));
                stmt.setObject(6, (values.containsKey("Narrative") ? emptyToNull(values.get("Narrative")[0]) : ""));
            }
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error(e.getMessage());

            return internalServerError(json);
        }

        try {
            int res = stmt.executeUpdate();
            int reportConditionID = -1;

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                reportConditionID = rs.getInt(1);
            }

            boolean addedReportJunction = addReportJunction(conn, reportID,
                    (values.containsKey("WithinInterchangeID") ? integerValueOf(values.get("WithinInterchangeID")[0]) : -1),
                    (values.containsKey("JunctionID") ? integerValueOf(values.get("JunctionID")[0]) : -1),
                    (values.containsKey("IntersectionTypeID") ? integerValueOf(values.get("IntersectionTypeID")[0]) : -1),
                    (values.containsKey("SchoolBusRelatedID") ? integerValueOf(values.get("SchoolBusRelatedID")[0]) : -1));

            boolean addedReportWorkzone = addReportWorkzone(conn, reportID,
                    (values.containsKey("WorkzoneRelatedID") ? integerValueOf(values.get("WorkzoneRelatedID")[0]) : -1),
                    (values.containsKey("WorkzoneLocationID") ? integerValueOf(values.get("WorkzoneLocationID")[0]) : -1),
                    (values.containsKey("WorkzoneTypeID") ? integerValueOf(values.get("WorkzoneTypeID")[0]) : -1),
                    (values.containsKey("WorkersPresentID") ? integerValueOf(values.get("WorkersPresentID")[0]) : -1),
                    (values.containsKey("LawEnforcementPresentID") ? integerValueOf(values.get("LawEnforcementPresentID")[0]) : -1));

            if (addedReportJunction & addedReportWorkzone) {
                json.put("success", true);
                json.put("message", "");
                json.put("error_code", "");
                json.put("payload", reportConditionID);

                conn.commit();
            } else {
                json.put("success", false);
                json.put("message", "Internal Server Error");
                json.put("error_code", 1);

                conn.rollback();
            }
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error(e.getMessage());

            return internalServerError(json);
        }

        try {
            conn.setAutoCommit(true);
            conn.close();
        } catch(SQLException e) {

        }

        return ok(toJson(json));
    }

    public static boolean addReportJunction(Connection conn, int reportID, int withinInterchangeID, int junctionID, int intersectionTypeID, int schoolBusRelatedID) {
        Logger.debug("Inserting ReportJunction...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();
        ObjectNode json = Json.newObject();

        String query = "INSERT INTO ReportJunction (ReportID, WithinInterchangeID, JunctionID, IntersectionTypeID, SchoolBusRelatedID) VALUES (?, ?, ?, ?, ?);";
        PreparedStatement stmt;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, reportID);
                stmt.setObject(2, withinInterchangeID);
                stmt.setObject(3, junctionID);
                stmt.setObject(4, intersectionTypeID);
                stmt.setObject(5, schoolBusRelatedID);
            }
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        try {
            int res = stmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        return true;
    }

    public static boolean addReportWorkzone(Connection conn, int reportID, int workzoneRelatedID, int workzoneLocationID, int workzoneTypeID, int workersPresentID, int lawEnforcementPresentID) {
        Logger.debug("Inserting ReportJunction...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();
        ObjectNode json = Json.newObject();

        String query = "INSERT INTO ReportWorkzone (ReportID, WorkzoneRelatedID, WorkzoneLocationID, WorkzoneTypeID, WorkersPresentID, LawEnforcementPresentID) VALUES (?, ?, ?, ?, ?, ?);";
        PreparedStatement stmt;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, reportID);
                stmt.setObject(2, workzoneRelatedID);
                stmt.setObject(3, workzoneLocationID);
                stmt.setObject(4, workzoneTypeID);
                stmt.setObject(5, workersPresentID);
                stmt.setObject(6, lawEnforcementPresentID);
            }
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        try {
            int res = stmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        return true;
    }

    public static Result updateReportCondition(int reportConditionID) {
        Logger.debug("Updating ReportCondition...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();
        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "UPDATE ReportCondition SET ReportID = ?, FirstHarmfulEventTypeID = ?, FirstHarmfulEventID = ?, RelToTrafficwayID = ?, MannerOfCollisionID = ?, Narrative = ? WHERE ReportConditionID = ?;";
        Connection conn = DB.getConnection();
        PreparedStatement stmt;
        ResultSet rs;

        int reportID = (values.containsKey("ReportID") ? integerValueOf(values.get("ReportID")[0]) : -1);

        if (reportID == -1) {
            return internalServerError();
        }

        try {
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, reportID);
                stmt.setObject(2, (values.containsKey("FirstHarmfulEventTypeID") ? integerValueOf(values.get("FirstHarmfulEventTypeID")[0]) : -1));
                stmt.setObject(3, (values.containsKey("FirstHarmfulEventID") ? integerValueOf(values.get("FirstHarmfulEventID")[0]) : -1));
                stmt.setObject(4, (values.containsKey("RelToTrafficwayID") ? integerValueOf(values.get("RelToTrafficwayID")[0]) : -1));
                stmt.setObject(5, (values.containsKey("MannerOfCollisionID") ? integerValueOf(values.get("MannerOfCollisionID")[0]) : -1));
                stmt.setObject(6, (values.containsKey("Narrative") ? emptyToNull(values.get("Narrative")[0]) : ""));
                stmt.setObject(7, reportConditionID);
            }
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error(e.getMessage());

            return internalServerError(json);
        }

        try {
            int res = stmt.executeUpdate();

            boolean updatedReportJunction = updateReportJunction(conn, reportID,
                    (values.containsKey("WithinInterchangeID") ? integerValueOf(values.get("WithinInterchangeID")[0]) : -1),
                    (values.containsKey("JunctionID") ? integerValueOf(values.get("JunctionID")[0]) : -1),
                    (values.containsKey("IntersectionTypeID") ? integerValueOf(values.get("IntersectionTypeID")[0]) : -1),
                    (values.containsKey("SchoolBusRelatedID") ? integerValueOf(values.get("SchoolBusRelatedID")[0]) : -1));

            boolean updatedReportWorkzone = updateReportWorkzone(conn, reportID,
                    (values.containsKey("WorkzoneRelatedID") ? integerValueOf(values.get("WorkzoneRelatedID")[0]) : -1),
                    (values.containsKey("WorkzoneLocationID") ? integerValueOf(values.get("WorkzoneLocationID")[0]) : -1),
                    (values.containsKey("WorkzoneTypeID") ? integerValueOf(values.get("WorkzoneTypeID")[0]) : -1),
                    (values.containsKey("WorkersPresentID") ? integerValueOf(values.get("WorkersPresentID")[0]) : -1),
                    (values.containsKey("LawEnforcementPresentID") ? integerValueOf(values.get("LawEnforcementPresentID")[0]) : -1));

            if (updatedReportJunction & updatedReportWorkzone) {
                json.put("success", true);
                json.put("message", "");
                json.put("error_code", "");
                json.put("payload", reportConditionID);

                conn.commit();
            } else {
                json.put("success", false);
                json.put("message", "Internal Server Error");
                json.put("error_code", 1);

                conn.rollback();
            }
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error(e.getMessage());

            return internalServerError(json);
        }

        try {
            conn.setAutoCommit(true);
            conn.close();
        } catch(SQLException e) {

        }

        return ok();
    }

    public static boolean updateReportJunction(Connection conn, int reportID, int withinInterchangeID, int junctionID, int intersectionTypeID, int schoolBusRelatedID) {
        Logger.debug("Updating ReportJunction...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();
        ObjectNode json = Json.newObject();

        String query = "UPDATE ReportJunction SET WithinInterchangeID = ?, JunctionID = ?, IntersectionTypeID = ?, SchoolBusRelatedID = ? WHERE ReportID = ?;";
        PreparedStatement stmt;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, withinInterchangeID);
                stmt.setObject(2, junctionID);
                stmt.setObject(3, intersectionTypeID);
                stmt.setObject(4, schoolBusRelatedID);
                stmt.setObject(5, reportID);
            }
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        try {
            int res = stmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        return true;
    }

    public static boolean updateReportWorkzone(Connection conn, int reportID, int workzoneRelatedID, int workzoneLocationID, int workzoneTypeID, int workersPresentID, int lawEnforcementPresentID) {
        Logger.debug("Updating ReportJunction...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();
        ObjectNode json = Json.newObject();

        String query = "UPDATE ReportWorkzone SET WorkzoneRelatedID = ?, WorkzoneLocationID = ?, WorkzoneTypeID = ?, WorkersPresentID = ?, LawEnforcementPresentID = ? WHERE ReportID = ?;";
        PreparedStatement stmt;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, workzoneRelatedID);
                stmt.setObject(2, workzoneLocationID);
                stmt.setObject(3, workzoneTypeID);
                stmt.setObject(4, workersPresentID);
                stmt.setObject(5, lawEnforcementPresentID);
                stmt.setObject(6, reportID);
            }
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        try {
            int res = stmt.executeUpdate();
        } catch (SQLException e) {
            Logger.error(e.getMessage());

            return false;
        }

        return true;
    }

    public static Integer integerValueOf(String str) {
        if (str.isEmpty()) {
            return -1;
        } else {
            return Integer.valueOf(str);
        }
    }

    public static String emptyToNull(String str) {
        if (str.isEmpty()) {
            return null;
        } else {
            return str;
        }
    }

    public static void debugMap(Map<String, String[]> values) {
        Iterator it = values.entrySet().iterator();

        while (it.hasNext()) {
            Entry entry = (Entry)it.next();
            String[] val = (String[])entry.getValue();

            Logger.debug(entry.getKey() + " = " + val[0]);
        }
    }
}
