{
  pkgs,
  ...
}:

{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        keybindings = [
          {
            "key" = "ctrl+shift+a";
            "command" = "workbench.action.toggleActivityBarVisibility";
          }
          {
            "key" = "ctrl+shift+/";
            "command" = "editor.action.blockComment";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "ctrl+shift+a";
            "command" = "-editor.action.blockComment";
            "when" = "editorTextFocus && !editorReadonly";
          }
          {
            "key" = "ctrl+shift+alt+`";
            "command" = "workbench.action.splitEditor";
          }
          {
            "key" = "ctrl+\\";
            "command" = "-workbench.action.splitEditor";
          }
          {
            "key" = "ctrl+;";
            "command" = "extension.toggleSemicolon";
            "when" = "editorTextFocus";
          }
          {
            "key" = "ctrl+shift+;";
            "command" = "extension.toggleColon";
            "when" = "editorTextFocus";
          }
          {
            "key" = "ctrl+,";
            "command" = "extension.toggleComma";
            "when" = "editorTextFocus";
          }
          {
            "key" = "ctrl+shift+\\";
            "command" = "codeium.openCodeiumCommand";
            "when" = "codeium.commandEnabled && editorTextFocus && !inlineSuggestionsVisible";
          }
          {
            "key" = "ctrl+shift+i";
            "command" = "-codeium.openCodeiumCommand";
            "when" = "codeium.commandEnabled && editorTextFocus && !inlineSuggestionsVisible";
          }
          {
            "key" = "pageup";
            "command" = "cursorHome";
            "when" = "textInputFocus";
          }
          {
            "key" = "home";
            "command" = "-cursorHome";
            "when" = "textInputFocus";
          }
          {
            "key" = "pagedown";
            "command" = "cursorEnd";
            "when" = "textInputFocus";
          }
          {
            "key" = "end";
            "command" = "-cursorEnd";
            "when" = "textInputFocus";
          }
          {
            "key" = "audiovolumeup";
            "command" = "editor.action.revealDefinition";
            "when" = "editorHasDefinitionProvider && editorTextFocus";
          }
          {
            "key" = "shift+pagedown";
            "command" = "cursorEndSelect";
            "when" = "textInputFocus";
          }
          {
            "key" = "shift+end";
            "command" = "-cursorEndSelect";
            "when" = "textInputFocus";
          }
          {
            "key" = "shift+pageup";
            "command" = "cursorHomeSelect";
            "when" = "textInputFocus";
          }
          {
            "key" = "shift+home";
            "command" = "-cursorHomeSelect";
            "when" = "textInputFocus";
          }
        ];
        userSettings = {
          "window.zoomLevel" = -2;
          "dart.flutterSdkPath" = "${pkgs.flutter}";
          "editor.multiCursorModifier" = "ctrlCmd";
          "editor.wordWrap" = "on";
          "workbench.iconTheme" = "material-icon-theme";
          "editor.fontSize" = 16;
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
          "js/ts.updateImportsOnFileMove.enabled" = "always";
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
        languageSnippets = {
          cpp = {
            "Output_to_console" = {
              "prefix" = "cout";
              "description" = "Will create basic c++ cout snippet";
              "body" = [
                "std::cout << \"$1\" << std::endl;"
                "$0"
              ];
            };
            "Basic Start Snippet" = {
              "prefix" = [
                "begin"
                "start"
                "temp"
              ];
              "description" = "This will create the basic C++ starter code";
              "body" = [
                "#include <iostream>\n"
                "int main(int argc, char const *argv[])"
                "{"
                "\t\${0:std::cout << \"Hello World\" << std::endl;}\n"
                "\treturn 0;"
                "}"
              ];
            };
            "User Input" = {
              "prefix" = "cin";
              "description" = "Will create basic c++ cin snippet";
              "body" = [
                "std::cin >> $1;"
                "$0"
              ];
            };
          };
          html = {
            "HTML 5 Template" = {
              "prefix" = [
                "html"
                "chtml"
                "xhtml"
                "html:5"
              ];
              "body" = [
                "<!DOCTYPE html>"
                "<html lang=\"en\">"
                "  <head>"
                "    <meta charset=\"UTF-8\" />"
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />"
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />"
                ""
                "    <!-- Add site description -->"
                "    <meta name=\"description\" content=\"\${1:This page is about...}\" />"
                ""
                "    <!-- Bootstrap -->"
                "    <link"
                "      rel=\"stylesheet\""
                "      href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\""
                "    />"
                "    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>"
                "    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>"
                "    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>"
                ""
                "    <!-- Fontawesome -->"
                "    <link"
                "      rel=\"stylesheet\""
                "      type=\"text/css\""
                "      href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\""
                "    />"
                ""
                "    <title>\${2:My Site}</title>"
                ""
                "    <link rel=\"shortcut icon\" href=\"${"3:icon"}.png\" type=\"image/x-icon\" />"
                ""
                "    <link rel=\"stylesheet\" href=\"${"4:style"}.css\" />"
                "  </head>"
                "  <body>"
                "      $0"
                "  </body>"
                "</html>"
              ];
            };
          };
          typescriptreact = {
            "Meteor.js Fetch Data" = {
              "prefix" = [
                "fetchData"
              ];
              "body" = [
                "const fetchData = async (silent = false) => {"
                "\tif (!silent) setLoading(true);\n"
                "\ttry {"
                "\t\tconst findData: MethodUMFindCollectionModel = {"
                "\t\t\tcollection: AvailableCollectionNames.ADMIN_EMAILS,"
                "\t\t\tselector: {"
                "\t\t\t\tdefault: true,"
                "\t\t\t},"
                "\t\t\tonlyOne: true,"
                "\t\t};\n"
                "\t\tconst res: AdminEmailModel | undefined = await Meteor.callAsync('umFindCollection', findData);"
                "\t\tsetAdminDefaultEmail(res);"
                "\t} catch (error) {"
                "\t\terrorResponse(error as unknown as Meteor.Error, 'Could not get some email details');"
                "\t}"
                "\ttry {"
                "\t\tconst res: UserModel | undefined = await Meteor.callAsync('getCurrentUser');"
                "\t\tsetUser(res);"
                "\t} catch (error) {"
                "\t\terrorResponse(error as Meteor.Error, 'Could not get account');"
                "\t}\n"
                "\tsetLoading(false);"
                "};\n"
                "useEffect(() => {"
                "\tfetchData();"
                "}, []);"
              ];
              "description" = "Creates basic fetch request for meteor";
            };
            "Meteor.js Error Response" = {
              "prefix" = [
                "esponse"
                "errorresponse"
                "erresponse"
                "errresponse"
              ];
              "body" = [
                "errorResponse(error as Meteor.Error, \"$0\")"
              ];
              "description" = "Creates basic fetch request for meteor";
            };
            "Functional React Component" = {
              "prefix" = [
                "rfc"
              ];
              "body" = [
                "import React from 'react';\n"
                "const \${1:MyPage}: React.FC = () => {"
                "\treturn ("
                "\t\t<>"
                "\t\t\t\${0:<h1>Hello World</h1>}"
                "\t\t</>"
                "\t)"
                "}\n"
                "export default \${1:MyPage};"
              ];
              "description" = "Creates basic react functional component";
            };
            "Wouter Use Params" = {
              "prefix" = [
                "uparams"
                "useparams"
              ];
              "body" = [
                "const { $0 } = useParams();"
              ];
              "description" = "Creates basic wouter useParams";
            };
            "Wouter Use Location" = {
              "prefix" = [
                "wuloc"
                "ulocation"
                "unav"
                "usenavigate"
                "uselocation"
              ];
              "body" = [
                "const [location, navigate] = useLocation()"
              ];
              "description" = "Creates basic wouter useLocation";
            };
            "Class React Component" = {
              "prefix" = [
                "rc"
                "rcc"
                "crc"
              ];
              "body" = [
                "import React from 'react';\n"
                "class \${1:comp} extends React.Component{"
                "\trender(){"
                "\t\treturn("
                "\t\t\t<div>"
                "\t\t\t\t\${0:<h1>Hello World</h1>}"
                "\t\t\t</div>"
                "\t\t)"
                "\t}"
                "}\n"
                "export default \${1:comp};"
              ];
              "description" = "Creates basic react class component";
            };
            "Use State" = {
              "prefix" = [
                "ustate"
                "us"
              ];
              "body" = "const [\${1:state}, set$2\${1:State}] = useState($0);";
              "description" = "Creates a useState snippet";
            };
            "Use Effect" = {
              "prefix" = [
                "ueffect"
                "ue"
              ];
              "body" = [
                "useEffect(() => {"
                "\t$0"
                "}, [$1])"
              ];
              "description" = "Creates a useState snippet";
            };
            "Handle Submit" = {
              "prefix" = [
                "hsubmit"
                "handlesubmit"
              ];
              "body" = [
                "const handleSubmit = (e: React.FormEvent) => {"
                "\te.preventDefault();\n\n\t$0"
                "}\n"
              ];
              "description" = "Creates a submit handler snippet";
            };
            "Use Tracker" = {
              "prefix" = [
                "utracker"
                "usetracker"
              ];
              "body" = [
                "const { loading, $0 } = useTracker(() => {"
                "\t$1"
                "})"
              ];
              "description" = "Create a Meteor.js useTracker hook.";
            };
          };
        };
      };
    };
  };
}
