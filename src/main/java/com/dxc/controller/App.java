package com.dxc.controller;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.dxc.service.MailService;
import com.dxc.service.MailServiceImpl;
import com.dxc.setting.AppConfig;

public class App
{

	public static void main(String[] args)
	{
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(
				AppConfig.class);

		MailService mailService = context.getBean("mailService", MailServiceImpl.class);

		String senderEmailId = "lehuunhan150698@gmail.com";
		String receiverEmailId = " ductrapt@gmail.com";
		String subject = "Leave Letter";
		String message = "I am not feeling well, I am taking sick leave";

		mailService.sendEmail(senderEmailId, receiverEmailId, subject, message);
		context.close();
	}

}
