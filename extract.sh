input_str="/trigger_workflow pr_check --arg1 2323 --arg2 23232323" 
command_name="/trigger_workflow"

# Remove the leading ‘\trigger-workflow ’
command_params=${input_str#$command_name}
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
