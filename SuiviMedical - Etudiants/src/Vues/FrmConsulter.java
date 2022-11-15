package Vues;

import Controlers.CtrlConsultation;
import Controlers.CtrlMedecin;
import Controlers.CtrlMedicament;
import Controlers.CtrlPatient;
import Tools.ModelJTable;

import javax.swing.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;

public class FrmConsulter extends JFrame
{
    private JPanel pnlRoot;
    private JLabel lblTitre;
    private JLabel lblConsultations;
    private JTable tblConsultations;
    private JLabel lblMedicaments;
    private JTable tblMedicaments;
    
    private CtrlConsultation ctrlConsultation;

    public FrmConsulter()
    {
        this.setTitle("Consulter");
        this.setContentPane(pnlRoot);
        this.pack();
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.setLocationRelativeTo(null);
        ctrlConsultation = new CtrlConsultation();
        this.addWindowListener(new WindowAdapter() {
            @Override
            public void windowOpened(WindowEvent e) {
                super.windowOpened(e);
                // A vous de jouer
                ModelJTable mdl = new ModelJTable();
                ctrlConsultation = new CtrlConsultation();
                try {
                    mdl.LoadDatasConsultation(ctrlConsultation.GetAllConsultations());
                } catch (Exception ex) {
                    throw new RuntimeException(ex);
                }
                tblConsultations.setModel(mdl);

            }
        });
        tblConsultations.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                // A vous de jouer

            }
        });
    }
}
