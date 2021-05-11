package com.pakmall.service;

import com.pakmall.dto.EmailDTO;

public interface EmailService {

	public void sendMail(EmailDTO dto, String message);
}
