/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clasesita;
import java.sql.*;
import java.sql.DriverManager;
/**
 *
 * @author artur
 */
public class Conectadita {
    Connection SQLConexion;
    
    public Conectadita(){
        String host = "192.168.0.239";
        String puerto = "3306";
        String bd = "fireReport";
        String usuario ="root";
        String pass= "";
        String driver ="com.mysql.cj.jdbc.Driver";
        String databaseURL = "jdbc:mysql://" + host +":"+puerto+"/"+bd+"?useSSL=false";
        try{
            Class.forName(driver);
            SQLConexion = DriverManager.getConnection(databaseURL, usuario, pass);
            
                    }catch(Exception ex){
        }
    }
    public Connection getConectarDB(){
        return SQLConexion;
    }
}
