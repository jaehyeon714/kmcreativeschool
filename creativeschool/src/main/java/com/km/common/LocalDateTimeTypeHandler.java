package com.km.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class LocalDateTimeTypeHandler implements TypeHandler<LocalDateTime> {

	@Override
	public void setParameter(PreparedStatement ps, int i, LocalDateTime parameter, JdbcType jdbcType)
			throws SQLException {
		if(parameter!=null)
			ps.setTimestamp(i, Timestamp.valueOf(parameter));		
	}

	@Override
	public LocalDateTime getResult(ResultSet rs, String columnName) throws SQLException {
		if(rs.getTimestamp(columnName)!=null)
			return rs.getTimestamp(columnName).toLocalDateTime();
		return null;
	}

	@Override
	public LocalDateTime getResult(ResultSet rs, int columnIndex) throws SQLException {
		if(rs.getTimestamp(columnIndex)!=null)
			return rs.getTimestamp(columnIndex).toLocalDateTime();
		return null;
	}

	@Override
	public LocalDateTime getResult(CallableStatement cs, int columnIndex) throws SQLException {
		if(cs.getTimestamp(columnIndex)!=null)
			return cs.getTimestamp(columnIndex).toLocalDateTime();
		return null;
	}

	
	
	
}
