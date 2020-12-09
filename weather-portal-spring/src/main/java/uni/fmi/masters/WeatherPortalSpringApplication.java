package uni.fmi.masters;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories
@SpringBootApplication
public class WeatherPortalSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(WeatherPortalSpringApplication.class, args);
	}

}
