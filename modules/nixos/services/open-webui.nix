{
  ...
}:

{
  # chatgpt-like interface for our AI
  services.open-webui = {
    enable = false;
    port = 5555;
    openFirewall = true;
    host = "0.0.0.0";
  };
}
