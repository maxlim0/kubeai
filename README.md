# set kube cluster for kubectl
doctl kubernetes cluster kubeconfig save <<cluster_id>>

# get argo secret
k describe secret -n argocd argocd-initial-admin-secret | kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 --decode && echo

# get access to argocd UI
k -n argocd port-forward svc/argocd-server 8000:80

# get grafana admin
kubectl get secret kube-prometheus-stack-grafana \
  -n monitoring \
  -o jsonpath="{.data.admin-password}" | base64 --decode

# get access to grafana UI
k port-forward -n monitoring svc/kube-prometheus-stack-grafana 8080:80


                                                                                                                    