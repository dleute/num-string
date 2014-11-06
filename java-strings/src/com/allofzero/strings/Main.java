package com.allofzero.strings;

public class Main {

    public static void main(String[] args) {

        Logic logic = new Logic();

        if (args.length > 3 && args[2].equals("performance") ) {

            Integer loop = Integer.parseInt(args[3]);

            // Provides the performance testing

            double start_time = System.nanoTime();

            for (int i = 0; i < loop; i++) {
                logic.processInput(args[0], args[1], false);
            }

            double end_time = System.nanoTime();
            double exec = (end_time - start_time)/1e9;
            double perf = (double)loop/exec;

            System.out.format("Per Second: %.1f Total: " + exec, perf);

        } else if (args.length > 1) {

            logic.processInput(args[0], args[1], true);

        } else {
            System.out.println("Please provide two quoted arguments like this: 'Race car' 'Elite Tile'");
        }
    }
}
