package com.murach.model;

import java.io.Serializable;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private String dob;

    // Các trường mới theo form
    private String hearAbout;        // radio button
    private String[] announcements;  // checkbox
    private String contactBy;        // select option

    public User() {
        firstName = "";
        lastName = "";
        email = "";
        dob = "";
        hearAbout = "";
        announcements = null;
        contactBy = "";
    }

    public User(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    // Getter/Setter
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getHearAbout() { return hearAbout; }
    public void setHearAbout(String hearAbout) { this.hearAbout = hearAbout; }

    public String[] getAnnouncements() { return announcements; }
    public void setAnnouncements(String[] announcements) { this.announcements = announcements; }

    public String getContactBy() { return contactBy; }
    public void setContactBy(String contactBy) { this.contactBy = contactBy; }
}
