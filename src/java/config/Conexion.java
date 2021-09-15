
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private final String URL = "jdbc:mysql://localhost:3306/mibase3?zeroDateTimeBehavior=convertToNull";
    private final String DRIVER = "com.mysql.jdbc.Driver";
    private final String USER = "root";
    private final String PASS = "userrod";
    
    public Connection getConexion(){
        Connection c = null;
        try{
            Class.forName(DRIVER).newInstance();
            c = DriverManager.getConnection(URL,USER,PASS);
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e){
            c=null;
        }
        return c;
    }
    
}
