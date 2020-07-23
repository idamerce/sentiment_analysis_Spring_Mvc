package com.idali.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data @NoArgsConstructor @AllArgsConstructor @ToString
public class Produit implements Serializable{

	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	private String designation;
	private double price;
	private int quantite;
	
	
}
