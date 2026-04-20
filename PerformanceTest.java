package stringprograms;

public class PerformanceTest {
    public static void main(String[] args) {

        int n = 10000;

        // 1. StringBuffer Performance
        StringBuffer sbuffer = new StringBuffer();
        long startTime1 = System.nanoTime();

        for (int i = 0; i < n; i++) {
            sbuffer.append("AIET");
        }

        long endTime1 = System.nanoTime();
        long durationBuffer = endTime1 - startTime1;

        // 2. StringBuilder Performance
        StringBuilder sbuilder = new StringBuilder();
        long startTime2 = System.nanoTime();

        for (int i = 0; i < n; i++) {
            sbuilder.append("AIET");
        }

        long endTime2 = System.nanoTime();
        long durationBuilder = endTime2 - startTime2;

        // Display results
        System.out.println("StringBuffer Time: " + durationBuffer + " ns");
        System.out.println("StringBuilder Time: " + durationBuilder + " ns");

        // Comparison
        if (durationBuffer > durationBuilder) {
            System.out.println("StringBuilder is faster than StringBuffer.");
        } else {
            System.out.println("StringBuffer is faster than StringBuilder.");
        }
    }
}