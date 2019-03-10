package org.pyarts.fullyjavaspringsecurity.controller;

import org.pyarts.fullyjavaspringsecurity.model.Employee;
import org.pyarts.fullyjavaspringsecurity.repository.EmployeeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController
{
    private final EmployeeRepository employeeRepository;

    public HomeController(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }


    @GetMapping("/")
    public String home(Model model)
    {

        // get customers from the service
        List<Employee> employees = employeeRepository.findAll();

        // add the customers to the model
        model.addAttribute("employees", employees);

        return "home.jsp";
    }


    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {

        // create model attribute to bind form data
        Employee employee = new Employee();

        theModel.addAttribute("employee", employee);

        return "employee-form.jsp";
    }

    @PostMapping("/saveEmployee")
    public String saveCustomer(@ModelAttribute("employee") Employee employee) {

        // save the customer using our service
        employeeRepository.save(employee);

        return "redirect:/";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("empId") Long empId,
                                    Model theModel) {

        // get the customer from our service
        Employee employee = employeeRepository.findById(empId).orElse(new Employee());

        // set customer as a model attribute to pre-populate the form
        theModel.addAttribute("employee", employee);

        // send over to our form
        return "employee-form.jsp";
    }

    @GetMapping("/delete")
    public String deleteCustomer(@RequestParam("empId") Long empId) {

        // delete the customer
        employeeRepository.deleteById(empId);

        return "redirect:/";
    }
}