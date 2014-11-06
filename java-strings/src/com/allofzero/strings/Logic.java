package com.allofzero.strings;

import com.sun.org.apache.xpath.internal.operations.Bool;

import java.util.Arrays;

/**
 * Created by dleute on 11/5/14.
 */
public class Logic {
    public void processInput(String string1, String string2, Boolean print) {
        String string1_formatted = this.formatString(string1);
        String string2_formatted = this.formatString(string2);

        String string1_reversed = new StringBuilder(string1_formatted).reverse().toString();
        String string2_reversed = new StringBuilder(string2_formatted).reverse().toString();

        char[] temp = string1_formatted.toCharArray();
        Arrays.sort(temp);
        String string1_sorted = String.valueOf(temp);

        temp = string2_formatted.toCharArray();
        Arrays.sort(temp);
        String string2_sorted = String.valueOf(temp);

        Boolean arePalindromes = false;
        Boolean onePalindrome = false;
        Boolean areAnagrams = false;
        Boolean string1Palindrome = false;
        Boolean string2Palindrome = false;

        if ( string1_formatted.equals(string1_reversed) ) {
            string1Palindrome = true;
        }

        if ( string2_formatted.equals(string2_reversed) ) {
            string2Palindrome = true;
        }

        if ( string1Palindrome && string2Palindrome ) {
            arePalindromes = true;
        }

        if ( (string1Palindrome || string2Palindrome) && !arePalindromes ) {
            onePalindrome = true;
        }

        if ( string1_sorted.equals( string2_sorted) ) {
            areAnagrams = true;
        }

        if (print) {

            if (arePalindromes) {
                System.out.println("1) true");
            } else {
                System.out.println("1) false");
            }

            if (onePalindrome) {
                System.out.println("2) true");
            } else {
                System.out.println("2) false");
            }

            if (areAnagrams) {
                System.out.println("3) true");
            } else {
                System.out.println("3) false");
            }

            if (arePalindromes && areAnagrams) {
                System.out.println("4) true");
            } else {
                System.out.println("4) false");
            }

            if ((!arePalindromes && !onePalindrome) && !areAnagrams) {
                System.out.println("5) true");
            } else {
                System.out.println("5) false");
            }
        }
    }

    public String formatString(String string) {
        return string.toLowerCase().replace(" ", "");
    }
}
