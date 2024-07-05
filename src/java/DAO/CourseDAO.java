/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import model.Lesson;

/**
 *
 * @author Legion
 */
public class CourseDAO extends DBContext {

    Connection connection;

    public CourseDAO() {
        try {
            connection = getConnection();
        } catch (Exception ex) {
            System.out.println("Connect failed");
        }
    }

    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT * FROM Courses";

        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseID(resultSet.getInt("CourseID"));
                course.setCourseName(resultSet.getString("CourseName"));
                course.setDescription(resultSet.getString("Description"));
                course.setCreatedDate(resultSet.getTimestamp("CreatedDate").toLocalDateTime());
                course.setImageURL(resultSet.getString("imageURL"));

                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("getAllCourses: " + e.getMessage());
        }

        return courses;
    }

    public void updateCourse(Course course) {
        String query = "UPDATE Courses SET CourseName = ?, Description = ?, imageURL = ? WHERE CourseID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, course.getCourseName());
            stmt.setString(2, course.getDescription());
            stmt.setString(3, course.getImageURL());
            stmt.setInt(4, course.getCourseID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateCourse: " + e.getMessage());
        }
    }

    public void addCourse(Course course) {
        String query = "INSERT INTO Courses (CourseName, Description, CreatedDate, imageURL) VALUES (?, ?, GETDATE(), ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, course.getCourseName());
            stmt.setString(2, course.getDescription());
            stmt.setString(3, course.getImageURL());

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addCourse: " + e.getMessage());
        }
    }
    
    public boolean deleteCourse(int courseID) {
        String query = "DELETE FROM Courses WHERE CourseID = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, courseID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting course: " + e.getMessage());
            return false;
        }
    }

}
