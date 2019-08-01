package VISUAL;

import java.awt.*;
import DAL.conectaBd;
import java.sql.*;
import javax.swing.*;
import net.proteanit.sql.DbUtils;


public class frmListaPatrocinadores extends javax.swing.JInternalFrame {

    Connection conecta;
    PreparedStatement pst;
    ResultSet rs;
    
    public frmListaPatrocinadores() throws ClassNotFoundException {
        initComponents();
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        this.setLocation(dim.width/2-this.getSize().width/2, dim.height/2-this.getSize().height/2);
        conecta = conectaBd.conectabd();
        listarPatrocinadores();
    }

    public void listarPatrocinadores(){
        String sql = "Select * from patrocinador";
        try{
            pst = conecta.prepareStatement(sql);
            rs = pst.executeQuery();
            tblPatrocinadores.setModel(DbUtils.resultSetToTableModel(rs));
        }
        catch(SQLException error){
            JOptionPane.showMessageDialog(null, error);
        }
    }
    
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tblPatrocinadores = new javax.swing.JTable();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Lista de Patrocinadores");

        tblPatrocinadores.setAutoCreateRowSorter(true);
        tblPatrocinadores.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(tblPatrocinadores);

        getContentPane().add(jScrollPane1, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblPatrocinadores;
    // End of variables declaration//GEN-END:variables
}
