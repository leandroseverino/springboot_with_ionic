package br.com.maxigenios.services;

import org.springframework.mail.SimpleMailMessage;

import br.com.maxigenios.domain.Pedido;

public interface EmailService {

	void sendOrderConfirmationEmail(Pedido obj);
	
	void sendEmail(SimpleMailMessage msg);
}
