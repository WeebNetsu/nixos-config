{
  lib,
  pkgs,
  ...
}:

with lib;
let
  androidSdk = androidComposition.androidsdk;
  buildToolsVersionForAapt2 = "35.0.0";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "13.0";
    # toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [
      buildToolsVersionForAapt2
      "34.0.0"
      "33.0.1"
      "28.0.3" # Added to satisfy flutter doctor
    ];
    platformVersions = [
      #   "34" # mp
      "35"
      "36"
    ];
    includeEmulator = false;
    # includeCmdLineTools = true;
    # emulatorVersion = "35.2.11";
    includeSystemImages = false;
    # systemImageTypes = [ "google_apis_playstore" ];
    # abiVersions = [ "x86_64" ];
    includeSources = false;
    includeNDK = true;
    ndkVersions = [ "28.2.13676358" ]; # As mentioned in docs
    cmakeVersions = [ "3.22.1" ]; # Added from docs
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    extraLicenses = [
      "android-googletv-license"
      "android-sdk-arm-dbt-license"
      "android-sdk-license"
      "android-sdk-preview-license"
      "google-gdk-license"
      "intel-android-extra-license"
      "intel-android-sysimage-license"
      "mips-android-sysimage-license"
      "android-googlexr-license"
    ];
  };
in
{

  nixpkgs.config = {
    android_sdk.accept_license = true;
    # allowUnfree = true;
    # android.experimental.privacysandbox.sdk.enable = false;
    # If the error persists, ensure this isn't set to true:
    # android.newDsl = false;
  };

  home.packages = with pkgs; [
    # jdk17
    jdk21
    firebase-tools
    qemu_kvm
    androidSdk
    flutter
    android-studio
  ];

  home.sessionVariables = {
    JAVA_HOME = pkgs.jdk21.home;
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";

    # This is the crucial part for NixOS:
    # It forces Flutter to use a writable cache instead of the Nix store
    PUB_CACHE = "$HOME/.pub-cache";
    # FLUTTER_SDK_ROOT = "${pkgs.flutter}";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/${buildToolsVersionForAapt2}/aapt2";
    # PATH = "$PATH:${androidSdk}/libexec/android-sdk/cmdline-tools/13.0/bin";

    # Fix for the TLS/Network crash in flutter doctor
    # NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
  };

  # home.sessionVariables = {
  #   # PATH = "$PATH:$HOME/.npm-global/bin:${androidSdk}/libexec/android-sdk/platform-tools:${androidSdk}/libexec/android-sdk/cmdline-tools/13.0/bin:${androidSdk}/libexec/android-sdk/emulator";
  #   # EDITOR = "emacs";
  #   # ANDROID_HOME = "${androidSdk}/libexec/android-sdk"; # Primary as per docs
  #   # ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk"; # Kept for compatibility
  #   # GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/${buildToolsVersionForAapt2}/aapt2";

  #   JAVA_HOME = pkgs.jdk17.home;
  #   QT_QPA_PLATFORM = "wayland;xcb"; # emulator related: try using wayland, otherwise fall back to X.

  #   # emulator related: vulkan-loader and libGL shared libs are necessary for hardware decoding
  #   # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
  #   #   pkgs.vulkan-loader
  #   #   pkgs.libGL
  #   # ]}";
  # };
}
