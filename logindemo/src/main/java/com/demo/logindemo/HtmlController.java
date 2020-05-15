package com.demo.logindemo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
class HtmlController {

  @GetMapping("/")
  public String demologin(Model model) {
    model.addAttribute("title", "Welcome!");
    System.out.println("here");
    return "index";
  }

  @GetMapping("/greeting")
	public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
		model.addAttribute("name", name);
		return "greeting";
	}

}
