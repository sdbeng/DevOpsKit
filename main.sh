gcloud init
# If you get error after pasting this command, try typing it

#skip this if you have already created a project
export GCP_PROJECT_ID=doc-$(date +%Y%m%d%H%M%S)
echo $GCP_PROJECT_ID
export PROJECT_ID=GCP_PROJECT_ID

#skip this if you have already created a project
gcloud projects create $PROJECT_ID

gcloud projects list

gcloud iam service-accounts \
    create devops-catalog \
    --project $PROJECT_ID \
    --display-name devops-catalog

gcloud iam service-accounts list \
    --project $PROJECT_ID

gcloud iam service-accounts \
    keys create account.json \
    --iam-account devops-catalog@$PROJECT_ID.iam.gserviceaccount.com \
    --project $PROJECT_ID
# Save the values of account.json files in the environment 
# variables at the top of code playground in next lesson. 
# Doing this will help you to autologin to gcloud. 

gcloud iam service-accounts \
    keys list \
    --iam-account devops-catalog@$PROJECT_ID.iam.gserviceaccount.com \
    --project $PROJECT_ID

gcloud projects \
    add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:devops-catalog@$PROJECT_ID.iam.gserviceaccount.com \
    --role roles/owner

export TF_VAR_project_id=$PROJECT_ID
