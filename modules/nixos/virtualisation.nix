{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # enable docker
  virtualisation = {
    # enable virtualization with virt manager
    libvirtd.enable = true;

    docker.enable = true;

    # get portainer going to manage docker
    oci-containers = {
      backend = "docker";
      containers = {
        portainer = {
          image = "portainer/portainer-ce:latest";
          ports = [
            #   "9445:8000"
            "9443:9443"
          ];
          volumes = [
            "/var/run/docker.sock:/var/run/docker.sock"
            "portainer_data:/data"
          ];
          extraOptions = [ "--name=portainer" ];
        };
      };
    };
  };
}
