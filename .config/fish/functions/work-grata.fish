function connect-pod
  set context $argv[1]
  kubectl config use-context $argv[1] > /dev/null
  echo "CONTEXT: $context"

  set app $argv[2]
  if not set -q app
    set app "grata-search"
  end
  echo "APP: $app"

  set pod (kubectl get pods -n search --field-selector=status.phase=Running --no-headers -o custom-columns=":metadata.name" --selector=app=$app | tail -1)
  echo "POD: $pod"
  echo

  kubectl exec -it $pod -n search -- /bin/bash
end

function staging-pod
  connect-pod "grata-staging.grata.com" $argv
end

function prod-pod
  connect-pod "grata-prod.grata.com" $argv
end
