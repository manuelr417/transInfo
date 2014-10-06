package controllers;

import com.fasterxml.jackson.databind.node.ObjectNode;

import java.sql.ResultSet;

/**
 * Created by omarpr on 10/6/14.
 */
public interface GetRows {
    public ObjectNode getRows(ResultSet rs);
}
