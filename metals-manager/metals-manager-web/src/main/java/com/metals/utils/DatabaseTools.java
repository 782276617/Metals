package com.metals.utils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import org.springframework.stereotype.Repository;

@Repository
public class DatabaseTools {
    
    private  static   String url = null;   
    private static  String username = null;  
    private static  String password = null;   
    
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    

    	static {
       		ResourceBundle bundle=ResourceBundle.getBundle("properties/db");
       		
    		url = bundle.getString("jdbc.url");
    		username = bundle.getString("jdbc.username");
    		password = bundle.getString("jdbc.password");
    		try{   
	        	//加载MySql的驱动类   
	    		Class.forName("com.mysql.jdbc.Driver") ;   
	        }catch(ClassNotFoundException e){   
	        	System.out.println("找不到驱动程序类 ，加载驱动失败！");   
	        	e.printStackTrace() ;   
	        }   
    	}

    
    
    public static Connection getConnection(){
        try{   
        	conn =   DriverManager.getConnection(url , username , password ) ;   
             }catch(SQLException se){   
            	 System.out.println("数据库连接失败！");   
            	 conn=null;
            	 se.printStackTrace() ;   
             }   
        return conn;
    }
    
    public static String queryDatabaseVersion(){
        Connection conn = null;
        String version = "未知版本号";
        try {
            conn = getConnection();
            DatabaseMetaData md = conn.getMetaData();
            String str1 = md.getDatabaseProductName() + " " +
                          md.getDatabaseProductVersion().toUpperCase();
            return str1;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            	closeConn(rs,stmt,conn);
        }

        return version;
    }

	private static  void closeConn(ResultSet rs,Statement stmt,Connection conn) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
	}

}

