package com.stadiumbooking.module;

import java.util.Objects;

public class Stadium_detalis {

	private int stadium_id;
	private String stadium_name;
	private String stadium_img;
	public Stadium_detalis() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Stadium_detalis(String stadium_name, String stadium_img) {
		super();
		this.stadium_name = stadium_name;
		this.stadium_img = stadium_img;
	}
	public int getStadium_id() {
		return stadium_id;
	}
	public void setStadium_id(int stadium_id) {
		this.stadium_id = stadium_id;
	}
	public String getStadium_name() {
		return stadium_name;
	}
	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}
	public String getStadium_img() {
		return stadium_img;
	}
	public void setStadium_img(String stadium_img) {
		this.stadium_img = stadium_img;
	}
	@Override
	public String toString() {
		return "Stadium_detalis [stadium_id=" + stadium_id + ", stadium_name=" + stadium_name + ", stadium_img="
				+ stadium_img + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(stadium_id, stadium_img, stadium_name);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Stadium_detalis other = (Stadium_detalis) obj;
		return stadium_id == other.stadium_id && Objects.equals(stadium_img, other.stadium_img)
				&& Objects.equals(stadium_name, other.stadium_name);
	}
	
	
	
}
