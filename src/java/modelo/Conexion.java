/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.DriverManager;
import java.sql.DriverManager;
import com.mysql.jdbc.Connection;
import java.sql.SQLException;

/**
 *
 * @author Carlos
 */
public class Conexion
{
    
    public static final String USERNAME = "root";
    public static final String PASSWORD = "programas";
    public static final String HOST = "localhost";
    public static final String PORT = "3306";
    public static final String DATABASE = "gestion_eventos";
    public static final String CLASSNAME = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://"+ HOST +":"+PORT+"/"+DATABASE;
    
     public java.sql.Connection con;
     
       public Conexion() {
}
       
       public java.sql.Connection getConexion(){
        java.sql.Connection con=null;
        try{
            /* Carga|Registra el driver JDBC */
            Class.forName("com.mysql.jdbc.Driver");
            /* Obtener la conexion */
	    con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }catch(SQLException ex){
            System.out.println("Error al conectar la base de datos");
        }catch(Exception e){  
            System.out.println("Error al conectar la base de datos");
        }
        return con;
    } 
       /* PARA PROBAR SI ESTA BIEN LA CONEXION
       public static void main(String[]args){
           Conexion con=new Conexion();
       }*/
 
        
}

