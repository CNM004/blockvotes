package com.dxc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.dxc.dto.RecaptchaDTO;
import com.dxc.setting.ApplicationSetting;

@Service
public class RecaptchaService {
	@Autowired
	private ApplicationSetting appSetting;
	
	public RecaptchaDTO token(String token) {
		String url = "https://www.google.com/recaptcha/api/siteverify";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("secret", appSetting.getSecretKey());
		map.add("response", token);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		RecaptchaDTO response = restTemplate.postForObject( url, request, RecaptchaDTO.class );
		
		return response;
	}
}
