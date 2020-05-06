package com.ericzhang08.testapp.Controller;


import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.hateoas.UriTemplate;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@Component
public class AppTestController {

    @Data
    public static class Request {
        private String name;
        private int age;
        private String description;
    }

    @Data
    public static class Response {
        private String combineString;
    }

    private final RestTemplate restTemplate;

    public AppTestController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @Value("${webapp.url}")
    UriTemplate webAppUrl;

    @RequestMapping("/test")
    public Response hello() {
        System.out.println("prepare to start test");
        System.out.println(ControllerLinkBuilder.linkTo(AppTestController.class));
        Request request = new Request();
        request.setAge(5);
        request.setName("tony");
        HttpEntity<Request> objectHttpEntity = new HttpEntity<>(request);
        Response response = restTemplate.postForObject(webAppUrl.toString(), objectHttpEntity, Response.class);

        return response;
    }
}
