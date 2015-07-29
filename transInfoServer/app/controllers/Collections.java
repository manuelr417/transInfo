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

    public static Result getZoneTypes() {
        return getCollection("ZoneType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ZoneTypeID", rs.getInt("ZoneTypeID"));
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

    public static Result getHarmfulEvents() {
        return getCollection("HarmfulEvent", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("HarmfulEventID", rs.getInt("HarmfulEventID"));
                    rec.put("HarmfulEventCatID", rs.getInt("HarmfulEventCatID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getHarmfulEventCategories() {
        return getCollection("HarmfulEventCategory", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("HarmfulEventCatID", rs.getInt("HarmfulEventCatID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRelativeToTrafficways() {
        return getCollection("RelativeToTrafficway", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RelToTrafficwayID", rs.getInt("RelToTrafficwayID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getMannerOfCollisions() {
        return getCollection("MannerOfCollision", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("MannerOfCollisionID", rs.getInt("MannerOfCollisionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getWeatherConditions() {
        return getCollection("WeatherCondition", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("WeatherConditionID", rs.getInt("WeatherConditionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getLightingConditions() {
        return getCollection("Lighting", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("LightingID", rs.getInt("LightingID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRoadSurfaces() {
        return getCollection("RoadSurface", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RoadSurfaceID", rs.getInt("RoadSurfaceID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getEnvironmentConditions() {
        return getCollection("EnvironmentCondition", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("EnvironmentConditionID", rs.getInt("EnvironmentConditionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRoadCircumstances() {
        return getCollection("RoadCircumstance", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RoadCircumstanceID", rs.getInt("RoadCircumstanceID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getWithinInterchanges() {
        return getCollection("WithinInterchange", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("WithinInterchangeID", rs.getInt("WithinInterchangeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getJunctions() {
        return getCollection("Junction", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("JunctionID", rs.getInt("JunctionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getIntersectionTypes() {
        return getCollection("IntersectionType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("IntersectionTypeID", rs.getInt("IntersectionTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSchoolBusRelated() {
        return getCollection("SchoolBusRelated", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SchoolBusRelatedID", rs.getInt("SchoolBusRelatedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getWorkzoneRelated() {
        return getCollection("WorkzoneRelated", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("WorkzoneRelatedID", rs.getInt("WorkzoneRelatedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getWorkzoneLocation() {
        return getCollection("WorkzoneLocation", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("WorkzoneLocationID", rs.getInt("WorkzoneLocationID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getWorkzoneType() {
        return getCollection("WorkzoneType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("WorkzoneTypeID", rs.getInt("WorkzoneTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getWorkersPresent() {
        return getCollection("WorkersPresent", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("WorkersPresentID", rs.getInt("WorkersPresentID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getLawEnforcementPresent() {
        return getCollection("LawEnforcementPresent", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("LawEnforcementPresentID", rs.getInt("LawEnforcementPresentID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    /*
    GET     /personTypeCategories       controllers.Collections.getPersonTypeCategories()
    GET     /personTypes                controllers.Collections.getPersonTypes()
    GET     /driverLicenseTypes         controllers.Collections.getDriverLicenseTypes()
    GET     /genders                    controllers.Collections.getGenders()
    GET     /organDonor                 controllers.Collections.getOrganDonor()
    GET     /vehicles                   controllers.Collections.getVehicles())
    */

    public static Result getPersonTypeCategories() {
        return getCollection("PersonTypeCategory", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("PersonTypeCategoryID", rs.getInt("PersonTypeCategoryID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getPersonTypes() {
        return getCollection("PersonType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("PersonTypeID", rs.getInt("PersonTypeID"));
                    rec.put("PersonTypeCategoryID", rs.getInt("PersonTypeCategoryID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDriverLicenseTypes() {
        return getCollection("DriverLicenseType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DriverLicenseTypeID", rs.getInt("DriverLicenseTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getGenders() {
        return getCollection("Sex", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("GenderID", rs.getInt("SexID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getOrganDonor() {
        return getCollection("OrganDonor", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("OrganDonorID", rs.getInt("OrganDonorID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getVehicles() {
        return getCollection("VehicleModelYear", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("VehicleTypeID", rs.getInt("id"));
                    rec.put("VehicleYear", rs.getString("year"));
                    rec.put("VehicleMake", rs.getString("make"));
                    rec.put("VehicleModel", rs.getString("model"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getVehicleTypes() {
        return getCollection("VehicleType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("VehicleTypeID", rs.getInt("VehicleTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getVehicleJurisdictions() {
        return getCollection("VehicleJurisdiction", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("VehicleJurisdictionID", rs.getInt("VehicleJurisdictionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getBodyTypes() {
        return getCollection("BodyType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("BodyTypeID", rs.getInt("BodyTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSpecialFunctions() {
        return getCollection("SpecialFunction", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SpecialFunctionID", rs.getInt("SpecialFunctionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getEmergencyUses() {
        return getCollection("EmergencyUse", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("EmergencyUseID", rs.getInt("EmergencyUseID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));
                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getPostedSpeeds() {
        return getCollection("PostedSpeed", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("PostedSpeedID", rs.getInt("PostedSpeedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDirectionsOfTravel() {
        return getCollection("DirectionOfTravel", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DirectionOfTravelID", rs.getInt("DirectionOfTravelID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTrafficwayDescriptions() {
        return getCollection("TrafficwayDescription", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TrafficwayDescriptionID", rs.getInt("TrafficwayDescriptionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTotalLanesCategories() {
        return getCollection("TotalLanesCategory", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TotalLanesCategoryID", rs.getInt("TotalLanesCategoryID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTotalLanes() {
        return getCollection("TotalLanes", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TotalLanesID", rs.getInt("TotalLanesID"));
                    rec.put("TotalLanesCategoryID", rs.getInt("TotalLanesCategoryID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRoadwayHorizontalAlignments() {
        return getCollection("RoadwayHorizontalAlignment", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RoadwayHorizontalAlignmentID", rs.getInt("RoadwayHorizontalAlignmentID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRoadwayGrades() {
        return getCollection("RoadwayGrade", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RoadwayGradeID", rs.getInt("RoadwayGradeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTCDWorking() {
        return getCollection("TCDWorking", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TCDWorkingID", rs.getInt("TCDWorkingID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTCDTypes() {
        return getCollection("TCDType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TCDTypeID", rs.getInt("TCDTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getActions() {
        return getCollection("Action", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ActionID", rs.getInt("ActionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getInitialContactPoints() {
        return getCollection("InitialContactPoint", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("InitialContactPointID", rs.getInt("InitialContactPointID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDamagedAreas() {
        return getCollection("DamagedArea", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DamagedAreaID", rs.getInt("DamagedAreaID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getExtentOfDamages() {
        return getCollection("ExtentOfDamage", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ExtentOfDamageID", rs.getInt("ExtentOfDamageID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getHitAndRun() {
        return getCollection("HitAndRun", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("HitAndRunID", rs.getInt("HitAndRunID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTowedBy() {
        return getCollection("TowedBy", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TowedByID", rs.getInt("TowedByID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getVehicleCircumstances() {
        return getCollection("VehicleCircumstance", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("VehicleCircumstanceID", rs.getInt("VehicleCircumstanceID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getMotorCarrierTypes() {
        return getCollection("MotorCarrierType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("MotorCarrierTypeID", rs.getInt("MotorCarrierTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getVehicleMovements() {
        return getCollection("VehicleMovement", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("VehicleMovementID", rs.getInt("VehicleMovementID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDriverIsAuthorized() {
        return getCollection("DriverIsAuthorized", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DriverIsAuthorizedID", rs.getInt("DriverIsAuthorizedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getInspectionUpToDate() {
        return getCollection("InspectionUpToDate", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("InspectionUpToDateID", rs.getInt("InspectionUpToDateID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSpecialPermits() {
        return getCollection("SpecialPermit", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SpecialPermitID", rs.getInt("SpecialPermitID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getGVWRGCWR() {
        return getCollection("GVWRGCWR", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("GVWRGCWRID", rs.getInt("GVWRGCWRID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getConfigurations() {
        return getCollection("Configuration", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ConfigurationID", rs.getInt("ConfigurationID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getCargoBodyTypes() {
        return getCollection("CargoBodyType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("CargoBodyTypeID", rs.getInt("CargoBodyTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getHazMatInvolved() {
        return getCollection("HazMatInvolved", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("HazMatInvolvedID", rs.getInt("HazMatInvolvedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getPlacardDisplayed() {
        return getCollection("PlacardDisplayed", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("PlacardDisplayedID", rs.getInt("PlacardDisplayedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getHazMatReleased() {
        return getCollection("HazMatReleased", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("HazMatReleasedID", rs.getInt("HazMatReleasedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRows() {
        return getCollection("Row", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RowID", rs.getInt("RowID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSeats() {
        return getCollection("Seat", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SeatID", rs.getInt("SeatID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSeatingOthers() {
        return getCollection("SeatingOther", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SeatingOtherID", rs.getInt("SeatingOtherID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getRestraintSystems() {
        return getCollection("RestraintSystem", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("RestraintSystemID", rs.getInt("RestraintSystemID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getHelmetUses() {
        return getCollection("HelmetUse", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("HelmetUseID", rs.getInt("HelmetUseID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getAirbagDeployed() {
        return getCollection("AirbagDeployed", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("AirbagDeployedID", rs.getInt("AirbagDeployedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getEjections() {
        return getCollection("Ejection", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("EjectionID", rs.getInt("EjectionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getExtrications() {
        return getCollection("Extrication", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ExtricationID", rs.getInt("ExtricationID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSpeedingSuspected() {
        return getCollection("SpeedingSuspected", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SpeedingSuspectedID", rs.getInt("SpeedingSuspectedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getContribActionsCircumstances() {
        return getCollection("ContribActionsCircumstance", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ContribActionsCircumstanceID", rs.getInt("ContribActionsCircumstanceID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDistractedBy() {
        return getCollection("DistractedBy", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DistractedByID", rs.getInt("DistractedByID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getConditions() {
        return getCollection("`Condition`", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ConditionID", rs.getInt("ConditionID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getActionsPriorToCrash() {
        return getCollection("ActionPriorToCrash", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ActionPriorToCrashID", rs.getInt("ActionPriorToCrashID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getToFromSchool() {
        return getCollection("ToFromSchool", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ToFromSchoolID", rs.getInt("ToFromSchoolID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getActionsAtTimeOfCrash() {
        return getCollection("ActionAtTimeOfCrash", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("ActionAtTimeOfCrashID", rs.getInt("ActionAtTimeOfCrashID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getNonMotoristLocations() {
        return getCollection("NonMotoristLocation", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("NonMotoristLocationID", rs.getInt("NonMotoristLocationID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    /*
    GET     /safetyEquipments           controllers.Collections.getSafetyEquipments()
GET     /substancesSuspected        controllers.Collections.getSubstancesSuspected()
GET     /testStatuses               controllers.Collections.getTestStatuses()
GET     /alcoholTestTypes           controllers.Collections.getAlcoholTestTypes()
GET     /alcoholResults             controllers.Collections.getAlcoholResults()
GET     /drugTestTypes              controllers.Collections.getDrugTestTypes()
GET     /drugTestResults            controllers.Collections.getDrugTestResults()
     */

    public static Result getSafetyEquipments() {
        return getCollection("SafetyEquipment", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SafetyEquipmentID", rs.getInt("SafetyEquipmentID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getSubstancesSuspected() {
        return getCollection("SubstanceSuspected", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("SubstanceSuspectedID", rs.getInt("SubstanceSuspectedID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getTestStatuses() {
        return getCollection("TestStatus", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("TestStatusID", rs.getInt("TestStatusID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getAlcoholTestTypes() {
        return getCollection("AlcoholTestType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("AlcoholTestTypeID", rs.getInt("AlcoholTestTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getAlcoholTestResults() {
        return getCollection("AlcoholTestResult", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("AlcoholTestResultID", rs.getInt("AlcoholTestResultID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDrugTestTypes() {
        return getCollection("DrugTestType", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DrugTestTypeID", rs.getInt("DrugTestTypeID"));
                    rec.put("DescriptionES", rs.getString("DescriptionES"));
                    rec.put("DescriptionEN", rs.getString("DescriptionEN"));

                } catch (SQLException e) {
                    return null;
                }

                return rec;
            }
        });
    }

    public static Result getDrugTestResults() {
        return getCollection("DrugTestResult", new GetRows() {
            @Override
            public ObjectNode getRows(ResultSet rs) {
                ObjectNode rec = Json.newObject();

                try {
                    rec.put("DrugTestResultID", rs.getInt("DrugTestResultID"));
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
