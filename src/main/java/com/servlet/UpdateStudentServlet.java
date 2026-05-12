package com.servlet;
import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                Student s = new HostelDAO().getStudentByID(Integer.parseInt(idParam.trim()));
                if (s != null) request.setAttribute("student", s);
                else request.setAttribute("error", "No student found with ID: " + idParam);
            } catch (Exception e) { request.setAttribute("error", "Error: " + e.getMessage()); }
        }
        request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            Student s = new Student();
            s.setStudentID(Integer.parseInt(request.getParameter("studentID").trim()));
            s.setStudentName(request.getParameter("studentName").trim());
            s.setRoomNumber(request.getParameter("roomNumber").trim());
            s.setAdmissionDate(Date.valueOf(request.getParameter("admissionDate").trim()));
            s.setFeesPaid(Double.parseDouble(request.getParameter("feesPaid").trim()));
            s.setPendingFees(Double.parseDouble(request.getParameter("pendingFees").trim()));
            if (new HostelDAO().updateStudent(s)) request.setAttribute("success", "Student updated successfully!");
            else request.setAttribute("error", "Update failed.");
            request.setAttribute("student", s);
        } catch (Exception e) { request.setAttribute("error", "Error: " + e.getMessage()); }
        request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
    }
}
