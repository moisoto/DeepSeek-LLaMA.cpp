# DeepSeek-LLaMA.cpp
Running DeepSeek using LLaMA C++ tools.

## Requirements

You need to install llama.cpp if you want to use these scripts.

The easiest way is via Homebrew:

```shell
# Update brew first
brew update
brew upgrade # Optional but recommended

# Install
brew install llama.cpp
```

## Using the scripts

### Download a model.

Just call ask.zsh and it will download the `unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF` model:

```shell
# A simple initial request
./ask.zsh "What model are you?"
```

### Chatting with the model

If you want the chat interface just run:

```shell
llama-cli -hf unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF
```

### Asking a single question

The `ask.zsh` script shows how to call llama-cli with a prompt. Check the source or just play with it:
```shell
./ask.zsh "Ask any quesiton here."
```

### Running a Server

The `server.zsh` script shows how to run the server with a given model.
```shell
./server.zsh
```
Let this running on a terminal as lonk as you need the server up (scripts for setting up a service comming soon).

### Testing the Server

You can access the UI via a Web Browser: http://localhost:8080

The `call_endpoint.zsh` script shows how to call the chat completions endpoint:
```shell
./call_endpoint.zsh "Ask DeepSeek something"
```
