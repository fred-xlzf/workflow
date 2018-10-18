package com.miototech.workflow.demo.workflow.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
	@Bean
	public Docket docket() {
		Docket docket = new Docket(DocumentationType.SWAGGER_2);
		docket.apiInfo(new ApiInfoBuilder().description("Workflow - Demo")
				.contact(new Contact("Fred Xieli", "https://www.miototech.com", "zf@mifeng.us")).build());
		docket.select().paths(PathSelectors.any()).build();
		return docket;
	}
}