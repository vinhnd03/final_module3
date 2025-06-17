package com.vinhnd.final_module3.controller;

import com.vinhnd.final_module3.entity.Product;
import com.vinhnd.final_module3.service.IProductService;
import com.vinhnd.final_module3.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/product")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";
        if ("search".equals(action)) {
            String dateFrom = req.getParameter("from");
            String dateTo = req.getParameter("to");
            String top = req.getParameter("top");

            Date from = null;
            Date to = null;

            try {
                if (dateFrom != null) {
                    from = new SimpleDateFormat("yyyy-MM-dd").parse(dateFrom);
                }
                if (dateTo != null) {
                    to = new SimpleDateFormat("yyyy-MM-dd").parse(dateTo);
                }

            } catch (ParseException e) {
                e.printStackTrace();
            }

            List<Product> productList = productService.findAllSearch(from, to, Integer.parseInt(top));
            req.setAttribute("productList", productList);
            req.getRequestDispatcher("/view/list.jsp").forward(req, resp);

        }else if ("add".equals(action)){
            req.getRequestDispatcher("/view/form.jsp").forward(req,resp);
        }

        else {
            List<Product> productList = productService.findAllSearch(null, null, 100);
            req.setAttribute("productList", productList);
            req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String discount = req.getParameter("discount");
        String stock = req.getParameter("stock");

        Product product = new Product(name, Integer.parseInt(price), Float.parseFloat(discount), Integer.parseInt(stock));

        productService.add(product);
        resp.sendRedirect("/product");
    }
}
