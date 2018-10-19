package us.mifeng.workflow.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	private RestTemplate client;
	
	@GetMapping
	public ResponseEntity<String> home() {
		Logger logger = LoggerFactory.getLogger(HomeController.class);
		logger.info("calling home controller");
		return client.exchange("http://localhost:10000/halo",HttpMethod.GET,new HttpEntity<String>("OJBK",new HttpHeaders()),String.class);
	}
}
