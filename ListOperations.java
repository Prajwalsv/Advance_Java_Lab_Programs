package listprograms;

import java.util.*;

public class ListOperations {

    // 1. Adding elements
    public static void addElements(List<String> list) {
        list.add("Apple");
        list.add("Banana");
        list.add("Orange");
        System.out.println("After adding elements: " + list);
    }

    // 2. Adding element at specific index
    public static void addAtIndex(List<String> list) {
        list.add(1, "Mango");
        System.out.println("After adding at index 1: " + list);
    }

    // 3. Adding multiple elements
    public static void addMultiple(List<String> list) {
        List<String> moreFruits = Arrays.asList("Grapes", "Pineapple");
        list.addAll(moreFruits);
        System.out.println("After adding multiple elements: " + list);
    }

    // 4. Accessing elements
    public static void accessElements(List<String> list) {
        System.out.println("Element at index 2: " + list.get(2));
    }

    // 5. Updating elements
    public static void updateElements(List<String> list) {
        list.set(0, "Strawberry");
        System.out.println("After updating: " + list);
    }

    // 6. Removing elements
    public static void removeElements(List<String> list) {
        list.remove("Banana");
        System.out.println("After removing Banana: " + list);
    }

    // 7. Searching elements
    public static void searchElements(List<String> list) {
        if (list.contains("Apple")) {
            System.out.println("Apple is found in the list");
        } else {
            System.out.println("Apple is NOT found");
        }
    }

    // 8. List size
    public static void listSize(List<String> list) {
        System.out.println("List size: " + list.size());
    }

    // 9. Iterating over list (for-each)
    public static void iterateList(List<String> list) {
        System.out.println("Iterating using for-each:");
        for (String fruit : list) {
            System.out.println(fruit);
        }
    }

    // 10. Using Iterator
    public static void useIterator(List<String> list) {
        System.out.println("Iterating using Iterator:");
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }

    // 11. Sorting
    public static void sortList(List<String> list) {
        Collections.sort(list);
        System.out.println("After sorting: " + list);
    }

    // 12. Sublist
    public static void subListExample(List<String> list) {
        List<String> sub = list.subList(0, Math.min(3, list.size()));
        System.out.println("Sublist (first 3 elements): " + sub);
    }

    // 13. Clearing the list
    public static void clearList(List<String> list) {
        list.clear();
        System.out.println("List after clearing: " + list);
    }

    public static void main(String[] args) {

        System.out.println("=== ArrayList Operations ===");
        List<String> arrayList = new ArrayList<>();
        performOperations(arrayList);

        System.out.println("\n=== LinkedList Operations ===");
        List<String> linkedList = new LinkedList<>();
        performOperations(linkedList);
    }

    // Function to perform all operations
    public static void performOperations(List<String> list) {
        addElements(list);
        addAtIndex(list);
        addMultiple(list);
        accessElements(list);
        updateElements(list);
        removeElements(list);
        searchElements(list);
        listSize(list);
        iterateList(list);
        useIterator(list);
        sortList(list);
        subListExample(list);
        clearList(list);
    }
}