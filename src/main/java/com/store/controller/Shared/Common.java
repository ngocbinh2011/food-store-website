package com.store.controller.Shared;

import java.util.regex.Pattern;

public class Common {


    public static boolean isMatchesRegex(String input, String regex){
        if(input == null || regex == null){
            return false;
        }
        return Pattern.compile(regex).matcher(input).matches();
    }

    public static void main(String[] args) {
        System.out.println("yes");
    }

}
