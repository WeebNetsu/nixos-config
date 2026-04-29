{
  config,
  pkgs,
  unstable,
  nixpkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "netsu";
  home.homeDirectory = "/home/netsu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      # required by sublime text https://github.com/sublimehq/sublime_text/issues/5984
      "openssl-1.1.1w"
      #   "ventoy-gtk3-1.1.10"
    ];
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "WeebNetsu";
          email = "stephenvdw7777@gmail.com";
        };

        init.defaultBranch = "main";
      };
    };

    # Nix CLI helper https://github.com/nix-community/nh
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/netsu/Documents/configs/nixos-config"; # sets NH_OS_FLAKE variable for you
    };

    vscode = {
      enable = true;
      profiles = {
        default = {
          userSettings = {
            "dart.flutterSdkPath" = "${pkgs.flutter}";
            "editor.multiCursorModifier" = "ctrlCmd";
            "editor.wordWrap" = "on";
            "workbench.iconTheme" = "material-icon-theme";
            "editor.fontSize" = 12;
            "python.pythonPath" = "${pkgs.python315}";
            "liveServer.settings.donotVerifyTags" = true;
            "[html]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[css]" = {
              "editor.defaultFormatter" = "aeschli.vscode-css-formatter";
            };
            "editor.cursorWidth" = 2;
            "workbench.startupEditor" = "newUntitledFile";
            "[javascript]" = {
              "editor.defaultFormatter" = "vscode.typescript-language-features";
            };
            "[lua]" = {
              "editor.defaultFormatter" = "sumneko.lua";
            };
            "[javascriptreact]" = {
              "editor.defaultFormatter" = "ms-vsliveshare.vsliveshare";
            };
            "files.associations" = {
              "*.js" = "javascript";
              "*.html" = "html";
              "*.man" = "troff";
              "*.erb" = "erb";
              "*.tsz" = "typescript";
            };
            "python.showStartPage" = false;
            "javascript.updateImportsOnFileMove.enabled" = "always";
            "security.workspace.trust.untrustedFiles" = "open";
            "security.workspace.trust.startupPrompt" = "never";
            "python.defaultInterpreterPath" = "${pkgs.python315}";
            "prettier.useTabs" = true;
            "python.autoUpdateLanguageServer" = false;
            "python.formatting.provider" = "black";
            "[typescript]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "better-comments.tags" = [
              {
                "tag" = "!";
                "color" = "#FF2D00";
                "strikethrough" = false;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = false;
                "italic" = false;
              }
              {
                "tag" = "MARK=";
                "color" = "#24c734";
                "strikethrough" = false;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = true;
                "italic" = false;
              }
              {
                "tag" = "?";
                "color" = "#3498DB";
                "strikethrough" = false;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = false;
                "italic" = false;
              }
              {
                "tag" = "//";
                "color" = "#474747";
                "strikethrough" = true;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = false;
                "italic" = false;
              }
              {
                "tag" = "todo";
                "color" = "#FF8C00";
                "strikethrough" = false;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = false;
                "italic" = false;
              }
              {
                "tag" = "*";
                "color" = "#98C379";
                "strikethrough" = false;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = false;
                "italic" = false;
              }
              {
                "tag" = "note";
                "color" = "#98C379";
                "strikethrough" = false;
                "underline" = false;
                "backgroundColor" = "transparent";
                "bold" = false;
                "italic" = false;
              }
            ];
            "[typescriptreact]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "editor.renderWhitespace" = "all";
            "git.autofetch" = true;
            "files.watcherExclude" = {
              "**/.bloop" = true;
              "**/.metals" = true;
              "**/.ammonite" = true;
            };
            "editor.guides.bracketPairs" = true;
            "editor.formatOnSave" = true;
            "typescript.updateImportsOnFileMove.enabled" = "always";
            "[scss]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "editor.minimap.showSlider" = "always";
            "[markdown]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[json]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "explorer.confirmDragAndDrop" = false;
            "nim.nimprettyIndent" = 4;
            "nim.nimprettyMaxLineLen" = 120;
            "cSpell.enableFiletypes" = [ "nim" ];
            "cSpell.userWords" = [
              "antd"
              "cligen"
              "commandline"
              "Cupertino"
              "DIMM"
              "dont"
              "dotenv"
              "Dubia"
              "elif"
              "fastapi"
              "fontawesome"
              "FOSS"
              "Gamepad"
              "gatvol"
              "Gauteng"
              "ipairs"
              "kanban"
              "LÖVE"
              "Luarocks"
              "lunajson"
              "netsu"
              "noconv"
              "pgadmin"
              "pgdata"
              "Popconfirm"
              "println"
              "pydantic"
              "reduxjs"
              "sandboxing"
              "sendgrid"
              "sequtils"
              "signup"
              "sqlalchemy"
              "Stokvel"
              "Stokvelle"
              "strformat"
              "strikethrough"
              "strutils"
              "Supabase"
              "tauri"
              "TOTP"
              "unfocus"
              "upsert"
              "Vlang"
              "Weeb"
              "weebnetsu"
              "Westhuizen"
              "Wouter"
            ];
            "cSpell.checkOnlyEnabledFileTypes" = false;
            "editor.codeActionsOnSave" = {
              "source.organizeImports" = "explicit";
            };
            "git.confirmSync" = false;
            "editor.tabSize" = 4;
            "[dart]" = {
              "editor.formatOnSave" = true;
              "editor.formatOnType" = true;
              "editor.rulers" = [ 120 ];
              "editor.selectionHighlight" = false;
              "editor.suggest.snippetsPreventQuickSuggestions" = false;
              "editor.suggestSelection" = "first";
              "editor.tabCompletion" = "onlySnippets";
              "editor.wordBasedSuggestions" = "off";
              "editor.tabSize" = 4;
              "editor.insertSpaces" = true;
              "editor.detectIndentation" = false;
              "editor.suggest.insertMode" = "replace";
              "editor.defaultFormatter" = "Dart-Code.dart-code";
              "editor.inlayHints.enabled" = "offUnlessPressed";
            };
            "editor.detectIndentation" = false;
            "dart.lineLength" = 120;
            "[jsonc]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[python]" = {
              "editor.formatOnType" = true;
              "editor.defaultFormatter" = "ms-python.black-formatter";
            };
            "arduino.useArduinoCli" = true;
            "editor.linkedEditing" = true;
            "explorer.confirmPasteNative" = false;
            "workbench.colorTheme" = "Dark+";
            "editor.accessibilitySupport" = "off";
            "editor.minimap.sectionHeaderFontSize" = 10;
            "editor.minimap.size" = "fill";
            "redhat.telemetry.enabled" = false;
            "dart.debugExternalPackageLibraries" = false;
            "dart.debugSdkLibraries" = false;
            "workbench.colorCustomizations" = {
              "terminal.background" = "#00000000";
            };
            "workbench.settings.applyToAllProfiles" = [ "workbench.colorCustomizations" ];
            "window.customMenuBarAltFocus" = false;
            "telemetry.feedback.enabled" = false;
            "remote.SSH.experimental.chat" = false;
            "C_Cpp.copilotHover" = "disabled";
            "editor.inlineSuggest.enabled" = false;
            "docker.extension.enableComposeLanguageServer" = false;
            "python.analysis.typeCheckingMode" = "standard";
            "[yaml]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "editor.defaultFoldingRangeProvider" = "vscode.typescript-language-features";
            "[dockercompose]" = {
              "editor.insertSpaces" = true;
              "editor.tabSize" = 2;
              "editor.autoIndent" = "advanced";
              "editor.quickSuggestions" = {
                "other" = true;
                "comments" = false;
                "strings" = true;
              };
              "editor.defaultFormatter" = "redhat.vscode-yaml";
            };
            "[github-actions-workflow]" = {
              "editor.defaultFormatter" = "redhat.vscode-yaml";
            };
            "workbench.secondarySideBar.defaultVisibility" = "hidden";
            "workbench.editor.empty.hint" = "hidden";
            "terminal.integrated.stickyScroll.enabled" = false;
            "tailwindDocs.useSimpleBrowser" = false;
            "editor.aiStats.enabled" = false;
            "streamer-mode.enabled" = false;
            "git.openRepositoryInParentFolders" = "never";
            "terminal.integrated.enableMultiLinePasteWarning" = "never";
            "terminal.integrated.initialHint" = false;
          };
        };
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brave
    mongodb-compass
    slack
    telegram-desktop
    discord
    handbrake
    sqlitebrowser
    audacity
    # nextcloud-client # use nextcloudcmd instead of the client as it is wonky on hyprland
    # megasync # just couldn't get megasync or megacli to work on Hyprland
    # hoppscotch # doesn't work on wayland
    vivaldi
    # brasero
    warpinator
    scrcpy
    lmstudio
    nemo
    rclone # actually good nextcloud/megasync alternative
    # krusader
    bat
    # lite-xl # sublime text alt
    sublime4
    # meteor # too old, like version 2 instead of 3
    qbittorrent
    element-desktop
    libreoffice
    gnome-calculator
    calc
    liquidsoap
    openai-whisper
    # polybar
    # cava
    imv # sxiv alternative
    # flameshot
    satty # flameshot alternative
    slurp # "select a region in wayland and print it to stdout" used by grim/satty
    grim # required by flameshot and satty on wayland systems
    hyprpicker # color picker
    wl-clipboard # required by hyprpicker
    piper-tts
    # wyoming-piper
    # ventoy-full-gtk
    patool # archive manager, unzip, zip etc. less cumbersome that tar
    kdePackages.kdenlive
    # gimp
    gimp-with-plugins
    yt-dlp
    # kdePackages.k3b # cd burning, alternative to brasero
    # dvdplusrwtools # https://nixos.wiki/wiki/Writing_DVDs
    kdePackages.ark

    #development
    opencode
    nodejs_20
    # bun
    # distrobox
    flutter
    # dart
    rust-analyzer
    rustc
    cargo
    gcc
    python315
    nimble
    nim
    typescript
    lua
    love
    # pipx
    pdm

    # games
    unciv

    # inputs.comfyui-nix.packages.${pkgs.system}.comfyui-cuda
    # unstable packages
    unstable.fresh-editor
  ];

  services.flatpak.packages = [
    "com.actualbudget.actual"
    "net.ankiweb.Anki"
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/hypr/hyprpaper.conf;
    ".local/share/nemo/actions/open_xfce_terminal.nemo_action".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/.local/share/nemo/actions/open_xfce_terminal.nemo_action;
    # ".config/flameshot/flameshot.ini".source =
    #   config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/flameshot/flameshot.ini;
    ".config/waybar/config.jsonc".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/waybar/config.jsonc;
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/.bashrc;

    # makes npm i -g work
    ".npmrc".text = ''
      prefix=~/.npm-global
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/netsu/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # makes npm i -g work
    PATH = "$PATH:$HOME/.npm-global/bin";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
