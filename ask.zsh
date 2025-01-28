#!/bin/zsh

if [ -z "$*" ] ; then
   echo "Must ask something"
   exit 1
fi

model="unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF"

# Set question to command line parameters
question=$*

# Set foldername using question but replacing any non-alphanumeric characters.
fld_name=responses/${question//[^[:alnum:]]/_}

# Build proper prompt with $question
prompt="'<｜User｜>$question<｜Assistant｜>'"

# You can also provide a simple prompt as follows:
#simpleprompt="'<｜User｜>$question<｜Assistant｜>'"
#llama-cli -hf $model \
#    --cache-type-k q8_0 \
#    --threads 16 \
#    --chat-template deepseek3
#    --prompt "$simpleprompt" \
#    -no-cnv 2> system.log > >(tee answer.txt) 

llama-cli -hf $model \
    --cache-type-k q8_0 \
    --threads 16 \
    --prompt "$prompt" \
    -no-cnv 2> system.log > >(tee answer.txt) 

if [ ! -d "$fld_name" ] ; then
  mkdir $fld_name
  mv system.log $fld_name
  mv answer.txt $fld_name
  echo "Answer located on folder $fld_name"
else
  echo "Folder $fld_name already exists."
  echo "Move files answer.txt and system.log to a safe place."
fi
