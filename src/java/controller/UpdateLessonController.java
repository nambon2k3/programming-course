/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import model.Lesson;

/**
 *
 * @author Legion
 */
@WebServlet(name = "UpdateLessonController", urlPatterns = {"/update-lesson"})
public class UpdateLessonController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateLessonController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateLessonController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        int courseID = Integer.parseInt(request.getParameter("courseID"));

        new LessonDAO().deleteLesson(lessonID);
        
        response.sendRedirect("course-detail?courseID=" + courseID);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        String lessonTitle = request.getParameter("lessonTitle");
        String content = request.getParameter("content");
        String videoLink = request.getParameter("videoLink");

        Lesson lesson = new Lesson();
        lesson.setLessonID(lessonID);
        lesson.setCourseID(courseID);
        lesson.setLessonTitle(lessonTitle);
        lesson.setContent(content);
        lesson.setVideoLink(videoLink);

        // Set the created date to current time or modify if needed
        lesson.setCreatedDate(LocalDateTime.now());

        new LessonDAO().updateLesson(lesson);
        // Redirect to view lessons page or course details page
        response.sendRedirect("course-detail?courseID=" + courseID);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
