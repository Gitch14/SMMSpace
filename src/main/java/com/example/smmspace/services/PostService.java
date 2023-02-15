package com.example.smmspace.services;

import com.example.smmspace.models.Image;
import com.example.smmspace.models.Post;
import com.example.smmspace.models.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

public interface PostService {
    public List<Post> listProducts(String title);
    public void saveProduct(Principal principal, Post post, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException;
    public User getUserByPrincipal(Principal principal);
    public Image toImageEntity(MultipartFile file) throws IOException;
    public void deleteProduct(Long id);
    public Post getProductById(Long id);
    }
