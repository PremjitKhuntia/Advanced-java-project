package com.example.model;
public class Seat {
  private int seatId;
  private int showId;
  private String seatNo;
  private boolean isBooked;
  public int getSeatId() {
	return seatId;
  }
  public void setSeatId(int seatId) {
	this.seatId = seatId;
  }
  public int getShowId() {
	return showId;
  }
  public void setShowId(int showId) {
	this.showId = showId;
  }
  public String getSeatNo() {
	return seatNo;
  }
  public void setSeatNo(String seatNo) {
	this.seatNo = seatNo;
  }
  public boolean isBooked() {
	return isBooked;
  }
  public void setBooked(boolean isBooked) {
	this.isBooked = isBooked;
  }
  public Seat() {
	super();
	// TODO Auto-generated constructor stub
  }
  public Seat(int seatId, int showId, String seatNo, boolean isBooked) {
	super();
	this.seatId = seatId;
	this.showId = showId;
	this.seatNo = seatNo;
	this.isBooked = isBooked;
  }
  
  
  
}