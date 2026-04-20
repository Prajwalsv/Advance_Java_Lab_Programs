package buttondemo;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class StyledImageButtonDemo extends JFrame implements ActionListener {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	JButton btnClock, btnHourGlass;
    JLabel titleLabel, messageLabel;

    public StyledImageButtonDemo() {

        setTitle("Exercise Program");
        setSize(700, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Top Title
        titleLabel = new JLabel("You have pressed digital clock!", JLabel.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 22));
        titleLabel.setBorder(BorderFactory.createEmptyBorder(20, 10, 20, 10));

        add(titleLabel, BorderLayout.NORTH);

        // Center Panel for Images
        JPanel panel = new JPanel();
        panel.setLayout(new FlowLayout(FlowLayout.CENTER, 80, 40));

        // Load images (keep in project folder)
        ImageIcon clockIcon = new ImageIcon("digital.jpg");
        ImageIcon hourGlassIcon = new ImageIcon("glass.jpg");

        btnClock = new JButton(clockIcon);
        btnHourGlass = new JButton(hourGlassIcon);

        // Remove button borders (for clean look like image)
        btnClock.setBorderPainted(false);
        btnHourGlass.setBorderPainted(false);

        panel.add(btnClock);
        panel.add(btnHourGlass);

        add(panel, BorderLayout.CENTER);

        // Bottom message
        messageLabel = new JLabel("Click any image", JLabel.CENTER);
        messageLabel.setFont(new Font("Arial", Font.PLAIN, 16));
        messageLabel.setBorder(BorderFactory.createEmptyBorder(10, 10, 20, 10));

        add(messageLabel, BorderLayout.SOUTH);

        // Event Handling
        btnClock.addActionListener(this);
        btnHourGlass.addActionListener(this);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnClock) {
            titleLabel.setText("You have pressed digital clock!");
            messageLabel.setText("Digital Clock is pressed");
        } else if (e.getSource() == btnHourGlass) {
            titleLabel.setText("You have pressed hour glass!");
            messageLabel.setText("Hour Glass is pressed");
        }
    }

    public static void main(String[] args) {
        new StyledImageButtonDemo();
    }
}