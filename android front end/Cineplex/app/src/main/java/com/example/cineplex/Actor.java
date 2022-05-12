package com.example.cineplex;

public class Actor {
    String fname,lname,age,gender,image;
    int id;

    public Actor(String fname, String lname, String age, String gender, String image, int id) {
        this.fname = fname;
        this.lname = lname;
        this.age = age;
        this.gender = gender;
        this.image = image;
        this.id = id;
    }

    public Actor(){

    }


    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Actor{" +
                "fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", age='" + age + '\'' +
                ", gender='" + gender + '\'' +
                ", image='" + image + '\'' +
                ", id=" + id +
                '}';
    }
}
