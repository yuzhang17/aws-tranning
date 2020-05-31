Basic

#### Answer the questions,

1. What is KMS , and KMS can handle which problems?

   AWS Key Management Service (AWS KMS) is a managed service that makes it easy for you to create and control customer master keys (CMKs), the encryption keys used to encrypt your data. 
   AWS KMS CMKs are protected by hardware security modules (HSMs) that are validated by the FIPS 140-2 Cryptographic Module Validation Program except in the China (Beijing) and China (Ningxia) Regions.

   

2. The approaches to use KMS.
   1. api
   2. cli
   3. sdk
   4. Web console

3. You can do which action by using KMS (you should know at least  5 or more) ?

   1. You can perform the following basic management actions on your AWS KMS customer master keys (CMKs):

      Create, and view symmetric and asymmetric CMKs, and edit their properties.

      Enable and disable CMKs

      Create and view access control policies and grants for your CMKs

      Enable and disable automatic rotation of the cryptographic material in a CMK

      Tag your CMKs for easier identification, categorizing, and tracking use and costs

      Create, delete, list, and update aliases, which are friendly names for your CMKs

      Delete CMKs to complete the key lifecycle

   2. You can also perform the following cryptographic operations with your CMKs. For examples, see Programming the AWS KMS API.
      - Encrypt, decrypt, and re-encrypt data with symmetric or asymmetric CMKs
      - Sign and verify messages with asymmetric CMKs
      - Generate exportable symmetric data keys and asymmetric data key pairs
      - Generate random numbers suitable for cryptographic applications
   3. You can also use the advanced features of AWS KMS
      1. Import cryptographic material into a CMK
      2. Create CMKs in your own custom key store backed by a AWS CloudHSM cluster.
      3. Connect directly to AWS KMS through a private endpoint in your VPC
      4. Use hybrid post-quantum TLS to provide forward-looking encryption in transit for the data that you send AWS KMS

#### Practice the tasks:

1. Use aws-cli to create a key.

   ```
   aws kms create-key
   ```

2. Use aws-cli to encrypt data with the key you just created.

3. Use aws-cli to decrypt data with the key you just created.

4. Use open source tool shush to do the above action. 


Nice to Have

Practice:  audit use of a key using AWS CloudTrail

Thinking & Presenting (Choose one)

1. You are the designer to use KMS in your current project, please do the scenario description or showcase (how, why etc.).
   1. 当配置文件中有敏感信息时，将配置信息存在aws parameter store并加密
   2. 给应用程序 对应加密key的权限
   3. 当应用程序启动时，自动读取数据到配置文件，同时启动应用程序。
   4. 如果是使用springboot的程序，可以使用第三方包方便集成。
2. Using KMS with another AWS service together, show it. For example
   1. Use a key to encrypt a file in an Amazon S3 bucket
   使用这个 zhangyu-aws-parameterstore-and-s3-key 加密zhangyu-test-kms-encrypt  bucket
    
   2. Use a key to secure parameter store value
       使用zhangyu-aws-parameterstore-and-s3-key 加密 zhangyu-parameter-store-test 
