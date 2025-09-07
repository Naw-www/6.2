package com.murach.controller;

import com.murach.data.UserDB;
import com.murach.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/emailList")
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/index.jsp";

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "add";
        }

        String url = "/index.jsp";
        String message = "";

        if ("add".equals(action)) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String hearAbout = request.getParameter("hearAbout");
            String[] announcements = request.getParameterValues("announcements");
            String contactBy = request.getParameter("contactBy");

            User user = new User();
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setDob(dob);
            user.setHearAbout(hearAbout);
            user.setAnnouncements(announcements);
            user.setContactBy(contactBy);

            if (firstName == null || firstName.isEmpty()
                    || lastName == null || lastName.isEmpty()
                    || email == null || email.isEmpty()) {

                message = "⚠️ Vui lòng nhập đầy đủ thông tin.";
                url = "/index.jsp";
            } else {
                int result = UserDB.insert(user);
                if (result > 0) {
                    request.setAttribute("user", user);
                    url = "/thanks.jsp";
                } else {
                    message = "❌ Có lỗi xảy ra khi lưu dữ liệu.";
                    url = "/index.jsp";
                }
            }

            request.setAttribute("user", user);
            request.setAttribute("message", message);
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
