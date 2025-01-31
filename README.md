# DeepSeek-LLaMA.cpp
Running DeepSeek using LLaMA C++ tools.

## Requirements

You need to install [llama.cpp](https://github.com/ggerganov/llama.cpp) if you want to use these scripts.

The easiest way is via Homebrew:

```shell
# Update brew first
brew update
brew upgrade # Optional but recommended

# Install
brew install llama.cpp
```

## The Fast Way

To use the Web UI is really easy after you have `ollama.cpp` in your system.

To download the model, just call `llama-cli` a follows:
```shell
# This will download the model and start a chat session.
# Play with the model, ask a few questions and press CTRL-C to exit
llama-cli -hf unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF
```

Now run a Web Server with the LLaMA C++ Chat UI:
```shell
# This will start the server. Just leave the terminal open.
llama-server -hf unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF
```

After running the `llama-server` command just go to your favorite browser and open http://localhost:8080

<br>

## Using the scripts

If you want to learn more about using LLaMA C++ tools check this section and the scripts used. It is assumed that you have the model downloaded as explained in the first section.

### Chatting with the model

If you want the chat interface on a a terminal just run:

```shell
llama-cli -hf unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF
```

### Asking a single question

The `ask.zsh` script shows how to call llama-cli with a prompt. Check the [source](https://github.com/moisoto/DeepSeek-LLaMA.cpp/blob/main/ask.zsh) or just play with it:
```shell
./ask.zsh "Ask any quesiton here."
```

### Running a Server

The `server.zsh` script shows how to run the server with a given model.
```shell
# Run without parameters to use model unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF
./server.zsh

# Or run with other model:
./server.zsh unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF

# Which would the same as:
llama-server -hf unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF
```
Let this running on a terminal as lonk as you need the server up (scripts for setting up a service comming soon).

### Testing the Server

You can access the UI via a Web Browser: http://localhost:8080

The `call_endpoint.zsh` script shows how to call the chat completions endpoint:
```shell
./call_endpoint.zsh "Ask DeepSeek something"
```

As you can see the server will respond in json format. This allows accessing the
model from applications and using the model's AI capabilities in many useful ways.

### Using other models

LLaMA C++ uses GGUF files (GGUF stands for GPT-Generated Unified Format). 
So you will need to look for these kind of files in Hugging Face or your
preferred model source.

For DeepSeek models [unsloth](https://huggingface.co/unsloth) has a very nice selection available at [Hugging Face](https://huggingface.co/collections/unsloth/deepseek-r1-all-versions-678e1c48f5d2fce87892ace5).
