alias k=kubectl
export do="--dry-run=client -o yaml"
export nks="-n kube-system"

function kns() {
  kubectl config set-context --current --namespace="$1"
}

source <(kubectl completion bash)
complete -o default -F __start_kubectl k
#or
complete -F __start_kubectl k

alias k=kubectl
alias kcd="kubectl create deployment"
alias kgd="kubectl get deploy"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgs="kubectl get svc"
alias kge="kubectl get events --sort-by=.metadata.creationTimestamp | tail -8"


alias kdp="kubectl describe pod"
alias kdd="kubectl describe deployment"
alias kds="kubectl describe service"
alias kdn="kubectl describe node"
alias kpf='kubectl port-forward'

function pod_check() {

kubectl get pod -n $1 -o 'custom-columns=CONTAINER:.spec.containers[0].name,READY:.status.containerStatuses[0].ready,IMAGE:.spec.containers[0].image,NODE:.spec.nodeName'
}