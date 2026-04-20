package arraylistprograms;

import java.util.*;

public class SearchColor {
    public static void main(String[] args) {

        // Create ArrayList
        ArrayList<String> colors = new ArrayList<>();

        // Add elements
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Original List: " + colors);

        // 1. Search for "Red"
        if (colors.contains("Red")) {
            System.out.println("Red is available in the list");
        } else {
            System.out.println("Red is NOT available");
        }

        // 2. Remove 2nd element and "Blue"
        colors.remove(1); // removes 2nd element
        colors.remove("Blue"); // removes Blue if present
        System.out.println("After removing 2nd element and Blue: " + colors);

        // Re-add elements for further operations
        colors.add("Blue");
        colors.add("Orange");

        System.out.println("Updated List: " + colors);

        // 3. Sort list
        Collections.sort(colors);
        System.out.println("After Sorting: " + colors);

        // 4. Extract 1st and 2nd elements using subList()
        List<String> sub = colors.subList(0, 2);
        System.out.println("SubList (1st & 2nd): " + sub);

        // 5. Remove nth element using index
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter index to remove: ");
        int n = sc.nextInt();

        if (n >= 0 && n < colors.size()) {
            colors.remove(n);
            System.out.println("After removing index " + n + ": " + colors);
        } else {
            System.out.println("Invalid index!");
        }

        sc.close();
    }
}