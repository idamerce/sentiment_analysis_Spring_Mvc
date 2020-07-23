package com.idali;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

 
import twitter4j.TwitterException;

@SpringBootApplication
public class SpringAngularFirstApplication {

	public static void main(String[] args) throws TwitterException {
		SpringApplication.run(SpringAngularFirstApplication.class, args);
		
		System.out.println("Successed");
		
 	}

}
