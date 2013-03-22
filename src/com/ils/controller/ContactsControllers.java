package com.ils.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ils.dao.ContactsDAO;
import com.ils.entity.Contact;
import com.ils.validator.ContactFormValidator;


/**
 * @author Danang	
 *
 */

@Controller
public class ContactsControllers
{
	@Autowired
	private ContactsDAO contactsDAO;
	
	@Autowired
	private ContactFormValidator validator;
	
	@RequestMapping("/home")
	public String home()
	{
		return "home";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
		
	@RequestMapping("/searchContacts")
	public ModelAndView searchContacts(@RequestParam(required= false, defaultValue="") String name)
	{
		ModelAndView mav = new ModelAndView("contact/showContacts");
		List<Contact> contacts = contactsDAO.searchContacts(name.trim());
		mav.addObject("SEARCH_CONTACTS_RESULTS_KEY", contacts);
		return mav;
	}
	
	@RequestMapping("/viewAllContacts")
	public ModelAndView getAllContacts()
	{
		ModelAndView mav = new ModelAndView("/contact/showContacts");
		List<Contact> contacts = contactsDAO.getAllContacts();
		mav.addObject("SEARCH_CONTACTS_RESULTS_KEY", contacts);
		return mav;
	}
	
	@RequestMapping(value="/saveContact", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("contact/newContact");
		Contact contact = new Contact();
		mav.getModelMap().put("contact/newContact", contact);
		return mav;
	}
	
	@RequestMapping(value="/saveContact", method=RequestMethod.POST)
	public String create(@ModelAttribute("contact/newContact")Contact contact, BindingResult result, SessionStatus status)
	{
		validator.validate(contact, result);
		if (result.hasErrors()) 
		{				
			return "contact/newContact";
		}
		contactsDAO.save(contact);
		status.setComplete();
		return "redirect:viewAllContacts.do";
	}
	
	@RequestMapping(value="/updateContact", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("contact/editContact");
		Contact contact = contactsDAO.getById(id);
		mav.addObject("contact/editContact", contact);
		return mav;
	}
	
	@RequestMapping(value="/updateContact", method=RequestMethod.POST)
	public String update(@ModelAttribute("contact/editContact") Contact contact, BindingResult result, SessionStatus status){
		validator.validate(contact, result);
		if (result.hasErrors()) {
			return "contact/editContact";
		}
		contactsDAO.update(contact);
		status.setComplete();
		  return "redirect:viewAllContacts.do";
	}
	
	
	@RequestMapping("deleteContact")
	public ModelAndView delete(@RequestParam("id")Integer id)	{
		ModelAndView mav = new ModelAndView("redirect:viewAllContacts.do");
		contactsDAO.delete(id);
		return mav;
	}
	
}
