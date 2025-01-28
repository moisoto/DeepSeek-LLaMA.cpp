# This will run the server.
# You can access the Web UI at http://localhost:8080
# Or use script call_endpoint.zsh to test chat completion functionality 
if [ -z $1 ] ; then
   model "unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF"
else
   model="$1"
fi
llama-server -hf $model
