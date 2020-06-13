#!/bin/bash

PAGE=1
if [ $1 ]; then
  PAGE=$1
fi

# ToDo: make a general solution
# weird mac date
SINCE=$(date -v-30d +'%F')

# ToDo: add a checker for the needed environment variables
USER_ID=$TOGGL_USER_ID
curl -u $TOGGL_TOKEN:api_token -X GET \
  "https://toggl.com/reports/api/v2/details?workspace_id=$TOGGL_WORKSPACE&user_agent=api_test&user_ids=$USER_ID&since=$SINCE&page=$PAGE"