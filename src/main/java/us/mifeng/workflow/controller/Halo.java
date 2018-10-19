package us.mifeng.workflow.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/halo")
public class Halo {
	private static final Logger logger = LoggerFactory.getLogger(Halo.class);
	
	@GetMapping
	public ResponseEntity<String> halo() {
		logger.info("called halo controller");
		ResponseEntity<String> response = new ResponseEntity<String>("Halo",HttpStatus.ACCEPTED);
		return response;
	}
}
