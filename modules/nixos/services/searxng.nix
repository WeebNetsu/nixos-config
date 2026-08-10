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
      server = {
        port = 8888;
        bind_address = "0.0.0.0";
        # this will load the variable from the environment file
        secret_key = "$SEARX_SECRET_KEY";
      };

      outgoing = {
        # helps bypass captcha errors
        useragent_suffix = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36";
        enable_http2 = false;
        request_timeout = 10.0;
      };

      engines = [
        # --- Search engines to use ---
        {
          name = "duckduckgo";
          engine = "duckduckgo";
          disabled = false;
        }
        {
          name = "wikipedia";
          engine = "wikipedia";
          disabled = false;
        }
        {
          name = "mojeek";
          engine = "mojeek";
          disabled = false;
        }
        {
          name = "yahoo";
          engine = "yahoo";
          disabled = true;
          network = "ipv4";
        }

        # --- These are failing when trying to search with them ---
        {
          name = "google";
          disabled = true;
        }
        {
          name = "startpage";
          disabled = true;
        }
        {
          name = "brave";
          disabled = true;
        }
      ];

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
