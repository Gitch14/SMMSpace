package com.example.smmspace.services;

import com.example.smmspace.models.User;

import java.security.Principal;
import java.util.List;
import java.util.Map;

public interface UserService {
    public boolean createUser(User user);
    public List<User> list();
    public void changeUserRoles(User user, Map<String, String> form);
    public User getUserByPrincipal(Principal principal);
    public boolean activateUser(String code);
    public void createDescription(long id,String description);
    public void emailSendForgot(String email);
    public void resetPass(String code,String pass1,String pass2);
}
