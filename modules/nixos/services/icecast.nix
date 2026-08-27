{
  ...
}:

{
  # for listening shared music like a radio
  # gebruik terwyl ek en Bak saam gewerk het in die verlede
  services.icecast = {
    enable = false;
    hostname = "localhost";
    admin = {
      user = "admin";
      password = "Luister69Liedjies!";
    };
    listen = {
      port = 8000;
    }; # Add this block:
    extraConfig = ''
      <authentication>
        <source-password>Luister69Liedjies!</source-password>
        <relay-password>Luister69Liedjies!</relay-password>
      </authentication>
    '';
  };
}
