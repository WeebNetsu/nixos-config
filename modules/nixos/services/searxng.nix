{
  pkgs,
  ...
}:

{
  # search engine for our AI models
  services.searx = {
    enable = true;
    environmentFile = "/home/netsu/searxng.env";
    package = pkgs.searxng;
    settings = {
      server.port = 8888;
      server.bind_address = "0.0.0.0";

      search = {
        # json allows lm studio to make searches
        formats = [
          "html"
          "json"
        ];
      };
    };
  };
}
