package com.example.smmspace.controllers;

import com.example.smmspace.models.Post;
import com.example.smmspace.models.User;
import com.example.smmspace.services.Impl.PostServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class PostController {
    private final PostServiceImpl postServiceImpl;

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("posts", postServiceImpl.listProducts(title));
        model.addAttribute("user", postServiceImpl.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "posts";
    }

    @GetMapping("/post/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Post post = postServiceImpl.getProductById(id);
        model.addAttribute("user", postServiceImpl.getUserByPrincipal(principal));
        model.addAttribute("post", post);
        model.addAttribute("images", post.getImages());
        model.addAttribute("authorPost", post.getUser());
        return "posts-info";
    }

    @PostMapping("/post/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Post post, Principal principal) throws IOException {
        postServiceImpl.saveProduct(principal, post, file1, file2, file3);
        return "redirect:/my/posts";
    }

    @PostMapping("/post/delete/{id}")
    public String itemDelete(@PathVariable(value = "id") long id){
        postServiceImpl.deleteProduct(id);
        return "redirect:/";
    }

    @GetMapping("/my/posts")
    public String userProducts(Principal principal, Model model) {
        User user = postServiceImpl.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("posts", user.getProducts());
        return "my-posts";
    }

    @GetMapping("/create")
    public String userCreateProducts(Principal principal, Model model) {
        User user = postServiceImpl.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("posts", user.getProducts());
        return "create";
    }

    @GetMapping("/about")
    public String about(Model model,Principal principal) {
        User user = postServiceImpl.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "about";
    }
}
