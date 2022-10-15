package com.example.repository;



import com.example.service.SingletonService;
import com.example.domain.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Optional;

public class JdbcUserRepository implements UserRepository {

    DataSource ds;
    SingletonService instance = SingletonService.getInstance(); //ds close() 용도

    public JdbcUserRepository(DataSource ds) {
        super();
        this.ds = ds;
    }

    @Override
    public void insert(User user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "insert into user_basic "
                    + "(id,pwd,name)"
                    + " values(?,?,?) ";
            conn = ds.getConnection();
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPwd());
            pstmt.setString(3, user.getName());
            pstmt.executeUpdate();

            sql = "insert into user_info "
                    + "(id,age,gender)"
                    + " values(?,?,?) ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getId());
            pstmt.setInt(2, user.getAge());
            pstmt.setInt(3, user.getGender());
            pstmt.executeUpdate();

            sql = "insert into user_res "
                    + "(id,email,phone)"
                    + " values(?,?,?) ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhone());
            pstmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            instance.rollback(conn);
            e.printStackTrace();
            System.out.println("회원가입에 실패했습니다");
            throw new RuntimeException(e);
        } finally {
            instance.close(pstmt);
            instance.close(conn);
        }
    }

    @Override
    public Optional<User> getById(String id) {
        String sql = "select basic.id,basic.pwd,basic.name,basic.regDate," +
                "res.email,res.phone,info.age,info.gender from " +
                "(user_basic as basic inner join user_info as info " +
                "on basic.id=info.id " +
                "inner join user_res as res " +
                "on info.id=res.id)" +
                "where basic.id = ? " +
                "order by basic.id";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;
        try {
            conn = instance.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            user = User.builder()
                    .id(rs.getString("id"))
                    .pwd(rs.getString("pwd"))
                    .name(rs.getString("name"))
                    .regDate(new Date(rs.getDate("regDate").getTime()))
                    .email(rs.getString("email"))
                    .phone(rs.getString("phone"))
                    .age(rs.getInt("age"))
                    .gender(rs.getInt("gender"))
                    .build();
            return Optional.ofNullable(user);
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
            System.out.println("회원정보 조회에 실패 했습니다");
            throw new RuntimeException(e);
        } finally {
            instance.close(rs);
            instance.close(pstmt);
            instance.close(conn);
        }
    }
}
