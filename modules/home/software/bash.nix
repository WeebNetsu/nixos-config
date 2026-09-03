{
  ...
}:

{
  programs.bash = {
    enable = true;

    historyControl = [
      "ignoredups"
      "ignorespace"
    ];
    # historySize = 5000;

    shellOptions = [
      # check the window size after each command and, if necessary,
      # update the values of LINES and COLUMNS.
      "checkwinsize"
      # append to the history file, don't overwrite it
      "histappend"
    ];

    initExtra = ''
      # Only run for interactive shells
      if [[ $- != *i* ]]; then return; fi

      # sexy terminal
      PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ''${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
    '';

    bashrcExtra = ''
      # status on terminal startup
      df -h /
      echo -ne "\n\t\t\t\t\t\t\t"
      date

      # replace "code ," with "code ."
      code() {
          if [ "$1" = "," ]; then
              command code .
          else 
              command code "$@"
          fi
      }
    '';
  };

  home.shellAliases = {
    # Prepare encrypted contacts and rclone conf, backup to R2 and Google Drive
    "backup" = ''
      (
        set -e # Exit immediately if any command fails

        # Define our target directory
        TARGET="$HOME/Documents/LinuxMintInstalls"

        # Trash old gpg files if they exist (using -f or checking ensures trash won't crash set -e)
        # [ -f "$TARGET/contacts.db.gpg" ] && trash "$TARGET/contacts.db.gpg"
        [ -f "$TARGET/rclone.conf.gpg" ] && trash "$TARGET/rclone.conf.gpg"

        # Encrypt directly to the target folder without intermediate copies
        # gpg --batch --yes --passphrase-file "$HOME/enc_pass.txt" --output "$TARGET/contacts.db.gpg" -c "$HOME/Documents/Code/contacts/data/contacts.db"
        gpg --batch --yes --passphrase-file "$HOME/enc_pass_2.txt" --output "$TARGET/rclone.conf.gpg" -c "$(rclone config file | tail -n 1)"
      ) && \
      rclone sync ~/Documents/LinuxMintInstalls pc-backup:pc-backup/LinuxMintInstalls -P && \
      rclone sync ~/Documents/LinuxMintInstalls google-drive:/LinuxMintInstalls -P
    '';
    "c" = "code .";
    "code." = "code .";
    "hyprlogout" = "hyprctl dispatch 'hl.dsp.exit()'";
    "signal" = "appimage-run ~/signal-desktop.AppImage";
    # "rebuildlovr" =
    # "adb -s 340YC10GCL071D push --sync . /sdcard/Android/data/org.lovr.app/files && adb -s 340YC10GCL071D shell am start -S org.lovr.app/org.lovr.app.Activity";
  };

  home.sessionVariables = {
    code = "cd $HOME/Documents/Code/";
    work = "cd $HOME/Documents/Work/";
  };
}
