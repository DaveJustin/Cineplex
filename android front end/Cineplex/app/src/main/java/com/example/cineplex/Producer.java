package com.example.cineplex;

public class Producer {
    String fname,lname,age;
    int id;

    public Producer(String fname, String lname, String age, int id) {
        this.fname = fname;
        this.lname = lname;
        this.age = age;
        this.id = id;
    }

    public Producer(){

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Producer{" +
                "fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", age='" + age + '\'' +
                ", id=" + id +
                '}';
    }
}
