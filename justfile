install-desktop: 
    nh os switch .#desktop

rebuild-desktop: 
    nh os switch .#desktop

update-desktop:
    nh os switch .#desktop --update

install-laptop: 
    nh os switch .#laptop

rebuild-laptop: 
    nh os switch .#laptop

update-laptop:
    nh os switch .#laptop --update

PLEASE-READ-THIS-clear-space-update-justfile-code-before-running:
    @echo "STOP: Read and verify the commands in your justfile before running! You are going to have to update it before running."
    @exit 1

    # get the nix version numbers, read them and add it to the next command
    # sudo nh clean all --dry 

    # seq are the version numbers, I like to NOT delete my very first generation, and my latest, so I usually choose my 2nd oldest to my 2nd newest generations
    sudo nix-env -p /nix/var/nix/profiles/system --delete-generations $(seq 59 123)

    # clean up all the messy leftovers
    sudo nix-collect-garbage
