
package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDaoImp implements UsuarioDao{
    
    @Override    
    public List listar() {
        Connection cn=new Conexion().getConexion();
        ArrayList list = new ArrayList();
        String sql = "select * from tabla2";
        try{
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            ResultSetMetaData rsmd = rs.getMetaData();
            
            int cantCol = rsmd.getColumnCount();
            
            while(rs.next()){
                Object[] user = new Object[cantCol];
                for(int i=0;i<cantCol;i++){
                    user[i]=rs.getString(rsmd.getColumnName(i+1));
                }
                list.add(user);
            }
            cn.close();
        }catch(Exception e){
            list = null;
        }
        return list;
    }
    
}
