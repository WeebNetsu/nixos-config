{
  pkgs,
  ...
}:

{
  programs.vscode = {
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
}
