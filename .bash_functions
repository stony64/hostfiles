####################################
#
# => Functions
#
####################################

# extract Archive
function extract() {
    if [ -f "$1" ]; then
        case $1 in
            *.tar.gz) tar xvzf $1
                ;;
            *.tar.bz2) tar xvjf $1
                ;;
            *.tar.xz) tar xf $1
                ;;
            *.gz) gunzip $1
                ;;
            *.tar) tar xvf $1
                ;;
            *.zip) unzip $1
                ;;
            *.bz2) bzip2 -d $1
                ;;
            *) printf "%s\n" "$1 cannot be extracted via this command."
                ;;
        esac
    else
        printf "%s\n" "Sorry, $1 is not a valid archive."
    fi
}

# Clear the screen.
function cls(){
    clear;
}

# Show the command line history.
function h(){
    history;
}


# Clear history
function clear_history() {
    cat /dev/null > ~/.bash_history && history -c && exit
}

# Display mount output in columns.
function mounted(){
    /bin/mount | column -t;
}

# Go back directory level.
function ..(){
    builtin cd ..; pwd;
}

# Go back directory level.
function ...(){
    builtin cd ../..; pwd;
}

# List almost all files with classification.
function l(){
    ls --color=auto -F;
}

# List all files with classification.
function la(){
    ls --color=auto -A -F -h --time-style=+"%Y-%m-%d %H:%M:%S";
}

# Long list almost all files with classification and a humanly-readable size.
function ll(){
    ls --color=auto -A -F -l -h --time-style=+"%Y-%m-%d %H:%M:%S";
}

# Long listing with the newest files last.
function lt(){
    ls --color=auto -A -F -l -h -t -r --time-style=+"%Y-%m-%d %H:%M:%S";
}

function l.(){
    ls --color=auto -A -F -d .* ;
}

# List all directories.
function d(){
    dir -lhaF --time-style=+"%Y-%m-%d %H:%M:%S" --color=always | egrep '^d';
}

# Find the biggest files or folders in current directory.
function biggest(){
    du -sk * | column -t | sort -nr | head -20;
}

# Show current time.
function t(){
    date +%H:%M:%S;
}

# Find PID of process.
function psg(){
    prog=; ps -ef | grep "";
}

# Show active ports.
function ports(){
    netstat -tulpna;
}

# Grep through history.
function hg(){
    history | grep ;
}

# Show applications connected to the network.
function listening(){
    lsof -P -i -n;
}

# Print the number of packages.
function pkgnum(){
    dpkg --get-selections | wc -l;
}

# Create backup of a file.
function bak(){
    cp -v ""{,.bak};
}

# Update various hosts
function au() {
    clear
    local hostname=$(hostname)
    local header="Hostname: $hostname"
    local header_length=${#header}
    local min_width=40  # Mindestbreite für den Rahmen

    local border_width=$(( (min_width - header_length - 2) / 2 ))  # Abzug für die Raute-Zeichen

    if (( border_width < 0 )); then
        border_width=1
    fi

    local border=$(printf '#%.0s' $(seq 1 $((min_width)) ))

    echo
    echo "$border"
    printf "#%*s#\n" $((min_width -2)) ""
    printf "#%*s%s%*s#\n" $((border_width)) "" "$header" $((border_width + (min_width - header_length) % 2))
    printf "#%*s#\n" $((min_width -2)) ""
    echo "$border"
    echo

    if [ "$hostname" = "proxmoxis" ]; then
        apt update && apt upgrade && apt full-upgrade && apt clean && apt autoclean && apt autoremove && pveam update && updatedb && sync;
        echo
        echo "Ausführung für Host $hostname erledigt! "
        echo
    elif [ "$hostname" = "raspifix" ]; then
        apt update && apt upgrade && apt full-upgrade && apt clean && apt autoclean && apt autoremove && pihole -up && pihole-updatelists && sync;
        echo
        echo "Ausführung für Host $hostname erledigt! "
        echo
    else
        apt update && apt upgrade && apt full-upgrade && apt clean && apt autoclean && apt autoremove && sync;
        echo
        echo "Ausführung für Host $hostname erledigt! "
        echo
    fi
}
