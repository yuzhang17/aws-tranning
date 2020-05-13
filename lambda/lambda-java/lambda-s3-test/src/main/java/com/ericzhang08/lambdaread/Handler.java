package com.ericzhang08.lambdaread;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.S3Event;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.event.S3EventNotification.S3EventNotificationRecord;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.regions.Regions;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.lambda.AWSLambda;
import com.amazonaws.services.lambda.AWSLambdaClientBuilder;
import com.amazonaws.services.lambda.model.InvokeRequest;
import com.amazonaws.services.lambda.model.InvokeResult;
import com.amazonaws.services.lambda.model.ServiceException;

import java.nio.charset.StandardCharsets;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

// Handler value: example.Handler
public class Handler implements RequestHandler<S3Event, String>{
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    private static final Logger logger = LoggerFactory.getLogger(Handler.class);

    @Override
    public String handleRequest(S3Event s3event, Context context) {
        logger.info("EVENT: " + gson.toJson(s3event));
        S3EventNotificationRecord record = s3event.getRecords().get(0);

        String srcBucket = record.getS3().getBucket().getName();

        // Object key may have spaces or unicode non-ASCII characters.
        String srcKey = record.getS3().getObject().getUrlDecodedKey();
        AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(Regions.AP_SOUTHEAST_1).build();
        String dstBucket = "dst-" + srcBucket;
        String dstKey = "dst-" + srcKey;
        s3Client.copyObject(srcBucket, srcKey, dstBucket, dstKey);
        String funcName = "arn:aws:lambda:ap-southeast-1:494526681395:function:zhangyu-lambda-trigered-and-read-from-s3";
        InvokeRequest invokeRequest = new InvokeRequest().withFunctionName(funcName).withPayload("{\n" +
                " \"S3bucket \": \""+ srcBucket+"\",\n" +
                " \"S3Key\": \""+srcKey+"\"\n" +
                "}");
        InvokeResult invokeResult = null;
        try {
            AWSLambda awsLambda = AWSLambdaClientBuilder.standard().withRegion(Regions.AP_SOUTHEAST_1).build();
            invokeResult = awsLambda.invoke(invokeRequest);
            String ans = new String(invokeResult.getPayload().array(), StandardCharsets.UTF_8);
            System.out.println(ans);
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(invokeResult.getStatusCode());
        return "ok";
    }
}