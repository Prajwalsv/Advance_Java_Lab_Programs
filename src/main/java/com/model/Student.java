package com.model;

import java.sql.Date;



public class Student {

    private int studentID;

    private String studentName;

    private String roomNumber;

    private Date admissionDate;

    private double feesPaid;

    private double pendingFees;



    public Student() {}



    public int getStudentID() { return studentID; }

    public String getStudentName() { return studentName; }

    public String getRoomNumber() { return roomNumber; }

    public Date getAdmissionDate() { return admissionDate; }

    public double getFeesPaid() { return feesPaid; }

    public double getPendingFees() { return pendingFees; }



    public void setStudentID(int studentID) { this.studentID = studentID; }

    public void setStudentName(String studentName) { this.studentName = studentName; }

    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public void setAdmissionDate(Date admissionDate) { this.admissionDate = admissionDate; }

    public void setFeesPaid(double feesPaid) { this.feesPaid = feesPaid; }

    public void setPendingFees(double pendingFees) { this.pendingFees = pendingFees; }

}