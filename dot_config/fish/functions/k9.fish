function k9 --description 'Select Kubernetes context to connect to'
    set config $(ls ~/.kube/ | sed -n "/kubeconfig/p" | fzf)
    if test "$config" = ""
        echo "Exiting. No context selected to connect to"
    else
        echo "Connecting to $config"
        command k9s --kubeconfig ~/.kube/"$config"
    end
end
