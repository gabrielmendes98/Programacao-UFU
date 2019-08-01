package DAL;
import java.sql.*;
import javax.swing.JOptionPane;

public class conectaBd {
    
    public static Connection conectabd() throws ClassNotFoundException{
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/copa", "postgres", "141098");
            //JOptionPane.showMessageDialog(null, "Conectado com sucesso!");
            return con;
        }
        
        catch(SQLException error){
            JOptionPane.showMessageDialog(null, error);
            return null;
        }
    }
}
