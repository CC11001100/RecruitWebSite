package org.cc11001100.jfinal.generator;

import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.druid.DruidPlugin;

/**
 * 
 * Model生成器，用来从数据库表自动生成Model的
 * 
 * @author CC11001100
 *
 */
public class ModelGenerator {

	private static Logger log=Logger.getLogger(ModelGenerator.class);
	
	/**
	 * 用来从数据库生成Model
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		// base model 所使用的包名
		String baseModelPackageName = "com.demo.common.model.base";
		// base model 文件保存路径
		String baseModelOutputDir = PathKit.getWebRootPath() + "/src/main/java/com/demo/common/model/base";
		
		// model 所使用的包名 (MappingKit 默认使用的包名)
		String modelPackageName = "com.demo.common.model";
		// model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
		String modelOutputDir = baseModelOutputDir + "/..";
		
		// 创建生成器
		Generator generator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
		// 设置是否生成链式 setter 方法
		generator.setGenerateChainSetter(false);
		// 添加不需要生成的表名
		generator.addExcludedTable("adv");
		// 设置是否在 Model 中生成 dao 对象
		generator.setGenerateDaoInModel(true);
		// 设置是否生成链式 setter 方法
		generator.setGenerateChainSetter(true);
		// 设置是否生成字典文件
		generator.setGenerateDataDictionary(false);
		// 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
		generator.setRemovedTableNamePrefixes("t_");
		// 生成
		generator.generate();
	}
	
	/**
	 * 生成代码的时候使用druid连接池
	 * 
	 * @return
	 */
	public static DataSource getDataSource() {
		Prop jdbcProp=PropKit.use("config/jdbc.properties");
		DruidPlugin druidPlugin = new DruidPlugin(jdbcProp.get("mysql.url").trim(), jdbcProp.get("mysql.user").trim(), jdbcProp.get("mysql.passwd").trim(), jdbcProp.get("mysql.driver").trim());
		druidPlugin.start();
		return druidPlugin.getDataSource();
	}
	
}
