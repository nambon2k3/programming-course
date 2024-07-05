/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Lesson;

/**
 *
 * @author Legion
 */
public class LessonDAO extends DBContext {

    private Connection connection;

    public LessonDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connection failed: " + e.getMessage());
        }
    }

    public List<Lesson> getLessonsByCourseID(int courseID) {
        List<Lesson> lessons = new ArrayList<>();
        String query = "SELECT LessonID, CourseID, LessonTitle, Content, CreatedDate, videoLink FROM Lessons WHERE CourseID = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, courseID);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Lesson lesson = new Lesson();
                    lesson.setLessonID(resultSet.getInt("LessonID"));
                    lesson.setCourseID(resultSet.getInt("CourseID"));
                    lesson.setLessonTitle(resultSet.getString("LessonTitle"));
                    lesson.setContent(resultSet.getString("Content"));
                    lesson.setCreatedDate(resultSet.getTimestamp("CreatedDate").toLocalDateTime());
                    lesson.setVideoLink(resultSet.getString("videoLink"));
                    lessons.add(lesson);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting lessons: " + e.getMessage());
        }

        return lessons;
    }

    public boolean updateLesson(Lesson lesson) {
        String query = "UPDATE Lessons SET LessonTitle = ?, Content = ?, VideoLink = ?, CreatedDate = ? WHERE LessonID = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, lesson.getLessonTitle());
            statement.setString(2, lesson.getContent());
            statement.setString(3, lesson.getVideoLink());
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(lesson.getCreatedDate()));
            statement.setInt(5, lesson.getLessonID());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error updating lesson: " + e.getMessage());
            return false;
        }
    }
    
    public boolean addLesson(Lesson lesson) {
        String query = "INSERT INTO Lessons (CourseID, LessonTitle, Content, CreatedDate, VideoLink) " +
                       "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, lesson.getCourseID());
            statement.setString(2, lesson.getLessonTitle());
            statement.setString(3, lesson.getContent());
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(lesson.getCreatedDate()));
            statement.setString(5, lesson.getVideoLink());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println("Error adding lesson: " + e.getMessage());
            return false;
        }
    }
    
    public boolean deleteLesson(int lessonID) {
        String query = "DELETE FROM Lessons WHERE LessonID = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, lessonID);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting lesson: " + e.getMessage());
            return false;
        }
    }

}
