

## BASIC

1. CloudWatch 是什么？我们为什么要使用CloudWatch？

   what:Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real time. You can use CloudWatch to collect and track metrics, which are variables you can measure for your resources and applications.

   why:You can create alarms which watch metrics and send notifications or automatically make changes to the resources you are monitoring when a threshold is breached. For example, you can monitor the CPU usage and disk reads and writes of your Amazon EC2 instances and then use this data to determine whether you should launch additional instances to handle increased load. You can also use this data to stop under-used instances to save money.With CloudWatch, you gain system-wide visibility into resource utilization, application performance, and operational health.
   how:Amazon CloudWatch is basically a metrics repository. An AWS service—such as Amazon EC2—puts metrics into the repository, and you retrieve statistics based on those metrics. If you put your own custom metrics into the repository, you can retrieve statistics on these metrics as well.

2. CloudWatch中的metrics是什么？包括哪些种类？我们可以如何使用metrics？
   what:Metrics are the fundamental concept in CloudWatch. A metric represents a time-ordered set of data points that are published to CloudWatch. Think of a metric as a variable to monitor, and the data points as representing the values of that variable over time. For example, the CPU usage of a particular EC2 instance is one metric provided by Amazon EC2. The data points themselves can come from any application or business activity from which you collect data.

   category:AWS services send metrics to CloudWatch, and you can send your own custom metrics to CloudWatch. You can add the data points in any order, and at any rate you choose.

3. CloudWatch Events是什么？可以应用在哪些场景？
   what:Amazon CloudWatch Events delivers a near real-time stream of system events that describe changes in Amazon Web Services (AWS) resources. Using simple rules that you can quickly set up, you can match events and route them to one or more target functions or streams. CloudWatch Events becomes aware of operational changes as they occur. CloudWatch Events responds to these operational changes and takes corrective action as necessary, by sending messages to respond to the environment, activating functions, making changes, and capturing state information.
   You can also use CloudWatch Events to schedule automated actions that self-trigger at certain times using cron or rate expressions.

4. 相关概念理解：
   metrics ：todo

   periods

   namespace

   count

   dimensions:
   A dimension is a name/value pair that is part of the identity of a metric. You can assign up to 10 dimensions to a metric.

   Every metric has specific characteristics that describe it, and you can think of dimensions as categories for those characteristics. Dimensions help you design a structure for your statistics plan. Because dimensions are part of the unique identifier for a metric, whenever you add a unique name/value pair to one of your metrics, you are creating a new variation of that metric.
   statistics

   ## 2. Practice


1. 创建cloudwatch event rules，每分钟自动触发Lambda（Lambda功能需要自己实现，向cloudwatch metrics里push自定义的metrics），设置alarm检测task中定义的metric，自定义并监控条件使alarm触发阈值，alarm出发SNS，SNS发告警到邮箱。

   1. 使用sam生成项目cloud-watch-create-metrics
   2. yaml模板文件位置：cloud-watch-create-metrics/template.yaml

   3. stack information

   ```
   version = 0.1
   [default]
   [default.deploy]
   [default.deploy.parameters]
   stack_name = "cloud-watch-create-metrics-zhangyu"
   s3_bucket = "aws-sam-cli-managed-default-samclisourcebucket-1a1b4wsic34ky"
   s3_prefix = "cloud-watch-create-metrics-zhangyu"
   region = "ap-southeast-1"
   confirm_changeset = true
   capabilities = "CAPABILITY_IAM"
   
   
   ```
     
2. 创建cloudwatch event rules，每分钟自动触发Lambda（输出固定格式的log message）。为lambda log创建metric filter，匹配log message，创建新的metric，自定义并监控条件使alarm触发阈值，alarm出发SNS，SNS发告警到邮箱。

   

   