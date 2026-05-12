package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddStudentServlet")

public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get Form Data
        String name = request.getParameter("studentName");
        String room = request.getParameter("roomNumber");
        String date = request.getParameter("admissionDate");
        String paid = request.getParameter("feesPaid");
        String pending = request.getParameter("pendingFees");

        // Null Safety
        name = (name != null) ? name.trim() : "";
        room = (room != null) ? room.trim() : "";
        date = (date != null) ? date.trim() : "";
        paid = (paid != null) ? paid.trim() : "";
        pending = (pending != null) ? pending.trim() : "";

        // Validation
        if (name.isEmpty() || room.isEmpty() || date.isEmpty()) {

            request.setAttribute("error",
                    "Please fill all required fields.");

            request.getRequestDispatcher("studentadd.jsp")
                   .forward(request, response);

            return;
        }

        try {

            // Create Student Object
            Student s = new Student();

            s.setStudentName(name);

            s.setRoomNumber(room);

            s.setAdmissionDate(Date.valueOf(date));

            // Fees Paid
            if (paid.isEmpty()) {

                s.setFeesPaid(0.0);

            } else {

                s.setFeesPaid(Double.parseDouble(paid));

            }

            // Pending Fees
            if (pending.isEmpty()) {

                s.setPendingFees(0.0);

            } else {

                s.setPendingFees(Double.parseDouble(pending));

            }

            // Save Student
            HostelDAO dao = new HostelDAO();

            boolean status = dao.addStudent(s);

            if (status) {

                request.setAttribute("success",
                        "Student added successfully!");

            } else {

                request.setAttribute("error",
                        "Failed to add student.");

            }

        } catch (NumberFormatException e) {

            request.setAttribute("error",
                    "Invalid number format.");

        } catch (IllegalArgumentException e) {

            request.setAttribute("error",
                    "Invalid admission date.");

        } catch (Exception e) {

            request.setAttribute("error",
                    "Error : " + e.getMessage());

        }

        request.getRequestDispatcher("studentadd.jsp")
               .forward(request, response);

    }

}