package gui.oyentes;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.plot.JFuzzyChart;

public class OyenteBoton implements ActionListener{

	JTextField T1;
	JTextField T2;
	JTextField T3;
	JTextArea TA1;
	
	public OyenteBoton(JTextField t1, JTextField t2, JTextField t3, JTextArea ta1) {
		// TODO Auto-generated constructor stub
		T1 = t1;
		T2 = t2;
		T3 = t3;
		TA1 = ta1;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String actionCommand = e.getActionCommand();
		if (e.getSource() instanceof JButton) {
			if("Enviar".equals(actionCommand)) {
				FIS potenciaAire  = FIS.load("src/fuzzy/fine-e.fcl", true);
				
				// Set inputs
				potenciaAire .setVariable("medida", Double.parseDouble(T1.getText()));
				potenciaAire .setVariable("cantidadp", Double.parseDouble(T2.getText()));
				potenciaAire .setVariable("temperatura", Double.parseDouble(T3.getText()));
		        
		        // Evaluate
				potenciaAire .evaluate(); 

		        //Graficas de conjuntos difusos
		        JFuzzyChart.get().chart(potenciaAire .getFunctionBlock("potenciaAire"));

		        // Show output variable
		        /**
		        TA1.setText(potenciaAire .getVariable("isa").toString());
		        */
		        TA1.setText(TA1.getText() + "El Indicador de Potencia (POT) es: " + potenciaAire .getVariable("isa").defuzzify());		        
		        TA1.setText(TA1.getText() + "\n \n" + "El metodo usado para 'defuzzificar' el POT fue: " + potenciaAire .getVariable("isa").getDefuzzifier());
		        TA1.setText(TA1.getText() + "\n \n" + "El grado de pertenencia a los conjuntos difusos es: ");
		        TA1.setText(TA1.getText() + "\n" + "	'bajo': " + potenciaAire .getVariable("isa").getMembership("bajo"));
		        TA1.setText(TA1.getText() + "\n" + "	'medio': " + potenciaAire .getVariable("isa").getMembership("medio"));
		        TA1.setText(TA1.getText() + "\n" + "	'alto': " + potenciaAire .getVariable("isa").getMembership("alto"));
		        TA1.setText(TA1.getText() + "\n \n" + "El Indicador de potencia  (POT) es una medida de 0 a 1, \n"
		        									+ "que dice aproximadamente que tan potente tiene que ser la calefacción un\n "
		        									+ "Siendo 0 muy baja y 1 muy alta.");
		        TA1.setEditable(false);
			}
		}
	}
}
