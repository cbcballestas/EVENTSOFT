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
import modelo.Cargo;
import modelo.Conexion;
/**
 *
 * @author USUARIO1
 */
public class CargoDAO {
    Conexion conexion;
    public CargoDAO(){
         conexion = new Conexion();
    }
     public ArrayList<Cargo> getListaCargos(){
        ArrayList<Cargo> cargos=new ArrayList<>();
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Cargo cargo=null;
        try {
            
            PreparedStatement ps = accesoDB.prepareStatement("select * from cargo");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               cargo = new Cargo();
               cargo.setCodigo(rs.getInt("codigo"));
               cargo.setNombre(rs.getString("nombre"));
               cargos.add(cargo); 
               
                
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return cargos; 
    }
     
}
