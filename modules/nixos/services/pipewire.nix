{
  ...
}:

{
  # need to disable pulseaudio for pipewire
  services.pulseaudio.enable = false;

  services.pipewire = {
    # Enable sound with pipewire.
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
