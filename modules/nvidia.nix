{ config, inputs, ...}:

{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ] ;
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;
  boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
  };
}
