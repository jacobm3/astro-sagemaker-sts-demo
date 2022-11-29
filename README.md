# Train a machine learning model with SageMaker and Airflow

This repo is the code accompanying Astronomer's [SageMaker and Airflow learn guide](https://docs.astronomer.io/learn/airflow-sagemaker).

Amazon SageMaker is a comprehensive AWS machine learning (ML) service that is frequently used by data scientists to develop and deploy ML models at scale. With Airflow, you can orchestrate every step of your SageMaker pipeline, integrate with services that clean your data, and store and publish your results using only Python code.

This tutorial demonstrates how to orchestrate a full ML pipeline including creating, training, and testing a new SageMaker model. This use case is relevant if you want to automate the model training, testing, and deployment components of your ML pipeline.

Terraform code is provided to build the required AWS resources and a helper script is available to automatically inject an Airflow connection and variables, if you have AWS credentials in your environment (AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID, AWS_SESSION_TOKEN).

# Requirements

1. AWS credentials and STS token with permissions to create an S3 storage bucket, an IAM role and policy for SageMaker.
2. The Astronomer CLI already installed.
3. Terraform already installed.

# Steps

1. Build resources with Terraform:

```
cd terraform-sagemaker-pipeline
terraform init
terraform plan
terraform apply
cd ..
```

2. Start the Astro dev environment:

```
cd astro-dev
astro dev start
cd ..
```

3. Inject the aws-sagemaker connection and required variables.

```
./add-vars-conn.sh
```