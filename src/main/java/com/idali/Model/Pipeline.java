package com.idali.Model;

 import java.util.List;
import java.util.Properties;

 public class Pipeline {
	
	 /*
	private static Properties properties;
	public static String propertiesName = "tokenize, ssplite, pos, lemma, ner, parse, sentiment";
	private static StanfordCoreNLP StanfordCoreNLP;
	
	
	private Pipeline() {
		
	}
	

	static {
		properties= new Properties();
		properties.setProperty("annotations", propertiesName); 
	}
	
	
	public static StanfordCoreNLP getPipeline() {
		if(StanfordCoreNLP==null) {
			StanfordCoreNLP = new StanfordCoreNLP(properties);
		}
		  return StanfordCoreNLP;
	}
	
	
	public static void main(String []args) {
		
		StanfordCoreNLP stanfordCoreNLP = Pipeline.getPipeline();
		
		String text="i m not happy";
		
		CoreDocument coreDocument = new CoreDocument(text);
		
		StanfordCoreNLP.annotate(coreDocument);
		
		List<CoreSentence> sentences = coreDocument.sentences();
		
		for(CoreSentence sentence : sentences) {
			String sentiment = sentence.sentiment();
			System.out.println(sentence+"----"+sentiment);
		}
		
		
		
		

	}
	*/
	
}
