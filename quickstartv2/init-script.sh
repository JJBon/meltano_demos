#!/bin/bash

# Define the directory where the repo will reside
REPO_DIR="/meltano"

# Check if the directory exists
if [ -d "$REPO_DIR" ]; then
    # If it exists, update the repo
    cd "$REPO_DIR"
    git pull
else
    # If it doesn't exist, clone the repo
    git clone https://github.com/JJBon/meltano_demos.git "$REPO_DIR"
fi

# Navigate to the Meltano project directory and start Meltano
cd "$REPO_DIR"/quickstartv2/demo-project
# Add commands to start Meltano or other necessary services
meltano add loader target-s3-parquet
meltano add extractor tap-salesforce
meltano run tap-salesforce target-s3-parquet --full-refresh