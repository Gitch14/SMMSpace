package com.example.smmspace.services.Impl;


import com.example.smmspace.models.User;
import com.example.smmspace.models.enums.Role;
import com.example.smmspace.repositories.UserRepository;
import com.example.smmspace.services.Impl.EmailServiceImpl;
import com.example.smmspace.services.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    private final EmailServiceImpl mailSenderService;

    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(false);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        user.setActivationCode(UUID.randomUUID().toString());
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);

            String message =String.format(
                    "Hello, %s \n" + "Welcome to SMMSpace!,Your code \n %s",
                    user.getUsername(),user.getActivationCode()
            );
            mailSenderService.sendSimpleMessage(user.getEmail(), "Activation code",message);


        return true;
    }


    public boolean recover(User user,String codeCheck,String email,String passwordRepeat) {
         email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        String code = UUID.randomUUID().toString();

        String message =String.format(
                "Hello, %s \n" + "Welcome to SMMSpace!,Your code \n %s",
                user.getUsername(),code
        );
        mailSenderService.sendSimpleMessage(user.getEmail(), "Code",message);

        boolean verify = false;

        if (codeCheck.equals(code)){
            verify = true;
        }
        user.setPassword(passwordRepeat);
        userRepository.save(user);


        return verify;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);
        if (user == null) {
            return false;
        }

        user.setActive(true);

        userRepository.save(user);
        return true;
    }

    public void createDescription(long id,String description) {
        User user = userRepository.findById(id).orElseThrow();
        if (user == null) {
            return;
        }
        user.setDescription(description);
        userRepository.save(user);
    }

    @Override
    public void emailSendForgot(String email) {
        User user = userRepository.findByEmail(email);
        if (user == null){
            return;
        }
        String newCode = UUID.randomUUID().toString();
        String message =String.format(
                "Hello, %s \n" + "Your code for reset password\n %s",
                user.getUsername(),newCode
        );
        user.setForgotCode(newCode);
        userRepository.save(user);
        mailSenderService.sendSimpleMessage(user.getEmail(), "Code",message);
    }

    @Override
    public void resetPass(String code, String pass1, String pass2) {
        User user = userRepository.findByForgotCode(code);
        if (user == null){
            return;
        }
        if (!Objects.equals(pass1, pass2)){
            return;
        }

        user.setPassword(passwordEncoder.encode(pass1));
        userRepository.save(user);
    }
}
