input_str="/trigger-workflow pr_check" 
command_name="/trigger-workflow"

# Remove the leading ‘\trigger-workflow ’
command_params=${input_str#$command_name}
echo $command_params

IFS=' ' read -ra args <<< $command_params

workflow_name=${args[0]}
echo "workflow_name=${workflow_name}" 

for ((i = 1; i < ${#args[@]}; i++)); do
    arg=${args[i]}
    if [[ $arg == --* ]]; then
        key=${arg#--}
    else
        echo "${key}=${arg}" 
    fi
done
