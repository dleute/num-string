package com.allofzero.numbers;

public class Main {

    public static void main(String[] args) {

        Logic logic = new Logic();

        if (args.length > 2 && args[1].equals("performance")) {

            Integer loop = Integer.parseInt(args[2]);

            // Provides the performance testing
            double start_time = System.nanoTime();

            for (int i = 0; i < loop; i++) {
                logic.processInput(args[0], false);
            }

            double end_time = System.nanoTime();
            double exec = (end_time - start_time)/1e9;
            double perf = (double)loop/exec;

            System.out.format("Per Second: %.1f Total: " + exec, perf);

        } else if (args.length > 0 ) {

            logic.processInput(args[0], true);

        } else {
            System.out.println("Please provide two quoted arguments like this: 'Race car' 'Elite Tile'\n");
        }
    }
}
