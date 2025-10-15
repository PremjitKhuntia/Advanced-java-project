package com.example.model;
import java.util.Date;
public class Booking {
  private int bookingId;
  private int userId;
  private int showId;
  private String seatNo;
  private Date bookingDate;
  public int getBookingId() {
	return bookingId;
  }
  public void setBookingId(int bookingId) {
	this.bookingId = bookingId;
  }
  public int getUserId() {
	return userId;
  }
  public void setUserId(int userId) {
	this.userId = userId;
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
  public Date getBookingDate() {
	return bookingDate;
  }
  public void setBookingDate(Date bookingDate) {
	this.bookingDate = bookingDate;
  }
  public Booking() {
	super();
	// TODO Auto-generated constructor stub
  }
  public Booking(int bookingId, int userId, int showId, String seatNo, Date bookingDate) {
	super();
	this.bookingId = bookingId;
	this.userId = userId;
	this.showId = showId;
	this.seatNo = seatNo;
	this.bookingDate = bookingDate;
  }
  
  
  
  
}