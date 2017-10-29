package br.com.maxigenios.services;

import br.com.maxigenios.domain.Cliente;
import br.com.maxigenios.repositories.ClienteRepository;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;


@Service
public class AuthService {

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
	private EmailService emailService;

    private Random rand = new Random();

	public void sendNewPassword(String email) {
        Cliente cliente = clienteRepository.findByEmail(email);
        if (cliente == null) {
            throw new ObjectNotFoundException("E-mail não encontrado");
        }

        String newPass = newPassword();

        cliente.setSenha(bCryptPasswordEncoder.encode(newPass));
        clienteRepository.save(cliente);

        emailService.sendNewPasswordEmail(cliente, newPass);
	}

    private String newPassword() {
	    char[] vet = new char[10];
        for (int i = 0; i < vet.length; i++) {
            vet[i] = randomChar();
        }
        return new String(vet);
    }

    private char randomChar() {
	    int opt = rand.nextInt(3); // 0 - digito, 1 - letra maiuscula ou 2 - letra minuscula.

	    if (opt == 0) { // gera um digito baseado na tabela ASCII
            // 48 à 57 - ASCII codes de dígitos.
            return (char) (rand.nextInt(10) + 48);
        } else if (opt == 1) { // gera letra maiuscula
            // 65 primeiro ASCII code de letra maiuscula.
            return (char) (rand.nextInt(26) + 65);
        } else { // gera letra maiuscula
            // 97 primeiro ASCII code de letra minuscula.
            return (char) (rand.nextInt(26) + 97);
        }
    }

}
