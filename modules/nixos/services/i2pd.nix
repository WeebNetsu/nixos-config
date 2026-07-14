{
  ...
}:

{
  services.i2pd = {
    enable = false;
    port = 9999;
    proto = {
      http = {
        enable = true;
        port = 4444;
        address = "127.0.0.1";
      };

      httpProxy = {
        enable = true;
        port = 4444;
        address = "127.0.0.1";
      };
    };
  };
}
