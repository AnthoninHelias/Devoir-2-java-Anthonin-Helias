package Controlers;

import Entities.Consultation;
import Tools.ConnexionBDD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CtrlMedecin
{
    private Connection cnx;
    private PreparedStatement ps;
    private ResultSet rs;

    public CtrlMedecin() {
        cnx = ConnexionBDD.getCnx();
    }

    public ArrayList<String> getAllMedecins()
    {
        ArrayList<String> lesMedecins = new ArrayList<>();
        try {
            ps = cnx.prepareStatement("select idMedecin, nomMedecin from medecin");
            rs = ps.executeQuery();
            while (rs.next()) {
                String medecin = rs.getString("nomMedecin");
                lesMedecins.add(medecin);
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtrlMedecin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lesMedecins;
        // return null;
    }

    public int getIdMedecinByName(String nomMed)
    {
        int idMedecin = 0;
        try {
            ps = cnx.prepareStatement("select idMedecin from medecin where nomMedecin = ?");
            ps.setString(1, nomMed);
            rs = ps.executeQuery();
            rs.next();
            idMedecin = rs.getInt("idMedecin");
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtrlMedecin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idMedecin;
        //return 0;
    }
}
