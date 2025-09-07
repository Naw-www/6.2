package com.murach.data;

import com.murach.model.User;
import java.io.*;
import java.util.*;

public class UserDB {
    
    // Phương thức để thêm user vào file (hoặc database)
    public static int insert(User user) {
        try {
            // Đường dẫn file (chỉnh lại cho phù hợp)
            String filePath = "D:/java/bai2/users.txt";
            
            File file = new File(filePath);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            
            FileWriter fw = new FileWriter(file, true);
            PrintWriter pw = new PrintWriter(fw);

            // Ghi đầy đủ thông tin user
            pw.println("Email: " + user.getEmail());
            pw.println("First Name: " + user.getFirstName());
            pw.println("Last Name: " + user.getLastName());
            pw.println("Date of Birth: " + user.getDob());
            pw.println("Heard About Us: " + user.getHearAbout());

            // Xử lý mảng announcements
            pw.print("Announcements: ");
            if (user.getAnnouncements() != null) {
                for (String ann : user.getAnnouncements()) {
                    pw.print(ann + " ");
                }
            } else {
                pw.print("None");
            }
            pw.println();

            pw.println("Preferred Contact: " + user.getContactBy());
            pw.println("-------------------------------");

            pw.close();
            fw.close();
            
            return 1; // Thành công
        } catch (IOException e) {
            e.printStackTrace();
            return 0; // Thất bại
        }
    }
    
    // Phương thức để kiểm tra email đã tồn tại chưa
    public static boolean emailExists(String email) {
        // Trong thực tế sẽ check database
        // Ở đây return false để đơn giản
        return false;
    }
    
    // Phương thức để lấy tất cả users (demo)
    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        // Nếu muốn, bạn có thể đọc từ file users.txt để build lại danh sách User
        return users;
    }
}
