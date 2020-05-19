package com.ericzhang08.lambdaread;

import java.io.*;
import java.util.Map;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.S3Event;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.event.S3EventNotification;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.regions.Regions;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// Handler value: example.Handler
public class Handler implements RequestHandler<Object, String> {


    @Override
    public String handleRequest(Object map, Context context) {
//        logger.info("EVENT: " + gson.toJson(event));
//        System.out.println("EVENT: "+ gson.toJson(event));
//        String s3Key = event.get("S3Key");

        AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(Regions.AP_SOUTHEAST_1).build();
        S3Object object = s3Client.getObject("zhangyu-lambda-test", "regularly-readfile.txt");
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(object.getObjectContent()));
        bufferedReader.lines().forEach(System.out::println);
        return "ok";
    }


}

