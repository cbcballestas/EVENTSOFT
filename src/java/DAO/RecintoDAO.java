/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author COMPUTER
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Conexion;
import modelo.Recinto;

/**
 *
 * @author COMPUTER
 */
public class RecintoDAO{
    
    Conexion conexion;
    public RecintoDAO(){
         conexion = new Conexion();
    }
     public ArrayList<Recinto> getListaRecintos(){
        ArrayList<Recinto> recintos=new ArrayList<>();
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Recinto recinto=null;
        try {
            
            PreparedStatement ps = accesoDB.prepareStatement("select * from recinto");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               recinto = new Recinto();
               recinto.setCodigo(rs.getInt("codigo"));
               recinto.setNombre(rs.getString("nombre"));
               recinto.setPrecioUso(rs.getDouble("precio_uso"));
               recinto.setDireccion(rs.getString("direccion"));
               recinto.setEstado(rs.getString("estado"));
               recinto.setTipoPropiedad(rs.getString("tipo_propiedad"));
               recinto.setId_Proveedor(rs.getInt("Proveedor_id"));
               recintos.add(recinto); 
               
                
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return recintos; 
    }
     
    
    
}
