package us.mifeng.workflow.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/halo")
public class Halo {
	@GetMapping
	public HttpEntity<String> halo() {
		HttpHeaders header = new HttpHeaders();
		header.add(HttpStatus.ACCEPTED.name(), String.format("%s", HttpStatus.ACCEPTED.value()));
		HttpEntity<String> response = new HttpEntity<String>("Halo!",header);
		return response;
	}
}
