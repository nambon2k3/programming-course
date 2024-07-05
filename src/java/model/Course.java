/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author Legion
 */
public class Course {
    private int courseID;
    private String courseName;
    private String description;
    private LocalDateTime createdDate;
    private String imageURL;

    public Course() {
    }

    public Course(int courseID, String courseName, String description, LocalDateTime createdDate) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.createdDate = createdDate;
    }

    public Course(int courseID, String courseName, String description, LocalDateTime createdDate, String imageURL) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.createdDate = createdDate;
        this.imageURL = imageURL;
    }
    
    

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    
    
    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
    
    
    
}
