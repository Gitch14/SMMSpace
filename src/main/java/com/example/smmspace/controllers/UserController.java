package com.example.smmspace.controllers;

import com.example.smmspace.models.User;
import com.example.smmspace.services.Impl.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserServiceImpl userServiceImpl;


    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userServiceImpl.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userServiceImpl.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }


    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userServiceImpl.getUserByPrincipal(principal));
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userServiceImpl.createUser(user)) {
            if (!userServiceImpl.createUser(user)) {
                model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
                return "registration";
            }

        }
        return "redirect:/activate";
    }
    /* Recover Pass*/
        @GetMapping("/recover")
        public String emailSendForgot(Principal principal,Model model) {
            model.addAttribute("user", userServiceImpl.getUserByPrincipal(principal));
            return "recover";
        }


        @PostMapping("/recover")
        public String resetPass(@RequestParam String email) {
            userServiceImpl.emailSendForgot(email);

            return "redirect:/new-password";
    }

    /* New Pass*/
    @GetMapping("/new-password")
    public String resetPass(Principal principal,Model model) {
        model.addAttribute("user", userServiceImpl.getUserByPrincipal(principal));
        return "new-password";
    }


    @PostMapping("/new-password")
    public String emailSend(@RequestParam String code,@RequestParam String pass1, @RequestParam String pass2) {
        userServiceImpl.resetPass(code,pass1,pass2);
        return "redirect:/login";
    }

    /* */

    @GetMapping("/activate")
    public String activateGet(Model model, Principal principal) {
        User user = userServiceImpl.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "activate";
    }

    @PostMapping("/activate")
    public String activate(@RequestParam String code) {
        userServiceImpl.activateUser(code);

        return "redirect:/login";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userServiceImpl.getUserByPrincipal(principal));
        model.addAttribute("posts", user.getProducts());
        return "user-info";
    }

    @GetMapping("/description/info")
    public String description(Principal principal, Model model) {
        model.addAttribute("user", userServiceImpl.getUserByPrincipal(principal));
        return "about-user";
    }


    @PostMapping("/description/info/{id}")
    public String descriptionPost(@PathVariable(value = "id") long id, @RequestParam String description) {
        userServiceImpl.createDescription(id,description);

        return "redirect:/profile";
    }
}
