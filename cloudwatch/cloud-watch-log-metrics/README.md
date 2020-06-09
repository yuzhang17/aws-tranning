# cloud-watch-create-metrics

## startup
```bash
sam build
sam deploy
```
## Cleanup

To delete the sample application that you created, use the AWS CLI. Assuming you used your project name for the stack name, you can run the following:

```bash
aws cloudformation delete-stack --stack-name cloud-watch-create-metrics-zhangyu
```