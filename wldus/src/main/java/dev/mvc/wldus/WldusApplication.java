package dev.mvc.wldus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"dev.mvc"})
public class WldusApplication {

	public static void main(String[] args) {
		SpringApplication.run(WldusApplication.class, args);
	}

}
