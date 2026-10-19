{
  host,
  ...
}:

{
  # chatgpt-like interface for our AI
  services.ollama = {
    enable = false;
    # only define models here, anything not here will be removed
    syncModels = true;
    loadModels = [
      "qwen3:14b"
      "nomic-embed-text:latest"
    ];
  };
}
