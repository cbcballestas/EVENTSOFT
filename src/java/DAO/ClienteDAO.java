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
import modelo.Cliente;

/**
 *
 * @author COMPUTER
 */
public class ClienteDAO{
    
    Conexion conexion;
    public ClienteDAO(){
         conexion = new Conexion();
    }
     public ArrayList<Cliente> getListaClientes(){
        ArrayList<Cliente> clientes=new ArrayList<>();
        Connection accesoDB;
        accesoDB = conexion.getConexion();
        Cliente cliente=null;
        try {
            
            PreparedStatement s = accesoDB.prepareStatement("select * from cliente");
          
            
            ResultSet rs = s.executeQuery();
            while(rs.next()){
               cliente = new Cliente();
               cliente.setIdentificacion(rs.getInt("identificacion"));
               cliente.setNombres(rs.getString("nombre"));
               cliente.setApellidos(rs.getString("apellidos"));
               cliente.setTelefono(rs.getString("telefono"));
               cliente.setDireccion(rs.getString("direccion"));
               cliente.setEmail(rs.getString("email"));
               cliente.setCiudad(rs.getString("ciudad"));
               cliente.setCelular(rs.getString("celular"));
               clientes.add(cliente); 
     
               
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }
        return clientes; 
    }
}
