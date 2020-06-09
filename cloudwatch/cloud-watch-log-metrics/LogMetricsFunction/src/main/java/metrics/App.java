package metrics;


import com.amazonaws.services.cloudwatch.AmazonCloudWatch;
import com.amazonaws.services.cloudwatch.AmazonCloudWatchClientBuilder;
import com.amazonaws.services.cloudwatch.model.*;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;

/**
 * Handler for requests to Lambda function.
 */
public class App implements RequestHandler<Object, Object> {
    final AmazonCloudWatch cw = AmazonCloudWatchClientBuilder.defaultClient();
    int times = 0;

    public Object handleRequest(final Object input, final Context context) {
        LambdaLogger logger = context.getLogger();

        times = times + 1;

        System.out.printf("test1 %d\n", times%5);

        return times;
    }


}
