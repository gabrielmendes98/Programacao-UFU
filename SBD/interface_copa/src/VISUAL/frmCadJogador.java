package VISUAL;

import DAL.conectaBd;
import java.awt.*;
import java.sql.*;
import javax.swing.*;

public class frmCadJogador extends javax.swing.JInternalFrame {
    
    Connection conecta;
    PreparedStatement pst;
    ResultSet rs;

    public frmCadJogador() throws ClassNotFoundException {
        initComponents();
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        this.setLocation(dim.width/2-this.getSize().width/2, dim.height/2-this.getSize().height/2);
        conecta = conectaBd.conectabd();
    }
    
    public void cadastrarJogadores(){
        java.util.Date date;
        java.sql.Date sqldate;
        String sql = "Insert into jogador values(?,?,?,?,?,?,?)";
        
        try{
            if("".equals(txtPessoa.getText()) || "".equals(txtGols.getText()) || "".equals(txtAmarelo.getText()) || "".equals(txtVermelho.getText()) || "".equals(txtPosicao.getText()) || "".equals(txtSelecao.getText()) || null == dataAdmissao.getDate()){
                JOptionPane.showMessageDialog(null, "Preencha todos os campos do formulario");
            }
            
            else{
                date = dataAdmissao.getDate();
                sqldate = new java.sql.Date(date.getTime());
                pst = conecta.prepareStatement(sql);
                pst.setInt(1,Integer.parseInt(txtPessoa.getText()));
                pst.setInt(2,Integer.parseInt(txtGols.getText()));
                pst.setInt(3,Integer.parseInt(txtAmarelo.getText()));
                pst.setInt(4,Integer.parseInt(txtVermelho.getText()));
                pst.setString(5,txtPosicao.getText());
                pst.setDate(6, sqldate);
                pst.setInt(7,Integer.parseInt(txtSelecao.getText()));
                
                pst.execute();
                
                txtPessoa.setText("");
                txtGols.setText("");
                txtAmarelo.setText("");
                txtVermelho.setText("");
                txtPosicao.setText("");
                dataAdmissao.setDate(null);
                txtSelecao.setText("");
                
                JOptionPane.showMessageDialog(null, "Jogador cadastrado com sucesso!");
            }
        }
        
        catch(SQLException error){
            JOptionPane.showMessageDialog(null, error);
        }
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        jTextLabel1 = new javax.swing.JLabel();
        jTextLabel2 = new javax.swing.JLabel();
        jTextLabel3 = new javax.swing.JLabel();
        jTextLabel4 = new javax.swing.JLabel();
        jTextLabel5 = new javax.swing.JLabel();
        jTextLabel6 = new javax.swing.JLabel();
        jTextLabel7 = new javax.swing.JLabel();
        txtPessoa = new javax.swing.JTextField();
        txtGols = new javax.swing.JTextField();
        txtAmarelo = new javax.swing.JTextField();
        txtVermelho = new javax.swing.JTextField();
        txtPosicao = new javax.swing.JTextField();
        txtSelecao = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jInternalFrame1 = new javax.swing.JInternalFrame();
        jTextLabel8 = new javax.swing.JLabel();
        jTextLabel9 = new javax.swing.JLabel();
        jTextLabel10 = new javax.swing.JLabel();
        jTextLabel11 = new javax.swing.JLabel();
        jTextLabel12 = new javax.swing.JLabel();
        jTextLabel13 = new javax.swing.JLabel();
        jTextLabel14 = new javax.swing.JLabel();
        txtPessoa1 = new javax.swing.JTextField();
        txtGols1 = new javax.swing.JTextField();
        txtAmarelo1 = new javax.swing.JTextField();
        txtVermelho1 = new javax.swing.JTextField();
        txtPosicao1 = new javax.swing.JTextField();
        txtSelecao1 = new javax.swing.JTextField();
        jButton2 = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 234, 0));
        setBorder(new javax.swing.border.LineBorder(new java.awt.Color(10, 163, 35), 10, true));
        setClosable(true);
        setIconifiable(true);
        setTitle("Cadastro de Jogadores");
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        getContentPane().setLayout(new java.awt.GridBagLayout());

        jTextLabel1.setText("ID da pessoa:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel1, gridBagConstraints);

        jTextLabel2.setText("Quantidade de gols:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel2, gridBagConstraints);

        jTextLabel3.setText("Número de cartões amarelos:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel3, gridBagConstraints);

        jTextLabel4.setText("Número de cartôes vermelhos:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel4, gridBagConstraints);

        jTextLabel5.setText("Posição em que joga:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel5, gridBagConstraints);

        jTextLabel6.setText("Data de admissão:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel6, gridBagConstraints);

        jTextLabel7.setText("ID da seleção em que joga:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jTextLabel7, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(txtPessoa, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(txtGols, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(txtAmarelo, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(txtVermelho, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(txtPosicao, gridBagConstraints);

        txtSelecao.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtSelecaoActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(txtSelecao, gridBagConstraints);

        jButton1.setText("Cadastrar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 7;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        getContentPane().add(jButton1, gridBagConstraints);

        jInternalFrame1.setClosable(true);
        jInternalFrame1.setIconifiable(true);
        jInternalFrame1.setTitle("Cadastro de Jogadores");
        jInternalFrame1.getContentPane().setLayout(new java.awt.GridBagLayout());

        jTextLabel8.setText("ID da pessoa:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel8, gridBagConstraints);

        jTextLabel9.setText("Quantidade de gols:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel9, gridBagConstraints);

        jTextLabel10.setText("Número de cartões amarelos:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel10, gridBagConstraints);

        jTextLabel11.setText("Número de cartôes vermelhos:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel11, gridBagConstraints);

        jTextLabel12.setText("Posição em que joga:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel12, gridBagConstraints);

        jTextLabel13.setText("Data de admissão:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel13, gridBagConstraints);

        jTextLabel14.setText("ID da seleção em que joga:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.EAST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jTextLabel14, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(txtPessoa1, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(txtGols1, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(txtAmarelo1, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(txtVermelho1, gridBagConstraints);
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(txtPosicao1, gridBagConstraints);

        txtSelecao1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtSelecao1ActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.ipadx = 300;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(txtSelecao1, gridBagConstraints);

        jButton2.setText("Cadastrar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 7;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jInternalFrame1.getContentPane().add(jButton2, gridBagConstraints);

        getContentPane().add(jInternalFrame1, new java.awt.GridBagConstraints());

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtSelecaoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtSelecaoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtSelecaoActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
         cadastrarJogadores();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void txtSelecao1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtSelecao1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtSelecao1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JInternalFrame jInternalFrame1;
    private javax.swing.JLabel jTextLabel1;
    private javax.swing.JLabel jTextLabel10;
    private javax.swing.JLabel jTextLabel11;
    private javax.swing.JLabel jTextLabel12;
    private javax.swing.JLabel jTextLabel13;
    private javax.swing.JLabel jTextLabel14;
    private javax.swing.JLabel jTextLabel2;
    private javax.swing.JLabel jTextLabel3;
    private javax.swing.JLabel jTextLabel4;
    private javax.swing.JLabel jTextLabel5;
    private javax.swing.JLabel jTextLabel6;
    private javax.swing.JLabel jTextLabel7;
    private javax.swing.JLabel jTextLabel8;
    private javax.swing.JLabel jTextLabel9;
    private javax.swing.JTextField txtAmarelo;
    private javax.swing.JTextField txtAmarelo1;
    private javax.swing.JTextField txtGols;
    private javax.swing.JTextField txtGols1;
    private javax.swing.JTextField txtPessoa;
    private javax.swing.JTextField txtPessoa1;
    private javax.swing.JTextField txtPosicao;
    private javax.swing.JTextField txtPosicao1;
    private javax.swing.JTextField txtSelecao;
    private javax.swing.JTextField txtSelecao1;
    private javax.swing.JTextField txtVermelho;
    private javax.swing.JTextField txtVermelho1;
    // End of variables declaration//GEN-END:variables

}
