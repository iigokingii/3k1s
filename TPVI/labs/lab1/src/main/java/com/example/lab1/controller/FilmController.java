package com.example.lab1.controller;
import com.example.lab1.forms.FilmForm;
import com.example.lab1.model.Film;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class FilmController {
	private static List<Film> films = new ArrayList<Film>();
	private static int id = 0;
	
	static {
		films.add(new Film(id++,"Full Stack Development with JHipster", "Deepu K Sasidharan, Sendil Kumar N"));
		films.add(new Film(id++,"Pro Spring Security", "Carlo Scarioni, Massimo Nardone"));
	}
	
	//
	// Вводится (inject) из application.properties.
	@Value("${welcome.message}")
	private String message;
	
	@Value("${error.message}")
	private String errorMessage;
	
	@GetMapping(value = {"/", "/index"})
	public ModelAndView index(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		model.addAttribute("message", message);
		log.info("/index GET was called");
		return modelAndView;
	}
	@GetMapping(value = {"/allfilms"})
	public ModelAndView personList(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("filmlist");
		model.addAttribute("films", films);
		log.info("/allfilms GET was called");
		return modelAndView;
	}
	@GetMapping(value = {"/addfilm"})
	public  ModelAndView showAddPersonPage(Model model) {
		ModelAndView modelAndView = new ModelAndView("addfilm");
		FilmForm filmForm = new FilmForm();
		model.addAttribute("filmform", filmForm);
		log.info("/addfilm GET was called");
		
		return modelAndView;
	}
	//  @PostMapping("/addbook")
//GetMapping("/")
	@PostMapping(value = {"/addfilm"})
	public ModelAndView savePerson(Model model, //
								   @ModelAttribute("filmform") FilmForm filmForm) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("filmlist");
		String title = filmForm.getTitle();
		String author = filmForm.getAuthor();
		
		if (title != null && title.length() > 0 //
				&& author != null && author.length() > 0) {
			Film newFilm = new Film(id++,title, author);
			films.add(newFilm);
			model.addAttribute("films",films);
			return modelAndView;
		}
		model.addAttribute("errorMessage", errorMessage);
		modelAndView.setViewName("addfilm");
		log.info("/addfilm POST was called");
		
		return modelAndView;
	}
	@GetMapping(value = {"/delete"})
	public  ModelAndView showdeletePersonPage(Model model) {
		ModelAndView modelAndView = new ModelAndView("delete");
		FilmForm filmForm = new FilmForm();
		model.addAttribute("filmdeleteform", filmForm);
		log.info("/delete GET was called");
		
		return modelAndView;
	}
	@PostMapping(value = {"/delete"})
	public ModelAndView saveDeletePerson(Model model, //
								   @ModelAttribute("filmdeleteform") FilmForm filmdeleteform) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("filmlist");
		String title = filmdeleteform.getTitle();
		String author = filmdeleteform.getAuthor();
		
		if (title != null && title.length() > 0 //
				&& author != null && author.length() > 0) {
			int index = -1;
			for (Film film:films) {
				if(title.equals(film.getTitle()) && author.equals(film.getAuthor())){
					index = film.getId();
				}
			}
			if(index!=-1)
				films.remove(index);
			model.addAttribute("films",films);
			
			return modelAndView;
		}
		model.addAttribute("errorMessage", errorMessage);
		modelAndView.setViewName("delete");
		log.info("/delete POST was called");
		return modelAndView;
	}
	@RequestMapping(value = {"/update"}, method = RequestMethod.GET)
	public  ModelAndView showupdatePersonPage(Model model) {
		ModelAndView modelAndView = new ModelAndView("update");
		FilmForm filmForm = new FilmForm();
		model.addAttribute("filmupdateform", filmForm);
		log.info("/update GET was called");
		
		return modelAndView;
	}
	@RequestMapping(value = {"/update"}, method = RequestMethod.POST)
	public ModelAndView saveUpdatePerson(Model model, //
										 @ModelAttribute("filmupdateform") FilmForm filmupdateform) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("filmlist");
		String title = filmupdateform.getTitle();
		String author = filmupdateform.getAuthor();
		int ID = filmupdateform.getId();
		ID--;
		Film updatedFilm = new Film(ID,title,author);
		
		if (title != null && title.length() > 0 //
				&& author != null && author.length() > 0
					&& ID>=0 ) {
			films.remove(ID);
			films.add(ID,updatedFilm);
			model.addAttribute("films",films);
			return modelAndView;
		}
		model.addAttribute("errorMessage", errorMessage);
		modelAndView.setViewName("update");
		log.info("/update POST was called");
		return modelAndView;
	}
	
}
