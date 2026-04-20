package buttondemo;

import java.awt.Color;
import javax.swing.*;

public class TabbedPaneExamples {

    JFrame f;

    TabbedPaneExamples() {

        f = new JFrame();

        JPanel p1 = new JPanel();
        JPanel p2 = new JPanel();
        JPanel p3 = new JPanel();

        // Set colors
        p1.setBackground(Color.CYAN);
        p2.setBackground(Color.MAGENTA);
        p3.setBackground(Color.YELLOW);

        // Create TabbedPane
        JTabbedPane tp = new JTabbedPane();
        tp.setBounds(50, 50, 200, 200);

        // Add tabs
        tp.add("CYAN", p1);
        tp.add("MAGENTA", p2);
        tp.add("YELLOW", p3);

        // Add to frame
        f.add(tp);

        f.setSize(300, 300);
        f.setLayout(null);
        f.setVisible(true);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {
        new TabbedPaneExample();
    }
}