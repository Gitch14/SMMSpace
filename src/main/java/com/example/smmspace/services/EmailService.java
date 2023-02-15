package com.example.smmspace.services;

public interface EmailService {
    public void sendSimpleMessage(String to,
                           String subject,
                           String text);
}