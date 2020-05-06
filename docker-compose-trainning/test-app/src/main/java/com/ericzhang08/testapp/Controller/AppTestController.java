package com.ericzhang08.testapp.Controller;


import lombok.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.hateoas.UriTemplate;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@RestController
@Component
public class AppTestController {

    @Data
    public static class Request {
        private String name;
        private String description;
    }

    @Data
    public static class Response {
        private ArrayList<Book> books;
    }

    @Data
    public static class Book {

        private Long id;

        private String name;

        private String description;
    }

    private final RestTemplate restTemplate;

    public AppTestController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @Value("${webapp.url}")
    String webAppUrl;

    @RequestMapping("/book")
    public Book hello() {
        System.out.println("prepare to start test");
        System.out.println(ControllerLinkBuilder.linkTo(AppTestController.class));
        Request request = new Request();
        request.setName("java");
        request.setDescription("java book");
        HttpEntity<Request> objectHttpEntity = new HttpEntity<>(request);
        Book book = restTemplate.postForObject(webAppUrl, objectHttpEntity, Book.class);

        return book;
    }
    @GetMapping("/books")
    @ResponseStatus(HttpStatus.OK)
    public Response getAllBooks() {
        Response forEntity = restTemplate.getForObject(webAppUrl , Response.class);
        return forEntity;
    }
}
