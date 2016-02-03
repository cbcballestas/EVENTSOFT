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
import modelo.Proveedor;
import modelo.Recurso;

/**
 *
 * @author COMPUTER
 */
public class ProveedorDAO{
    
    Conexion conexion;
    public ProveedorDAO(){
         conexion = new Conexion();
    }
     public ArrayList<Proveedor> getListaProveedores(){
        ArrayList<Proveedor> lista_Proveedores=new ArrayList<>();
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Proveedor p=null;
        try {
            
            PreparedStatement s = accesoDB.prepareStatement("select * from proveedor");
          
            
            ResultSet rs = s.executeQuery();
            while(rs.next()){
                
               p = new Proveedor();
               p.Cargar(rs);
               lista_Proveedores.add(p); 
               
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return lista_Proveedores; 
    }
     
     
     
     
     
     public Proveedor getProveedorByID(int id_proveedor){
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Proveedor proveedor=null;
        try {
            
            PreparedStatement ps = accesoDB.prepareStatement("select * from proveedor where id=?");
            ps.setInt(1, id_proveedor);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(id_proveedor==rs.getInt("id")){
               proveedor = new Proveedor();
               proveedor.Cargar(rs);
               
                
               }
               
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return proveedor;  
     }
    
    
}

