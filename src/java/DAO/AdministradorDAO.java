/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author USUARIO1
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Conexion;
import modelo.Administrador;

/**
 *
 * @author COMPUTER
 */
public class AdministradorDAO{
    
    Conexion conexion;
    public AdministradorDAO(){
         conexion = new Conexion();
    }
     public ArrayList<Administrador> getListaAdministradores(){
        ArrayList<Administrador> administradores=new ArrayList<>();
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Administrador administrador=null;
        try {
            
            PreparedStatement s = accesoDB.prepareStatement("select * from administrador");
          
            
            ResultSet rs = s.executeQuery();
            while(rs.next()){
               administrador = new Administrador();
               administrador.setIdentificacion(rs.getInt("identificacion"));
               administrador.setNombre(rs.getString("nombre"));
               administrador.setApellidos(rs.getString("apellidos"));
               administrador.setTelefono(rs.getString("telefono"));
               administrador.setDireccion(rs.getString("direccion"));
               administrador.setEmail(rs.getString("email"));
               administrador.setCiudad(rs.getString("ciudad"));
               administrador.setCelular(rs.getString("celular"));
               administrador.setCelular(rs.getString("user"));
               administrador.setCelular(rs.getString("pass"));
               administradores.add(administrador); 
     
               
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return administradores; 
    }
}
