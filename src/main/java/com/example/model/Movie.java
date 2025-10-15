package com.example.model;
public class Movie {
  private int movieId;
  private String title;
  private String genre;
  private String duration;
  private double rating;
  public int getMovieId() {
	return movieId;
  }
  public void setMovieId(int movieId) {
	this.movieId = movieId;
  }
  public String getTitle() {
	return title;
  }
  public void setTitle(String title) {
	this.title = title;
  }
  public String getGenre() {
	return genre;
  }
  public void setGenre(String genre) {
	this.genre = genre;
  }
  public String getDuration() {
	return duration;
  }
  public void setDuration(String duration) {
	this.duration = duration;
  }
  public double getRating() {
	return rating;
  }
  public void setRating(double rating) {
	this.rating = rating;
  }
  public Movie(int movieId, String title, String genre, String duration, double rating) {
	super();
	this.movieId = movieId;
	this.title = title;
	this.genre = genre;
	this.duration = duration;
	this.rating = rating;
  }
  public Movie() {
	super();
	// TODO Auto-generated constructor stub
  }
  
}