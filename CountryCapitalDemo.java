package buttondemo;

import javax.swing.*;
import javax.swing.event.*;

public class CountryCapitalDemo {

    JFrame f;
    JList<String> list;

    CountryCapitalDemo() {

        f = new JFrame("Country Capital Demo");

        // Countries
        String countries[] = {
            "USA", "India", "Vietnam", "Canada", "Denmark",
            "France", "Great Britain", "Japan", "Africa",
            "Greenland", "Singapore"
        };

        // Capitals
        String capitals[] = {
            "Washington D.C.", "New Delhi", "Hanoi", "Ottawa", "Copenhagen",
            "Paris", "London", "Tokyo", "No Single Capital",
            "Nuuk", "Singapore"
        };

        // Create JList
        list = new JList<>(countries);
        list.setBounds(50, 50, 150, 150);

        // Event handling
        list.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent e) {
                int index = list.getSelectedIndex();
                if (index != -1) {
                    System.out.println(
                        "Country: " + countries[index] +
                        " | Capital: " + capitals[index]
                    );
                }
            }
        });

        f.add(list);
        f.setSize(300, 300);
        f.setLayout(null);
        f.setVisible(true);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {
        new CountryCapitalDemo();
    }
}