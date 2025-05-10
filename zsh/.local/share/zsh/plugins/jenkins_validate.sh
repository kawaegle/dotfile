#!/bin/bash
# Re-runs job using local Jenkinsfile
# and displays the output console of the job.

# Add these to the project's .env file (but keep out of git)
# JENKINS_TOKEN - User's security token to use.
# JENKINS_USER  - Jenkins user name to use.  Add to .bashrc
# JENKINS_URL   - Base URL of the Jenkins server

# This script makes no permanent changes to the job

alias jenkins_validate="curl --user $JENKINS_USER:$JENKINS_TOKEN -X POST -F 'jenkinsfile=<Jenkinsfile' $JENKINS_URL/pipeline-model-converter/validate"

