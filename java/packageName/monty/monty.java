package packageName.monty;

import java.util.Random;
import java.util.stream.IntStream;

record PrizeChoice(int prize, int choice) {}

public class monty {
    static final int N = 1_000_000;

    public static void main(String[] args) {    

        var rand = new Random();

        long winCount = IntStream.range(0, N)
                                .mapToObj(x -> new PrizeChoice(rand.nextInt(3), rand.nextInt(3)))
                                .filter(x -> x.choice() == x.prize())
                                .count();

        long winCount2 = IntStream.range(0, N)
                                .mapToObj(x -> new PrizeChoice(rand.nextInt(3), rand.nextInt(3)))
                                .map(x -> new PrizeChoice (
                                    x.prize(),
                                    x.prize() == x.choice() 
                                                ? new int[] { 0, 1, 2 } [rand.nextInt(3)] 
                                                : new int[] { x.choice(), x.prize() } [rand.nextInt(2)] 
                                ))
                                .filter(x -> x.choice() == x.prize())
                                .count();

        System.out.println("experiment #1 probability: " + winCount * 100 / N);
        System.out.println("experiment #2 probability: " + winCount2 * 100 / N);
    }
}
