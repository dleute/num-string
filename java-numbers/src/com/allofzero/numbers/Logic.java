package com.allofzero.numbers;

import java.lang.reflect.Array;
import java.util.ArrayList;

/**
 * Created by dleute on 11/5/14.
 */
public class Logic {
    public void processInput(String string, Boolean print) {
        String[] strings = this.formatString(string).split(",");
        ArrayList<Integer> numbers = new ArrayList<Integer>();

        for (String s : strings) {
            numbers.add(Integer.parseInt(s));
        }

        ArrayList<ArrayList<Integer>> combinations = new ArrayList<ArrayList<Integer>>();

        for (Integer i = 0; i < numbers.size(); i++ ) {
            Integer n1 = numbers.get(i);
            for (Integer i2 = 0; i2 < numbers.size(); i2++ ) {
                if ( i != i2) {
                    Integer n2 = numbers.get(i2);
                    Integer add = n1 + n2;
                    if (add == 10) {
                        ArrayList<Integer> pair = new ArrayList<Integer>();
                        pair.add(n1);
                        pair.add(n2);
                        combinations.add(pair);
                    }
                }
            }
        }

        ArrayList<ArrayList<Integer>> same = new ArrayList<ArrayList<Integer>>();
        ArrayList<ArrayList<Integer>> exact = new ArrayList<ArrayList<Integer>>();

        for (ArrayList<Integer> p1 : combinations) {
            Boolean isExact = false;
            for (ArrayList p3 : exact) {
                if ( p1.equals(p3) ) {
                    isExact = true;
                    break;
                }
            }

            if (!isExact) {
                exact.add(p1);
            }

            Boolean isSame = false;
            for (ArrayList p4 : same) {
                if ( p1.get(0).equals(p4.get(0)) || p1.get(0).equals(p4.get(1)) ) {
                    isSame = true;
                    break;
                }
            }

            if (!isSame) {
                same.add(p1);
            }

        }



        if (print) {
            System.out.println("1) " + combinations);
            System.out.println("2) " + exact);
            System.out.println("3) " + same);
        }
    }

    public String formatString(String string) {
        return string.replace(" ", "");
    }

}
