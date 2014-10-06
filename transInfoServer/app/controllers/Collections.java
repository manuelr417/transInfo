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
    /*public static Result getReportTypes() {
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
    }*/
/*
# Collections
GET     /cities                     controllers.Collections.getCities()
GET     /counties                   controllers.Collections.getCounties()
GET     /directions                 controllers.Collections.getDirections()
GET     /locations                  controllers.Collections.getLocations()
GET     /measurements               controllers.Collections.getMeasurements()
GET     /nearTo                     controllers.Collections.getNearTo()
GET     /properties                 controllers.Collections.getProperties()
GET     /reportTypes                controllers.Collections.getReportTypes()

 */
    public static Result getCities() {
        return getCollection("City", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("CityID", rs.getInt("CityID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getCounties() {
        return getCollection("County", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("CountyID", rs.getInt("CountyID"));
                    rec.put("CityID", rs.getInt("CityID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDirections() {
        return getCollection("Direction", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DirectionID", rs.getInt("DirectionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getLocations() {
        return getCollection("Location", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("LocationID", rs.getInt("LocationID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getMeasurements() {
        return getCollection("Measurement", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("MeasurementID", rs.getInt("MeasurementID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getNearTo() {
        return getCollection("NearTo", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("NearToID", rs.getInt("NearToID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getProperties() {
        return getCollection("Property", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("PropertyID", rs.getInt("PropertyID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getReportTypes() {
        return getCollection("ReportType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ReportTypeID", rs.getInt("ReportTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
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

    /*public static Result getCounties() {
        String[] counties = {"Puerto Rico", "Florida", "Alaska", "New York"};

        return ok(toJson(counties));
    }*/
}
