{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  # render with GPU not CPU
  hardware = {
    graphics.enable = true;
    # if I wanna start gaming, add below line
    # graphics.enable32Bit = true;

    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
