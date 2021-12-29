FROM public.ecr.aws/lambda/python:3.8

# Copy function code and models into our directory
COPY ./ ${LAMBDA_TASK_ROOT}/

# Install our dependencies
RUN python3 -m pip install -r requirements.txt --target ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler
CMD ["handler.handler"]
