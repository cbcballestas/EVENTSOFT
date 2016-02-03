/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Carlos
 */
public class Consultas extends Conexion{

    public Consultas() {
        
        this.con= this.getConexion();
        
        
    }
    
    
    public int totalClientes(){
          
        try {
            Statement st = con.createStatement();
            ResultSet rs = null;
            String Consulta = "Select count(*) from cliente";
            rs = st.executeQuery(Consulta);
            
            if(rs.next())
                return rs.getInt(1);
            
            
          
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
          return 0;
    }
    
    public int totalEmpleados(){
          
        try {
            Statement st = con.createStatement();
            ResultSet rs = null;
            String Consulta = "Select count(*) from empleado";
            rs = st.executeQuery(Consulta);
            
            if(rs.next())
                return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
          return 0;
    }

    
    public int totalRecurso(){
          
        try {
            Statement st = con.createStatement();
            ResultSet rs = null;
            String Consulta = "Select count(*) from recurso";
            rs = st.executeQuery(Consulta);
            
            if(rs.next())
                return rs.getInt(1);
            
            
          
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
          return 0;
    }
    
    public int totalEventos(){
          
        try {
            Statement st = con.createStatement();
            ResultSet rs = null;
            String Consulta = "Select count(*) from evento";
            rs = st.executeQuery(Consulta);
            
            if(rs.next())
                return rs.getInt(1);
            
            
          
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
          return 0;
    }
    
    
    public boolean Autenticacion(String user,String pass) throws SQLException
    {
        
        Statement st = con.createStatement();
        ResultSet rs = null;
        String Consulta = "Select user,pass from administrador";
        rs = st.executeQuery(Consulta);
        
        while(rs.next())
        {
            if(user.equals(rs.getString("user")) && pass.equals(rs.getString("pass")))
                return true;
        }
  
        return false;
    }
    
    
    public Recurso consultarRecurso(int cod) throws SQLException
    {
        Recurso r =new Recurso();
        ResultSet rs = null;
        String Consulta = "Select * from recurso where codigo=?";
        PreparedStatement st = con.prepareStatement(Consulta);
        st.setInt(1, cod);
        rs= st.executeQuery();
        
        if(rs.next()){
        r.Cargar(rs);
        return r;
        }else return null;
    }
    
    
}