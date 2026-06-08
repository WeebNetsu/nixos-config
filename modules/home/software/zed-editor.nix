# not currently installed, experimenting if it is worth it
{
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "vscode-dark-modern"
      "material-icon-theme"
      "codebook"
      "comment"
    ];
    userSettings = {
      project_panel = {
        dock = "left";
      };
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      session = {
        trust_all_worktrees = true;
      };
      file_types = {
        typescript = [ "*.tsz" ];
      };
      linked_edits = true;
      show_whitespaces = "all";
      tab_size = 4;
      soft_wrap = "editor_width";
      show_edit_predictions = false;
      vim_mode = false;
      multi_cursor_modifier = "cmd_or_ctrl";
      ui_font_size = 11;
      buffer_font_size = 11;
      format_on_save = "on";
      formatter = "prettier";
      minimap = {
        show = "always";
        thumb = "always";
      };
    };
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "ctrl-shift-a" = "workspace::ToggleLeftDock";
          # "ctrl-shift-alt-`" = "pane::SplitRight";
        };
      }
      {
        context = "Editor";
        bindings = {
          "ctrl-shift-/" = "editor::ToggleComments";
          "pageup" = "editor::MoveToStartOfParagraph";
          "pagedown" = "editor::MoveToEndOfLine";
          "shift-pageup" = "editor::SelectToStartOfParagraph";
          "shift-pagedown" = "editor::SelectToEndOfLine";
          # "audiovolumeup" = "editor::GoToDefinition";
          "ctrl-enter" = "editor::NewlineBelow";
          "ctrl-shift-enter" = "editor::NewlineAbove";
        };
      }
    ];
  };
}
