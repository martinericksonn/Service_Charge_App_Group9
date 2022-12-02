package service.charge.group9.alliance.ServiceChargeAppGroup9.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@Configuration
public class GlobalCorsConfig implements WebMvcConfigurer {

	@Override
	public void addCorsMappings(CorsRegistry registry) {
<<<<<<< Updated upstream
		registry.addMapping("/**").allowedMethods("*").allowedOrigins("http://localhost:4200").allowedHeaders("*")
=======
		registry.addMapping("/**").allowedMethods("*").allowedOrigins("http://localhost:58609").allowedHeaders("*")
>>>>>>> Stashed changes
				.allowCredentials(false).maxAge(-1);
	}
}
