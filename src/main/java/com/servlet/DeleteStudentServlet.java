package com.servlet;
import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                Student s = new HostelDAO().getStudentByID(Integer.parseInt(idParam.trim()));
                if (s != null) request.setAttribute("student", s);
                else request.setAttribute("error", "No student found with ID: " + idParam);
            } catch (Exception e) { request.setAttribute("error", "Error: " + e.getMessage()); }
        }
        request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentID").trim());
            if (new HostelDAO().deleteStudent(id)) request.setAttribute("success", "Student ID " + id + " deleted successfully!");
            else request.setAttribute("error", "Delete failed.");
        } catch (Exception e) { request.setAttribute("error", "Error: " + e.getMessage()); }
        request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
    }
}
