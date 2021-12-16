package com.stadiumbooking.module;

import java.time.LocalDate;
import java.util.Date;

public class Match {

	private int match_id;
	private int sportsId;
	private String stadium_name;
	private String location;
	private LocalDate match_date; 
	private  String teamA;
	private  String teamB;
	private String teamAlogo;
	private String teamBlogo;
	private int totalseats;
	private int availableSeats;
	private int firstClass_Seats_price;
	private int secondClass_seats_price;
	
	
	
	public Match() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Match(int sportsId, String stadium_name, String location, LocalDate date1, String teamA, String teamB,
			String teamAlogo, String teamBlogo, int totalseats, int availableSeats, int firstClass_Seats_price,
			int secondClass_seats_price) {
		super();
		this.sportsId = sportsId;
		this.stadium_name = stadium_name;
		this.location = location;
		this.match_date = date1;
		this.teamA = teamA;
		this.teamB = teamB;
		this.teamAlogo = teamAlogo;
		this.teamBlogo = teamBlogo;
		this.totalseats = totalseats;
		this.availableSeats = availableSeats;
		this.firstClass_Seats_price = firstClass_Seats_price;
		this.secondClass_seats_price = secondClass_seats_price;
	}



	public int getSportsId() {
		return sportsId;
	}



	public void setSportsId(int sportsId) {
		this.sportsId = sportsId;
	}



	public String getStadium_name() {
		return stadium_name;
	}



	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public LocalDate getMatch_date() {
		return match_date;
	}



	public void setMatch_date(LocalDate match_date) {
		this.match_date = match_date;
	}



	public String getTeamA() {
		return teamA;
	}



	public void setTeamA(String teamA) {
		this.teamA = teamA;
	}



	public String getTeamB() {
		return teamB;
	}



	public void setTeamB(String teamB) {
		this.teamB = teamB;
	}



	public String getTeamAlogo() {
		return teamAlogo;
	}



	public void setTeamAlogo(String teamAlogo) {
		this.teamAlogo = teamAlogo;
	}



	public String getTeamBlogo() {
		return teamBlogo;
	}



	public void setTeamBlogo(String teamBlogo) {
		this.teamBlogo = teamBlogo;
	}



	public int getTotalseats() {
		return totalseats;
	}



	public void setTotalseats(int totalseats) {
		this.totalseats = totalseats;
	}



	public int getAvailableSeats() {
		return availableSeats;
	}



	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}



	public int getFirstClass_Seats_price() {
		return firstClass_Seats_price;
	}



	public void setFirstClass_Seats_price(int firstClass_Seats_price) {
		this.firstClass_Seats_price = firstClass_Seats_price;
	}



	public int getSecondClass_seats_price() {
		return secondClass_seats_price;
	}



	public void setSecondClass_seats_price(int secondClass_seats_price) {
		this.secondClass_seats_price = secondClass_seats_price;
	}
	
	
	
	
	
	
}
