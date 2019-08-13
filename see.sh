# Get name of project frm user input at script execution.
project_name=${1?Error: No project name given}

# Change directory to source code directory.
eval "cd ~/code/catonmat"

# Search through the codebase and fetch all matching paths.
# Change delimiter from \n to : to make it easier to handle.
path_list=$(eval "ls | grep $project_name | tr '\n' ':' ")

# DEBUG: Examine output of output variable.
# declare -p path_list

# Set Sublime Text binary path.
stt="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Get the first element of the path set.
path="$(cut -d ':' -f1 <<< "$path_list")"

# open STT in the path directory.
eval "${stt} ~/code/catonmat/${path}"

# open new Terminal window at directory.
eval "/usr/bin/open -a Terminal '${path}'"
