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
public class Handler implements RequestHandler<Map<String, String>, String> {
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    private static final Logger logger = LoggerFactory.getLogger(Handler.class);

    @Override
    public String handleRequest(Map<String, String> event, Context context) {
        logger.info("EVENT: " + gson.toJson(event));

        String s3bucket = event.get("S3bucket");
        String s3Key = event.get("S3Key");

        // Object key may have spaces or unicode non-ASCII characters.
        AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(Regions.AP_SOUTHEAST_1).build();
        S3Object object = s3Client.getObject(s3bucket, s3Key);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(object.getObjectContent()));
        bufferedReader.lines().forEach(System.out::println);
        return "ok";
    }
}

