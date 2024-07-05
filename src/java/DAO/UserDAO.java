/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author Legion
 */
public class UserDAO extends DBContext {

    private Connection connection;

    public UserDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connection failed: " + e.getMessage());
        }
    }

    public User getUserByEmailAndPassword(String email, String passwordHash) {
        User user = null;
        String query = "SELECT * FROM Users WHERE email = ? AND passwordHash = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, passwordHash);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setUserID(resultSet.getInt("userID"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPasswordHash(resultSet.getString("passwordHash"));
                    user.setEmail(resultSet.getString("email"));
                    user.setRole(resultSet.getString("role"));
                    user.setRegistrationDate(resultSet.getTimestamp("registrationDate").toLocalDateTime());
                }
            }
        } catch (SQLException e) {
            System.out.println("getUserByEmailAndPassword: " + e.getMessage());
        }
        return user;
    }

    public void saveUser(User user) {
        String query = "INSERT INTO Users (username, passwordHash, email, registrationDate, role) VALUES (?, ?, ?, GETDATE(), 'USER')";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPasswordHash());
            statement.setString(3, user.getEmail());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("saveUser: " + e.getMessage());
        }
    }

    public boolean updateUser(User user) {
        String query = "UPDATE Users SET username=?, passwordHash=?, email=? WHERE userID=?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPasswordHash()); // Assuming passwordHash is already hashed
            statement.setString(3, user.getEmail());
            statement.setInt(4, user.getUserID());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Error updating user: " + e.getMessage());
            return false;
        }
    }

    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    User user = new User();
                    user.setUserID(resultSet.getInt("userID"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPasswordHash(resultSet.getString("passwordHash"));
                    user.setEmail(resultSet.getString("email"));
                    user.setRole(resultSet.getString("role"));
                    user.setRegistrationDate(resultSet.getTimestamp("registrationDate").toLocalDateTime());
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println("getUsers: " + e.getMessage());
        }
        return users;
    }
    
    

}
