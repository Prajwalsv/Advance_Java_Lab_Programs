package buttondemo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class CountryButtonDemo extends JFrame implements ActionListener {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	JButton btnIndia, btnSrilanka;
    JLabel label;

    public CountryButtonDemo() {
        setTitle("Button Event Demo");
        setSize(400, 200);
        setLayout(new FlowLayout());
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        btnIndia = new JButton("India");
        btnSrilanka = new JButton("Srilanka");
        label = new JLabel("Press a button");

        btnIndia.addActionListener(this);
        btnSrilanka.addActionListener(this);

        add(btnIndia);
        add(btnSrilanka);
        add(label);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnIndia)
            label.setText("India is pressed");
        else if (e.getSource() == btnSrilanka)
            label.setText("Srilanka is pressed");
    }

    public static void main(String[] args) {
        new CountryButtonDemo();
    }
}