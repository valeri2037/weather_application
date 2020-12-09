package uni.fmi.masters.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import uni.fmi.masters.WebSecurityConfig;
import uni.fmi.masters.bean.UserBean;
import uni.fmi.masters.repo.UserRepo;

@RestController
public class LoginController {

	private UserRepo userRepo;
	private WebSecurityConfig webSecurityConfig;
	
	public LoginController(UserRepo userRepo, WebSecurityConfig webSecurityConfig) {
		this.userRepo = userRepo;
		this.webSecurityConfig = webSecurityConfig;
	}
	
	
	@PostMapping(path = "/register")
	public UserBean register(@RequestParam(value ="email")String email, 
			@RequestParam(value ="username")String username, @RequestParam(value ="password")String password,
			@RequestParam(value ="repeatPassword")String repeatPassword) {
		
		if(password.equals(repeatPassword)) {
			
			UserBean user = new UserBean(username, hashPassword(password), email);
			
			return userRepo.saveAndFlush(user);
			
		}else {
			return null;
		}
		
	}
	
	@PostMapping(path = "/login")
	public String login(
			@RequestParam(value = "username")
			String username, 
			@RequestParam(value = "password")
			String password, HttpSession session) {
		
		UserBean user = userRepo.findUserByUsernameAndPassword(username, hashPassword(password));
		
		if(user != null) {
			session.setAttribute("user", user);
			
			try {
				UserDetails userDetails = 
						webSecurityConfig.userDetailsServiceBean().
						loadUserByUsername(user.getUsername());
				
				if(userDetails != null) {
					Authentication auth = new UsernamePasswordAuthenticationToken(
							userDetails.getUsername(),
							userDetails.getPassword(),
							userDetails.getAuthorities());
					
					SecurityContextHolder.getContext().setAuthentication(auth);
					
					ServletRequestAttributes attr = (ServletRequestAttributes)
							RequestContextHolder.currentRequestAttributes();
					
					HttpSession http = attr.getRequest().getSession(true);
					http.setAttribute("SPRING_SECURITY_CONTEXT", 
							SecurityContextHolder.getContext());
				}
				
				return "home.html";
				
			} catch (UsernameNotFoundException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		return "error.html";	
				
	}
	
	
private String hashPassword(String password) {
		
		StringBuilder result = new StringBuilder();
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			
			md.update(password.getBytes());
			
			byte[] bytes = md.digest();
			
			for(int i = 0; i < bytes.length; i++) {
				result.append((char)bytes[i]);
			}			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}		
	
		return result.toString();
	}
}
