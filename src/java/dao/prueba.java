
package dao;

import java.util.ArrayList;
import java.util.List;

public class prueba {
    
    

    public static void main(String[] args) {
        UsuarioDaoImp userMan = new UsuarioDaoImp();
        List ListaUser = userMan.listar();
        for(int i = 0; i<ListaUser.size();i++){
            Object[] f1 = (Object[]) ListaUser.get(i);
            System.out.println("Usuario: "+f1[3]);
        }
    }
    
}
