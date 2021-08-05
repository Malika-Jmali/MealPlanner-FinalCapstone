package com.techelevator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;
import java.util.Arrays;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {

        SpringApplication.run(Application.class, args);

//        String words = "i,want,candy";
//
//        String[] strSplit = words.split(',');
        String str = "Geeks,for,geeks";

        // split string by no space
        String[] strSplit = str.split(",");

        // Now convert string into ArrayList
        ArrayList<String> strList = new ArrayList<String>(
                Arrays.asList(strSplit));

        // Now print the ArrayList
        for (String s : strList)
            System.out.println(s);
    }

}
