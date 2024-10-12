package com.km.common;

import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;

public class CommonUtils {
	public final static String SITE_HOST="http://teacherdev09.kro.kr:9090";

	
	public static String clobToString(Clob clob) {
	    StringBuilder sb = new StringBuilder();
	    try (Reader reader = clob.getCharacterStream()) {
	        char[] buffer = new char[1024];
	        int length;
	        while ((length = reader.read(buffer)) != -1) {
	            sb.append(buffer, 0, length);
	        }
	    } catch (SQLException | IOException e) {
	        e.printStackTrace();
	    }
	    return sb.toString();
	}
}
