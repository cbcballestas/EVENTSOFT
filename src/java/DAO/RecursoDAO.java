/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Conexion;
import modelo.Recurso;

/**
 *
 * @author COMPUTER
 */
public class RecursoDAO{
    
    Conexion conexion;
    public RecursoDAO(){
         conexion = new Conexion();
    }
     public ArrayList<Recurso> getListaRecurso(){
        ArrayList<Recurso> recursos=new ArrayList<>();
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Recurso recurso=null;
        try {
            
            PreparedStatement ps = accesoDB.prepareStatement("select * from recurso");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               recurso = new Recurso();
               recurso.setId(rs.getInt("codigo"));
               recurso.setNombre(rs.getString("nombre"));
               recurso.setPrecioUso(rs.getDouble("precio_uso"));
               recurso.setEstado(rs.getString("estado"));
               recurso.setTipoPropiedad(rs.getString("tipo_propiedad"));
               recurso.setCantidad(rs.getInt("cantidad"));
               recurso.setDescripcion(rs.getString("descripcion"));
               recurso.setId_proveedor(rs.getInt("Proveedor_id"));
               recursos.add(recurso); 
               
                
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return recursos; 
    }
     
    
    
}
