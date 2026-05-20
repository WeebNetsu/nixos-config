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
    # backup both to R2 and Google Drive on run
    "backup" =
      "rclone sync ~/Documents/LinuxMintInstalls pc-backup:pc-backup/LinuxMintInstalls && rclone sync ~/Documents/LinuxMintInstalls google-drive:/LinuxMintInstalls";
    "c" = "code .";
    "code." = "code .";
    "hyprlogout" = "hyprctl dispatch exit";
  };

  home.sessionVariables = {
    code = "cd $HOME/Documents/Code/";
    work = "cd $HOME/Documents/Work/";
  };
}
