package controllers;

import play.mvc.Controller;
import play.mvc.Result;

import static play.libs.Json.toJson;

/**
 * Created by omarpr on 7/1/14.
 */
public class Collections extends Controller {
    public static Result getCounties() {
        String[] counties = {"Puerto Rico", "Florida", "Alaska", "New York"};

        return ok(toJson(counties));
    }
}
