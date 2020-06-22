package practice;



import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.SQSEvent;

/**
 * Handler for requests to Lambda function.
 */
public class App implements RequestHandler<SQSEvent, Object> {

    public String handleRequest(final SQSEvent input, final Context context) {
        System.out.println(input.toString());
        return input.toString();
    }


}
