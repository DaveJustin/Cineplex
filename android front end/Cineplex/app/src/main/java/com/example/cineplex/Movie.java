package com.example.cineplex;

public class Movie {
    String title, content, date_release, country_release, img;
    int id, producer_id, genre_id;

    public Movie(String title, String content, String date_release, String country_release, String img, int id, int producer_id, int genre_id) {
        this.title = title;
        this.content = content;
        this.date_release = date_release;
        this.country_release = country_release;
        this.img = img;
        this.id = id;
        this.producer_id = producer_id;
        this.genre_id = genre_id;
    }

    public Movie(){

    }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }

    public void setContent(String content) { this.content = content; }

    public String getDate_release() { return date_release; }

    public void setDate_release(String date_release) { this.date_release = date_release; }

    public String getCountry_release() { return country_release; }

    public void setCountry_release(String country_release) { this.country_release = country_release; }

    public String getImg() { return img; }

    public void setImg(String img) { this.img = img; }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProducer_id() {
        return producer_id;
    }

    public void setProducer_id(int producer_id) {
        this.producer_id = producer_id;
    }

    public int getGenre_id() {
        return genre_id;
    }

    public void setGenre_id(int genre_id) {
        this.genre_id = genre_id;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date_release='" + date_release + '\'' +
                ", country_release='" + country_release + '\'' +
                ", img='" + img + '\'' +
                ", id=" + id +
                ", producer_id=" + producer_id +
                ", genre_id=" + genre_id +
                '}';
    }
}
