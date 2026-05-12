package com.servlet;
import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayStudentsServlet")
public class DisplayStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HostelDAO dao = new HostelDAO();
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.trim().isEmpty()) {
                Student s = dao.getStudentByID(Integer.parseInt(idParam.trim()));
                if (s != null) request.setAttribute("student", s);
                else request.setAttribute("error", "No student found with ID: " + idParam);
            } else {
                List<Student> list = dao.getAllStudents();
                request.setAttribute("students", list);
            }
        } catch (Exception e) { request.setAttribute("error", "Error: " + e.getMessage()); }
        request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
    }
}
