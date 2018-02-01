package org.rjt.cus.restController;

import java.util.List;

import org.rjt.cus.model.Customer;
import org.rjt.cus.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("rest")
public class CustomerRestController {

	@Autowired
	CustomerService customerService;
	
	@GetMapping("getAllCustomers")
	public  ResponseEntity<List<Customer>> getAllCustomers() {

		List<Customer> listOfCustomers = customerService.getAllCustomers();
		
		return new ResponseEntity<List<Customer>>(listOfCustomers, HttpStatus.OK);
	}

	@RequestMapping(value = "/", method = RequestMethod.GET, headers = "Accept=application/json")
	public String goToHomePage() {
		return "redirect:/getAllCustomers";
	}
	

	@GetMapping("getCustomer/{id}")
	public ResponseEntity<Customer> getCustomerById(@PathVariable int id) {
		Customer customer = customerService.getCustomer(id);
		return new ResponseEntity<Customer>(customer, HttpStatus.OK);
	}

	@RequestMapping(value = "/addCustomer/", method = RequestMethod.POST, headers = "Accept=application/json")
	//@GetMapping("addCustomer")
	public ResponseEntity<Void> addCustomer(@RequestBody Customer customer,UriComponentsBuilder builder) {	
		 customerService.addCustomer(customer);
		/*else
		{	
			customerService.updateCustomer(customer);
		}*/

	//	return "redirect:/getAllCustomers";
		 HttpHeaders headers = new HttpHeaders();
         headers.setLocation(builder.path("/article/{id}").buildAndExpand(customer.getId()).toUri());
         return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/updateCustomer/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String updateCustomer(@PathVariable("id") int id,Model model) {
		model.addAttribute("customer", this.customerService.getCustomer(id));
		model.addAttribute("listOfCustomers", this.customerService.getAllCustomers());
		return "customerDetails";
	}

	@RequestMapping(value = "/deleteCustomer/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteCustomer(@PathVariable("id") int id) {
		customerService.deleteCustomer(id);
		return "redirect:/getAllCustomers";

	}	
}
