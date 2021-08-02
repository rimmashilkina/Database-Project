package com.unt.csce5350.rms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unt.csce5350.rms.dao.CustomerDAO;
import com.unt.csce5350.rms.model.Customer;


@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDAO customerDAO;

    public void init() {
        customerDAO = new CustomerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	System.out.println("Inside do get");
        String action = request.getServletPath();
        System.out.println("getQueryString: "+request.getQueryString());
        System.out.println("request.getParameter: "+request.getParameter("action"));
    	System.out.println("action: "+action);
    	
    	action = request.getParameter("action");

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertCustomer(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateCustomer(request, response);
                    break;
                default:
                    listCustomer(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < Customer > listCustomer = customerDAO.selectAllCustomers();
        request.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/customer-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/customer-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer existingCustomer = customerDAO.selectCustomer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/customer-form.jsp");
        request.setAttribute("customer", existingCustomer);
        dispatcher.forward(request, response);

    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
		/*String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		Customer newCustomer = new Customer(name, email, country);*/
    	
    	String customerFirstName = request.getParameter("customerFirstName");
    	String customerLastName = request.getParameter("customerLastName");
    	String customerStreet1 = request.getParameter("customerStreet1");
    	String customerStreet2 = request.getParameter("customerStreet2");
    	String customerCity = request.getParameter("customerCity");
    	String customerState = request.getParameter("customerState");
    	String customerZip = request.getParameter("customerZip");
    	String customerPhone = request.getParameter("customerPhone");
    	String customerEmail = request.getParameter("customerEmail");
    	int customerOrders = Integer.parseInt(request.getParameter("customerOrders"));
    	int customerCurrentDiscount = Integer.parseInt(request.getParameter("customerCurrentDiscount"));
    	

        Customer newCustomer =  new Customer(customerCity, customerCurrentDiscount, customerEmail,
    			customerFirstName, customerLastName, customerOrders, customerPhone,
    			customerState, customerStreet1, customerStreet2, customerZip);
        
        customerDAO.insertCustomer(newCustomer);
        response.sendRedirect("customers?action=list");
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
		/*int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");*/
    	
    	int customerID = Integer.parseInt(request.getParameter("customerID"));
    	String customerFirstName = request.getParameter("customerFirstName");
    	String customerLastName = request.getParameter("customerLastName");
    	String customerStreet1 = request.getParameter("customerStreet1");
    	String customerStreet2 = request.getParameter("customerStreet2");
    	String customerCity = request.getParameter("customerCity");
    	String customerState = request.getParameter("customerState");
    	String customerZip = request.getParameter("customerZip");
    	String customerPhone = request.getParameter("customerPhone");
    	String customerEmail = request.getParameter("customerEmail");
    	int customerOrders = Integer.parseInt(request.getParameter("customerOrders"));
    	int customerCurrentDiscount = Integer.parseInt(request.getParameter("customerCurrentDiscount"));
    	

        Customer customer =  new Customer(customerID, customerCity, customerCurrentDiscount, customerEmail,
    			customerFirstName, customerLastName, customerOrders, customerPhone,
    			customerState, customerStreet1, customerStreet2, customerZip);
        
        customerDAO.updateCustomer(customer);
        response.sendRedirect("customers?action=list");
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerDAO.deleteCustomer(id);
        response.sendRedirect("customers?action=list");

    }
}