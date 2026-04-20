package stringprograms;

public class PerformanceTests {
    public static void main(String[] args) {

        int n = 10000;

        // StringBuffer Test
        StringBuffer sbuffer = new StringBuffer();
        long startTime1 = System.currentTimeMillis();

        for (int i = 0; i < n; i++) {
            sbuffer.append("AIET");
        }

        long endTime1 = System.currentTimeMillis();
        System.out.println("Time taken by StringBuffer: " + (endTime1 - startTime1) + " ms");

        // StringBuilder Test
        StringBuilder sbuilder = new StringBuilder();
        long startTime2 = System.currentTimeMillis();

        for (int i = 0; i < n; i++) {
            sbuilder.append("AIET");
        }

        long endTime2 = System.currentTimeMillis();
        System.out.println("Time taken by StringBuilder: " + (endTime2 - startTime2) + " ms");
    }
}