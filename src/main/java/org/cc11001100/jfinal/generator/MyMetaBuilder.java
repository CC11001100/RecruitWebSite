package org.cc11001100.jfinal.generator;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.generator.MetaBuilder;

/**
 * 覆盖schemaPattern
 * 
 * @author CC11001100
 *
 */
public class MyMetaBuilder extends MetaBuilder {

	public MyMetaBuilder(DataSource dataSource) {
		super(dataSource);
	}
	
	@Override
	protected ResultSet getTablesResultSet() throws SQLException {
		String schemaPattern = dbMeta.getUserName() ;
		return dbMeta.getTables(conn.getCatalog(), schemaPattern, "%", new String[]{"TABLE", "VIEW"});
	}

}
