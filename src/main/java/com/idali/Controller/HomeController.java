package com.idali.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jee.tweets_twetssenti_analyserCore.SentimentAnalyzer;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.auth.AccessToken;
import twitter4j.conf.ConfigurationBuilder;
import java.util.List; 
import twitter4j.Paging;
import twitter4j.ResponseList;
import jee.TweetsManager;
import jee.tweets_twetssenti_analyserCore.*; 
import jee.Result;
import jee.TweetWithSentiment;

import com.idali.Model.User_p; 

@Controller
public class HomeController {
	
 	
	
	
	  private  String consumerKey="lAeIKo6Blyz78rIBjda4lzTO0";
	  private  String consumerSecret ="5hl0HvDbKjDjZtYHZSgb4XvQT9zcStCS1yzY8RFLGWaYbuvaRJ";
	  private  String twitterToken ="1232357874929672193-3axfbzMdOY2Jumg5Re9nII46Dezjo8";
	  private  String twitterSecret ="kUNyGYev5eUKvIFAWQTlabfysyIHv6MzrTmAFHMHyisSA"; 
	
	
	
	
	@GetMapping("/")
	public String index() {
		return "index.html";
	}
	
	
	
	@RequestMapping("/search")
	public String search(@RequestParam("search") String search, Model model) throws TwitterException {
		System.out.println("search------>"+search);  
  
		  AccessToken accessToken = new AccessToken(twitterToken, twitterSecret);
 		  Twitter twitter1 = new TwitterFactory().getInstance(); 
		  twitter1.setOAuthConsumer(consumerKey, consumerSecret); 
		  twitter1.setOAuthAccessToken(accessToken); 
		  
		  
		  List<User> users = twitter1.searchUsers(search, 1);  
		  List<String> users_name =new ArrayList(); 
		  for(User usr:users) {  users_name.add(usr.getName()+""); } 
		  model.addAttribute("users",users); 
		  model.addAttribute("search",search); 
		return "result.jsp";
	}
	
	
	
	@RequestMapping("/getstatus")
	public String getstatus(@RequestParam("user_id") String id,@RequestParam("user_name") String user_name,
			@RequestParam("min_tweets") int min_tweets,
			@RequestParam("max_tweets") int max_tweets,Model model) { 
		System.out.println("search------>"+id); 
		
		       
		      
		 ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
	      configurationBuilder.setDebugEnabled(true)
	      .setOAuthConsumerKey(consumerKey)
	      .setOAuthConsumerSecret(consumerSecret)
	      .setOAuthAccessToken(twitterToken)
	      .setOAuthAccessTokenSecret(twitterSecret)
	      .setTweetModeExtended(true); 
	      TwitterFactory twitterFactory = new TwitterFactory(configurationBuilder.build());
	      twitter4j.Twitter twitter = twitterFactory.getInstance(); 
	  	  Paging page = new Paging(min_tweets, max_tweets);  
	  	  long user_id=Long. parseLong(id);
	  	  
	  	  
   
	  	  
		 //**********************************************************************************************  
	      
		 ArrayList<Status> status = new ArrayList<>();   
			try {  status.addAll(twitter.getUserTimeline(user_id, page));
			} catch (TwitterException e) { 	e.printStackTrace(); } 
	          
	          

	         model.addAttribute("user_name",user_name);
	 		 model.addAttribute("status",status); 
 	            
		 //********************************************************************************************** 
		
		return "profile.jsp";
	}
	

}
