---
title: Sending recordings to an S3 bucket
---

<b> Note </b> : Wherever https://farm.pcibex.net occurs (eg. the bucket's CORS policy, the code of the lambda function), if the experiment is not run from the PCIbexfarm , then that link needs to be edited to match the origin of the server where the experiment is run.
    
To send a recording to an S3 bucket using AWS and PCIbex, <b> follow these steps exactly, and in order:</b>

1. Create S3 Bucket in the AWS Management Console

     Firstly, enter the name of your bucket as follows (in our example the name of the bucket is 4examplebucket123 - you need to remember the name of your bucket for later):
     
     ![alt text]({{site.baseurl}}/assets/images/amazon1.png)
     
     Remember to press block all public access. 

2. Press on your bucket, then go to permissions tab, scroll down to see CORS Configuration

    In the body of CORS configuration (code editor) enter the following:
    
    <b>Note:</b> Change the origin to match your origin!
    
    ```javascript
    [
    {
        "AllowedHeaders": [
            "*"
        ],
        "AllowedMethods": [
            "POST"
        ],
        "AllowedOrigins": [
            "https://farm.pcibex.net"
        ],
        "ExposeHeaders": [],
        "MaxAgeSeconds": 3000
    }
    ]
     ```
    
    Press save. 

3. Create Lambda function
  
   After you click create Lambda function, you should see a screen like this:

   ![alt text]({{site.baseurl}}/assets/images/amazon2.png)

   Now, scroll down to see code editor where you will enter this code:
   
   <b>Note</b> : Replace the name of the bucket with your name of the bucket!
   
```javascript
    /*global crypto*/
const crypto = require("crypto");
const CreateUUID = () =>
  ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, c =>
    (c ^ (crypto.randomBytes(1)[0] & (15 >> (c / 4)))).toString(16)
  );
const S3 = require("aws-sdk/clients/s3");

/**
 * Use AWS SDK to create pre-signed POST data.
 * We also put a file size limit (100B - 10MB).
 * @param key
 * @param contentType
 * @returns {Promise<object>}
 */
const createPresignedPost = ({ key, contentType }) => {
  const s3 = new S3();
  console.log("key",key,"contentType",contentType);
  const params = {
    Expires: 60,
    Bucket: "4examplebucket123",
    Fields: {
      "Content-Type": contentType,
      key
    }
  };
  return new Promise(async (resolve, reject) => {
    s3.createPresignedPost(params, (err, data) => {
      if (err) {
        reject(err);
        return;
      }
      resolve(data);
    });
  });
};
/**
 * We need to respond with adequate CORS headers.
 * @type {{"Access-Control-Allow-Origin": string, "Access-Control-Allow-Credentials": boolean}}
 */
const headers = {
  "Access-Control-Allow-Origin": "https://farm.pcibex.net",
  "Access-Control-Allow-Credentials": true,
  "Access-Control-Allow-Methods": "OPTIONS,GET",
  "Access-Control-Allow-Headers": "content-type"
};
module.exports.getPresignedPost = async (event,context) => {
  try {
    const { filename , mimetype } = event.queryStringParameters;
    const presignedPostData = await createPresignedPost({
      key: `${CreateUUID()}_${filename}`,
      contentType: mimetype
    });
    const r = presignedPostData.fields;
    r.url = presignedPostData.url;
    return {
      statusCode: 200,
      headers,
      body: JSON.stringify(r)
    };
  } catch (e) {
    return {
      statusCode: 500,
      headers,
      body: JSON.stringify({
        error: true,
        data: null,
        message: e.message
      })
    };
  }
};
```

   
4. Edit policies attached to your Lambda function

   Press on the configuration tab again. From the left toolbar click on Permissions tab. You will see clickable role name as follows:
   
   ![alt text]({{site.baseurl}}/assets/images/amazon4.png)

    Click on it.
    
    Now press "attach policies" button in the new tab that is opened. Then click "create policy". Press JSON tab after that and enter the following code in it:
    
    <b>Note:</b> Change the origin to match your origin!

    
    ```javascript
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::4examplebucket123/*"
        }
                  ]   
    }
    ```
    
    Press next until your policy is saved. 
    
    Now, again go back to your Lambda function.  Press on the configuration tab again. From the left toolbar click on Permissions tab. You will see clickable role name. Click on it. Press "attach policies" button in the new tab that is opened. Now search for the policy that you have just created and attach it.
    
5. Change the handler

   The handler should be set to index.getPresignedPost under Runtime settings.
   
   Runtime settings are located under your function code as shown below: 
   
   ![alt text]({{site.baseurl}}/assets/images/amazon3.png)
   
6. Deploying Lambda function

   Go back to your Lambda function. Press button deploy on your code editor to deploy your Lambda function. 

7. Add API trigger

   Press add API trigger above the code editor of your function. Create an HTTP API. Click add.
   
8. Test your function in PCIbex.

   First of all, press on your Lambda function. Click on API gateways, and then click on details of your API. Copy the endpoint URL. In our case it was:          
   https://v3admu6ep6.execute-api.us-east-2.amazonaws.com/default/getPresignedURL . The location is as seen below:
   
   ![alt text]({{site.baseurl}}/assets/images/amazon5.png)
   
   Now, enter your PCIbex code on the farm. 
   
   Write the following line in your code:
   
   ```javascript
   InitiateRecorder("https://v3admu6ep6.execute-api.us-east-2.amazonaws.com/default/getPresignedURL").label("init")
   ```
   You can as well copy the [Media Recorder template at PCIbex](https://farm.pcibex.net/experiments/yyPfNP/edit), and change the link when initiating recorder to 
   the code of your own API gateway).
   (Remember to replace the URL with one that points to your API)
   
   Enter your S3 bucket to see saved items after running the experiment.
   
   You are all done!
