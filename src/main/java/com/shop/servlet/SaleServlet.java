package com.shop.servlet;

import com.shop.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SaleServlet", urlPatterns = {"/sale"})
public class SaleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection connection = DBUtil.getConnection()) {
            if ("create".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("product_id"));
                int buyerId = Integer.parseInt(request.getParameter("buyer_id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String sql = "INSERT INTO sales (product_id, buyer_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setInt(1, productId);
                    statement.setInt(2, buyerId);
                    statement.setInt(3, quantity);
                    statement.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("sale");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Sale> sales = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT s.id, p.name AS product_name, b.name AS buyer_name, s.quantity FROM sales s JOIN products p ON s.product_id = p.id JOIN buyers b ON s.buyer_id = b.id";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Sale sale = new Sale();
                    sale.setId(resultSet.getInt("id"));
                    sale.setProductName(resultSet.getString("product_name"));
                    sale.setBuyerName(resultSet.getString("buyer_name"));
                    sale.setQuantity(resultSet.getInt("quantity"));
                    sales.add(sale);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("sales", sales);
        request.getRequestDispatcher("/WEB-INF/jsp/sales.jsp").forward(request, response);
    }

    public class Sale {
        private int id;
        private String productName;
        private String buyerName;
        private int quantity;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getProductName() {
            return productName;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }

        public String getBuyerName() {
            return buyerName;
        }

        public void setBuyerName(String buyerName) {
            this.buyerName = buyerName;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }
    }
}

