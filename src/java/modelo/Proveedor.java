/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author USUARIO1
 */
public class Proveedor {
    int id;
    String nombre;
    String direccion;
    String telefono;
    String celular;

    
    public void Cargar(ResultSet rs) throws SQLException{
              
        if(rs != null)
        {
            this.setId(rs.getInt("id"));
               this.setNombre(rs.getString("nombre"));
               this.setDireccion(rs.getString("direccion"));
               this.setTelefono(rs.getString("telefono"));
               this.setCelular(rs.getString("celular"));
        }
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }
    
}
