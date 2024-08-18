function connect-pod
  argparse 'c/context=' 'a/app=' 'p/podnum=' 's/shell' 'clean' -- $argv

  kubectl config use-context $_flag_context > /dev/null
  echo "CONTEXT: $_flag_context"

  set -q _flag_app; or set -l _flag_app "grata-search"
  echo "APP: $_flag_app"

  set -l pods (kubectl get pods -n search --field-selector=status.phase=Running --no-headers -o custom-columns=":metadata.name" --selector=app=$_flag_app)
  set -l total_pods (count $pods)

  set -q _flag_podnum; or set -l _flag_podnum $total_pods
  set _flag_podnum (math "min($_flag_podnum, $total_pods)")

  set -l pod $pods[$_flag_podnum]
  echo "POD#$_flag_podnum/$total_pods: $pod"

  set -l cmd "/bin/bash"
  if set -q _flag_clean
    set cmd "pkill -9 -f manage.py"
  else if set -q _flag_shell
    if [ $_flag_app = "grata-search" ]
      set cmd "python manage.py shell"
    else
      set cmd "python"
    end
  end
  echo "CMD: $cmd"
  echo

  eval "kubectl exec -it $pod -n search -- $cmd"
end

function staging-pod
  connect-pod --context "grata-staging.grata.com" $argv
end

function beta-pod
  connect-pod --context "grata-beta.grata.com" $argv
end

function prod-pod
  connect-pod --context "grata-prod.grata.com" $argv
end

function crawl-pod
  connect-pod --context "crawl-prod.grata.com" $argv
end

# path
fish_add_path ~/.hermes/bin/gcommand

# aliases
alias db-prod='ssh -N -p80 -i ~/.ssh/bastion-prod.pem -L 5432:grata-search-prod.cxmnmuyxrqly.us-east-1.rds.amazonaws.com:5432 forward@ec2-3-216-95-167.compute-1.amazonaws.com'
alias db-staging='ssh -N -p80 -i ~/.ssh/bastion-staging.pem -L 5432:grata-search-staging-blue.cxmnmuyxrqly.us-east-1.rds.amazonaws.com:5432 forward@bastion-staging.devapp.grata.com'
alias dctest='docker-compose -f docker-compose-test.yaml'
alias dctestrun-nodb='dctest run -e TEST_ENV=true app-test python manage.py test'
alias dctestrun='dctestrun-nodb --keepdb'
alias psql-prod='psql -h localhost -p 5432 -U gsd enterprise-search'
