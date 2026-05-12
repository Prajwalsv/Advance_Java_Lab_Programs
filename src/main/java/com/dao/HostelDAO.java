package com.dao;

import com.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {

    // ADD STUDENT
    public boolean addStudent(Student s) throws SQLException {

        String sql =
                "INSERT INTO students " +
                "(student_name, room_number, admission_date, fees_paid, pending_fees) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setString(1, s.getStudentName());

            ps.setString(2, s.getRoomNumber());

            ps.setDate(3, s.getAdmissionDate());

            ps.setDouble(4, s.getFeesPaid());

            ps.setDouble(5, s.getPendingFees());

            return ps.executeUpdate() > 0;

        }

    }

    // GET ALL STUDENTS
    public List<Student> getAllStudents() throws SQLException {

        List<Student> list = new ArrayList<>();

        String sql =
                "SELECT * FROM students " +
                "ORDER BY student_id ASC";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                list.add(mapRow(rs));

            }

        }

        return list;

    }

    // GET STUDENT BY ID
    public Student getStudentByID(int id) throws SQLException {

        String sql =
                "SELECT * FROM students " +
                "WHERE student_id = ?";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return mapRow(rs);

                }

            }

        }

        return null;

    }

    // UPDATE STUDENT
    public boolean updateStudent(Student s) throws SQLException {

        String sql =
                "UPDATE students SET " +
                "student_name=?, " +
                "room_number=?, " +
                "admission_date=?, " +
                "fees_paid=?, " +
                "pending_fees=? " +
                "WHERE student_id=?";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setString(1, s.getStudentName());

            ps.setString(2, s.getRoomNumber());

            ps.setDate(3, s.getAdmissionDate());

            ps.setDouble(4, s.getFeesPaid());

            ps.setDouble(5, s.getPendingFees());

            ps.setInt(6, s.getStudentID());

            return ps.executeUpdate() > 0;

        }

    }

    // DELETE STUDENT
    public boolean deleteStudent(int id) throws SQLException {

        String sql =
                "DELETE FROM students " +
                "WHERE student_id=?";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        }

    }

    // GET STUDENTS WITH PENDING FEES
    public List<Student> getStudentsWithPendingFees() throws SQLException {

        List<Student> list = new ArrayList<>();

        String sql =
                "SELECT * FROM students " +
                "WHERE pending_fees > 0 " +
                "ORDER BY pending_fees DESC";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                list.add(mapRow(rs));

            }

        }

        return list;

    }

    // GET STUDENTS BY ROOM
    public List<Student> getStudentsByRoom(String room)
            throws SQLException {

        List<Student> list = new ArrayList<>();

        String sql =
                "SELECT * FROM students " +
                "WHERE room_number=? " +
                "ORDER BY student_name";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setString(1, room);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    list.add(mapRow(rs));

                }

            }

        }

        return list;

    }

    // GET STUDENTS BY DATE RANGE
    public List<Student> getStudentsByDateRange(
            Date from,
            Date to
    ) throws SQLException {

        List<Student> list = new ArrayList<>();

        String sql =
                "SELECT * FROM students " +
                "WHERE admission_date BETWEEN ? AND ? " +
                "ORDER BY admission_date";

        try (
                Connection con = DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setDate(1, from);

            ps.setDate(2, to);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    list.add(mapRow(rs));

                }

            }

        }

        return list;

    }

    // MAP DATABASE ROW TO STUDENT OBJECT
    private Student mapRow(ResultSet rs)
            throws SQLException {

        Student s = new Student();

        s.setStudentID(
                rs.getInt("student_id")
        );

        s.setStudentName(
                rs.getString("student_name")
        );

        s.setRoomNumber(
                rs.getString("room_number")
        );

        s.setAdmissionDate(
                rs.getDate("admission_date")
        );

        s.setFeesPaid(
                rs.getDouble("fees_paid")
        );

        s.setPendingFees(
                rs.getDouble("pending_fees")
        );

        return s;

    }

}