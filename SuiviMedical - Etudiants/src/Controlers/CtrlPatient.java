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

public class CtrlPatient
{
    private Connection cnx;
    private PreparedStatement ps;
    private ResultSet rs;

    public CtrlPatient() {
        cnx = ConnexionBDD.getCnx();
    }

    public ArrayList<String> getAllPatients()
    {
        ArrayList<String> lesPatients = new ArrayList<>();
        try {
            ps = cnx.prepareStatement("select nomPatient from patient");
            rs = ps.executeQuery();
            while (rs.next()) {
                String patient = rs.getString("nomPatient");
                lesPatients.add(patient);
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtrlPatient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lesPatients;

        // return null;
    }
    public int getIdPatientByName(String nomPat)
    {
        int idPatient = 0;
        try {
            ps = cnx.prepareStatement("select idPatient from patient where nomPatient = ?");
            ps.setString(1, nomPat);
            rs = ps.executeQuery();
            rs.next();
            idPatient = rs.getInt("idPatient");
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtrlPatient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idPatient;

        //return 0;
    }
}
