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

import static play.libs.Json.toJson;

/**
 * Created by omarpr.
 */
public class Report extends Controller {

    public static Result addReport() {
        Logger.debug("Inserting Report...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "INSERT INTO Report (ReportTypeID, CaseNumber, OfficerUserID, CrashDate, CrashTime, PropertyID, LocationID, ZoneTypeID) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        Connection conn = DB.getConnection();
        PreparedStatement stmt;
        ResultSet rs;

        try {
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                String crashDate = (values.containsKey("CrashDate") ? values.get("CrashDate")[0] : "");
                if (crashDate.equals("")) {
                    crashDate = null;
                }

                String crashTime = (values.containsKey("CrashTime") ? values.get("CrashTime")[0] : "");
                if (crashTime.equals("")) {
                    crashTime = null;
                }

                stmt.setObject(1, (values.containsKey("ReportTypeID") ? emptyToNull(values.get("ReportTypeID")[0]) : null));
                stmt.setObject(2, (values.containsKey("CaseNumber") ? values.get("CaseNumber")[0] : ""));
                stmt.setObject(3, (values.containsKey("OfficerUserID") ? emptyToNull(values.get("OfficerUserID")[0]) : null));
                stmt.setObject(4, crashDate);
                stmt.setObject(5, crashTime);
                stmt.setObject(6, (values.containsKey("PropertyID") ? emptyToNull(values.get("PropertyID")[0]) : null));
                stmt.setObject(7, (values.containsKey("LocationID") ? emptyToNull(values.get("LocationID")[0]) : null));
                stmt.setObject(8, (values.containsKey("ZoneTypeID") ? emptyToNull(values.get("ZoneTypeID")[0]) : null));
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
            int reportID = -1;

            rs = stmt.getGeneratedKeys();
            if(rs.next()) {
                reportID = rs.getInt(1);
            }

            boolean addedReportInvolvedUnit = addReportInvolvedUnit(conn, reportID,
                    (values.containsKey("VehicleQuantity") ? integerValueOf(values.get("VehicleQuantity")[0]) : -1),
                    (values.containsKey("MotoristQuantity") ? integerValueOf(values.get("MotoristQuantity")[0]) : -1),
                    (values.containsKey("PedestrianQuantity") ? integerValueOf(values.get("PedestrianQuantity")[0]) : -1),
                    (values.containsKey("InjuredQuantity") ? integerValueOf(values.get("InjuredQuantity")[0]) : -1),
                    (values.containsKey("FatalitiesQuantity") ? integerValueOf(values.get("FatalitiesQuantity")[0]) : -1));

            boolean addedReportLocation = addReportLocation(conn, reportID,
                    (values.containsKey("Latitude") ? floatValueOf(values.get("Latitude")[0]) : -1),
                    (values.containsKey("Longitude") ? floatValueOf(values.get("Longitude")[0]) : -1),
                    (values.containsKey("CityID") ? integerValueOf(values.get("CityID")[0]) : -1),
                    (values.containsKey("CountyID") ? integerValueOf(values.get("CountyID")[0]) : -1),
                    (values.containsKey("StreetHighway") ? values.get("StreetHighway")[0] : ""),
                    (values.containsKey("Distance") ? doubleValueOf(values.get("Distance")[0]) : -1),
                    (values.containsKey("MeasurementID") ? integerValueOf(values.get("MeasurementID")[0]) : -1),
                    (values.containsKey("DirectionID") ? integerValueOf(values.get("DirectionID")[0]) : -1),
                    (values.containsKey("NearToID") ? integerValueOf(values.get("NearToID")[0]) : -1),
                    (values.containsKey("IntersectingStreet") ? values.get("IntersectingStreet")[0] : ""));

            if (addedReportInvolvedUnit && addedReportLocation) {
                json.put("success", true);
                json.put("message", "");
                json.put("error_code", "");
                json.put("payload", reportID);

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

    public static boolean addReportInvolvedUnit(Connection conn, int reportID, int vehicleQuantity, int motoristQuantity, int pedestrianQuantity, int injuredQuantity, int fatalitiesQuantity) {
        Logger.debug("Inserting ReportInvolvedUnit...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "INSERT INTO ReportInvolvedUnit (ReportID, VehicleQuantity, MotoristQuantity, PedestrianQuantity, InjuredQuantity, FatalitiesQuantity) VALUES (?, ?, ?, ?, ?, ?);";
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, reportID);
                stmt.setObject(2, ((vehicleQuantity == -1) ? null: vehicleQuantity));
                stmt.setObject(3, ((motoristQuantity == -1) ? null: motoristQuantity));
                stmt.setObject(4, ((pedestrianQuantity == -1) ? null: pedestrianQuantity));
                stmt.setObject(5, ((injuredQuantity == -1) ? null: injuredQuantity));
                stmt.setObject(6, ((fatalitiesQuantity == -1) ? null: fatalitiesQuantity));
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

    public static boolean addReportLocation(Connection conn, int reportID, float latitude, float longitude, int cityID, int countyID, String streetHighway, double distance, int measurementID, int directionID, int nearToID, String intersectingStreet) {
        Logger.debug("Inserting ReportLocation...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "INSERT INTO ReportLocation (ReportID, Latitude, Longitude, CityID, CountyID, StreetHighway, Distance, MeasurementID, DirectionID, NearToID, IntersectingStreet) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, reportID);
                stmt.setObject(2, ((latitude == -1) ? null: latitude));
                stmt.setObject(3, ((longitude == -1) ? null: longitude));
                stmt.setObject(4, ((cityID == -1) ? null: cityID));
                stmt.setObject(5, ((countyID == -1) ? null: countyID));
                stmt.setObject(6, streetHighway);
                stmt.setObject(7, ((distance == -1) ? null: distance));
                stmt.setObject(8, ((measurementID == -1) ? null: measurementID));
                stmt.setObject(9, ((directionID == -1) ? null: directionID));
                stmt.setObject(10, ((nearToID == -1) ? null: nearToID));
                stmt.setObject(11, intersectingStreet);
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

    public static Float floatValueOf(String str) {
        if (str.isEmpty()) {
            return Float.valueOf(-1);
        } else {
            return Float.valueOf(str);
        }
    }

    public static Double doubleValueOf(String str) {
        if (str.isEmpty()) {
            return Double.valueOf(-1);
        } else {
            return Double.valueOf(str);
        }
    }

    public static String emptyToNull(String str) {
        if (str.isEmpty()) {
            return null;
        } else {
            return str;
        }
    }

    public static Result updateReport(int reportID) {
        Logger.debug("Updating Report " + reportID + "...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "UPDATE Report SET ReportTypeID = ?, CaseNumber = ?, OfficerUserID = ?, CrashDate = ?, CrashTime = ?, PropertyID = ?, LocationID = ?, ZoneTypeID = ? WHERE ReportID = ?;";
        Connection conn = DB.getConnection();
        PreparedStatement stmt;
        ResultSet rs;

        try {
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                String crashDate = (values.containsKey("CrashDate") ? values.get("CrashDate")[0] : "");
                if (crashDate.equals("")) {
                    crashDate = null;
                }

                String crashTime = (values.containsKey("CrashTime") ? values.get("CrashTime")[0] : "");
                if (crashTime.equals("")) {
                    crashTime = null;
                }

                stmt.setObject(1, (values.containsKey("ReportTypeID") ? emptyToNull(values.get("ReportTypeID")[0]) : null));
                stmt.setObject(2, (values.containsKey("CaseNumber") ? values.get("CaseNumber")[0] : ""));
                stmt.setObject(3, (values.containsKey("OfficerUserID") ? emptyToNull(values.get("OfficerUserID")[0]) : null));
                stmt.setObject(4, crashDate);
                stmt.setObject(5, crashTime);
                stmt.setObject(6, (values.containsKey("PropertyID") ? emptyToNull(values.get("PropertyID")[0]) : null));
                stmt.setObject(7, (values.containsKey("LocationID") ? emptyToNull(values.get("LocationID")[0]) : null));
                stmt.setObject(8, (values.containsKey("ZoneTypeID") ? emptyToNull(values.get("ZoneTypeID")[0]) : null));
                stmt.setObject(9, reportID);
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

            //Logger.info(String.valueOf(res));
            /*int reportID = -1;

            rs = stmt.getGeneratedKeys();
            if(rs.next()) {
                reportID = rs.getInt(1);
            }*/

            boolean updateReportInvolvedUnit = updateReportInvolvedUnit(conn, reportID,
                    (values.containsKey("VehicleQuantity") ? integerValueOf(values.get("VehicleQuantity")[0]) : -1),
                    (values.containsKey("MotoristQuantity") ? integerValueOf(values.get("MotoristQuantity")[0]) : -1),
                    (values.containsKey("PedestrianQuantity") ? integerValueOf(values.get("PedestrianQuantity")[0]) : -1),
                    (values.containsKey("InjuredQuantity") ? integerValueOf(values.get("InjuredQuantity")[0]) : -1),
                    (values.containsKey("FatalitiesQuantity") ? integerValueOf(values.get("FatalitiesQuantity")[0]) : -1));

            boolean updateReportLocation = updateReportLocation(conn, reportID,
                    (values.containsKey("Latitude") ? floatValueOf(values.get("Latitude")[0]) : -1),
                    (values.containsKey("Longitude") ? floatValueOf(values.get("Longitude")[0]) : -1),
                    (values.containsKey("CityID") ? integerValueOf(values.get("CityID")[0]) : -1),
                    (values.containsKey("CountyID") ? integerValueOf(values.get("CountyID")[0]) : -1),
                    (values.containsKey("StreetHighway") ? values.get("StreetHighway")[0] : ""),
                    (values.containsKey("Distance") ? doubleValueOf(values.get("Distance")[0]) : -1),
                    (values.containsKey("MeasurementID") ? integerValueOf(values.get("MeasurementID")[0]) : -1),
                    (values.containsKey("DirectionID") ? integerValueOf(values.get("DirectionID")[0]) : -1),
                    (values.containsKey("NearToID") ? integerValueOf(values.get("NearToID")[0]) : -1),
                    (values.containsKey("IntersectingStreet") ? values.get("IntersectingStreet")[0] : ""));

            if (updateReportInvolvedUnit && updateReportLocation) {
                json.put("success", true);
                json.put("message", "");
                json.put("error_code", "");
                json.put("payload", reportID);

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

    public static boolean updateReportInvolvedUnit(Connection conn, int reportID, int vehicleQuantity, int motoristQuantity, int pedestrianQuantity, int injuredQuantity, int fatalitiesQuantity) {
        Logger.debug("Updating ReportInvolvedUnit...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "UPDATE ReportInvolvedUnit SET VehicleQuantity = ?, MotoristQuantity = ?, PedestrianQuantity = ?, InjuredQuantity = ?, FatalitiesQuantity = ? WHERE ReportID = ?;";
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, ((vehicleQuantity == -1) ? null: vehicleQuantity));
                stmt.setObject(2, ((motoristQuantity == -1) ? null: motoristQuantity));
                stmt.setObject(3, ((pedestrianQuantity == -1) ? null: pedestrianQuantity));
                stmt.setObject(4, ((injuredQuantity == -1) ? null: injuredQuantity));
                stmt.setObject(5, ((fatalitiesQuantity == -1) ? null: fatalitiesQuantity));
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

    public static boolean updateReportLocation(Connection conn, int reportID, float latitude, float longitude, int cityID, int countyID, String streetHighway, double distance, int measurementID, int directionID, int nearToID, String intersectingStreet) {
        Logger.debug("Updating ReportLocation...");

        Map<String, String[]> values = request().body().asFormUrlEncoded();

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "UPDATE ReportLocation SET Latitude = ?, Longitude = ?, CityID = ?, CountyID = ?, StreetHighway = ?, Distance = ?, MeasurementID = ?, DirectionID = ?, NearToID = ?, IntersectingStreet = ? WHERE ReportID = ?;";
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            if (values != null) {
                stmt.setObject(1, ((latitude == -1) ? null: latitude));
                stmt.setObject(2, ((longitude == -1) ? null: longitude));
                stmt.setObject(3, ((cityID == -1) ? null: cityID));
                stmt.setObject(4, ((countyID == -1) ? null: countyID));
                stmt.setObject(5, streetHighway);
                stmt.setObject(6, ((distance == -1) ? null: distance));
                stmt.setObject(7, ((measurementID == -1) ? null: measurementID));
                stmt.setObject(8, ((directionID == -1) ? null: directionID));
                stmt.setObject(9, ((nearToID == -1) ? null: nearToID));
                stmt.setObject(10, intersectingStreet);
                stmt.setObject(11, reportID);
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

    public static Result getCollection(String table, GetRows callback) {
        Logger.debug("getCollection(" + table + ")");

        ObjectNode json = Json.newObject();
        ArrayNode payload = json.arrayNode();

        String query = "SELECT * FROM " + table + ";";
        Connection conn = DB.getConnection();
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conn.prepareStatement(query);
        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error("[GET:" + table + "] Problem preparing statement!");

            return internalServerError(json);
        }

        try {
            rs = stmt.executeQuery();

            while (rs.next()) {
                ObjectNode rec = callback.getRows(rs);

                if (rec == null) {
                    json.put("success", false);
                    json.put("message", "Internal Server Error");
                    json.put("error_code", 1);

                    Logger.error("[GET:" + table + "] Problem in getRows callback.");

                    return internalServerError(json);
                } else {
                    payload.add(rec);
                }
            }

            json.put("success", true);
            json.put("message", "");
            json.put("error_code", "");
            json.put("payload", payload);

        } catch (SQLException e) {
            json.put("success", false);
            json.put("message", "Internal Server Error");
            json.put("error_code", 1);

            Logger.error("[GET:" + table + "] Problem executing query... " + e.getLocalizedMessage());

            return internalServerError(json);
        }

        try {
            conn.close();
        } catch(SQLException e) {

        }

        return ok(toJson(json));
    }
}