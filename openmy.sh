
# Get name of project and store it in variable
echo "Please enter a project name."
read project_name
echo "You entered '$project_name'."

# Search through the codebase and fetch all matching paths
eval "cd ~/code/catonmat"
# Change delimiter from \n to : to make it easier to handle.
path_list=$(eval "ls | grep $project_name | tr '\n' ':' ")

# DEBUG: Examine output of output variable.
declare -p path_list

# Set Sublime Text open binary path
stt="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Get the first element of the path set
path="$(cut -d ':' -f1 <<< "$path_list")"

# open STT in the path directory
eval "${stt} ~/code/catonmat/${path}"

# open new Terminal window at directory
eval "/usr/bin/open -a Terminal '${path}'"



