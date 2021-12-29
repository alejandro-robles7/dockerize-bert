#!/bin/sh

# Install libraries
mkdir model & conda install -c conda-forge pytorch & conda install -c conda-forge transformers==3.4.0

# Get the model
python3 ../serverless-bert/get_model.py
