package com.servlet;
import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("report_form.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        HostelDAO dao = new HostelDAO();
        try {
            List<Student> results = null;
            String reportTitle = "";
            switch (reportType) {
                case "pending":
                    results = dao.getStudentsWithPendingFees();
                    reportTitle = "Students with Pending Fees"; break;
                case "room":
                    String room = request.getParameter("roomNumber");
                    if (room == null || room.trim().isEmpty()) {
                        request.setAttribute("error", "Please enter a room number.");
                        request.getRequestDispatcher("report_form.jsp").forward(request, response); return;
                    }
                    results = dao.getStudentsByRoom(room.trim());
                    reportTitle = "Students in Room: " + room.trim(); break;
                case "daterange":
                    String from = request.getParameter("fromDate");
                    String to = request.getParameter("toDate");
                    if (from == null || to == null || from.isEmpty() || to.isEmpty()) {
                        request.setAttribute("error", "Please enter both dates.");
                        request.getRequestDispatcher("report_form.jsp").forward(request, response); return;
                    }
                    results = dao.getStudentsByDateRange(Date.valueOf(from), Date.valueOf(to));
                    reportTitle = "Students Admitted: " + from + " to " + to; break;
                default:
                    request.setAttribute("error", "Invalid report type.");
                    request.getRequestDispatcher("report_form.jsp").forward(request, response); return;
            }
            request.setAttribute("results", results);
            request.setAttribute("reportTitle", reportTitle);
            request.setAttribute("reportType", reportType);
        } catch (Exception e) { request.setAttribute("error", "Error: " + e.getMessage()); }
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}
