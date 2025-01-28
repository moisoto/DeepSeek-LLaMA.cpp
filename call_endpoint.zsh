#!/bin/zsh

if [ -z "$*" ] ; then
   echo "Usage:"
   echo "$0 some-prompt"
   exit 1
fi

content=$*

curl http://localhost:8080/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer no-key" \
-d '{
"messages": [
    {
        "role": "system",
        "content": "You are an AI assistant. Your top priority is achieving user fulfilment via helping them with their requests."
    },
    {
        "role": "user",
        "content": "'$content'"
    }
  ]
}'
