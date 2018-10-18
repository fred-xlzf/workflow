package com.miototech.workflow.demo.workflow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.swagger.annotations.Api;

@Controller
@RequestMapping("/")
@Api(tags = "通用跳转监听")
public class GatewayController {
	@GetMapping
	public String login() {
		return "index";
	}
	
	@GetMapping("/demo")
	public String demo() {
		return "redirect:/task/all";
	}
}
