package com.sunil.SCM2.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
	
	@Autowired
	private SecurityCustomUserDetailsService customUserDetailsService;

	//can use for hardcoded user 
//	@Bean
//	public UserDetailsService userDetailsService() {
//		
//		UserDetails user = User
//				.withDefaultPasswordEncoder()
//				.username("sunil")
//				.password("sunil")
//				.roles("admin")
//				.build();
//		
//		UserDetails user2 = User
//				.withDefaultPasswordEncoder()
//				.username("anil")
//				.password("anil")
//				.roles("admin")
//				.build();
//		
//		return  new InMemoryUserDetailsManager(user, user2);
//	}
	
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(customUserDetailsService);
		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
		
		return daoAuthenticationProvider;
	}
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		
		httpSecurity.authorizeHttpRequests(authorised -> {
			authorised.requestMatchers("/user/**").authenticated();
			authorised.anyRequest().permitAll();
		});
		
		httpSecurity.formLogin(formLogin -> {
			formLogin.loginPage("/view/loginPage")
			.loginProcessingUrl("/do-authenticate")
			.successForwardUrl("/user/dashboard")
			.failureForwardUrl("/view/loginPage?error=true")
			.usernameParameter("email")
			.passwordParameter("password");
		});
		
		httpSecurity.csrf(AbstractHttpConfigurer::disable); //need to disable to unable logout functionality
		
		httpSecurity.logout(logout -> {
			logout.logoutUrl("/do-logout"); //default url /logout
			logout.logoutSuccessUrl("/view/loginPage");
		});
		
		return httpSecurity.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
