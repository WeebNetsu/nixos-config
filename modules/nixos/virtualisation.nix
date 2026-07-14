{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.virt-manager.enable = true;

  # enable docker
  virtualisation = {
    # enable virtualization with virt manager
    libvirtd = {
      enable = true;
    };

    docker = {
      enable = true;
      extraOptions = "--dns 1.1.1.1 --dns 8.8.8.8";
    };

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
