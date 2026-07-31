function pod-connect
  argparse 'c/context=' 'a/app=' 'p/podnum=' 's/shell' 'clean' -- $argv

  if not kubectl config use-context $_flag_context > /dev/null 2>&1
    echo "ERROR: failed to switch to context '$_flag_context'" >&2
    return 1
  end
  echo "CONTEXT: $_flag_context"

  set -q _flag_app; or set -l _flag_app 'grata-search'
  echo "APP: $_flag_app"

  set -l pods (kubectl get pods -n search --field-selector=status.phase=Running --no-headers -o custom-columns=":metadata.name" --selector=app=$_flag_app)
  set -l total_pods (count $pods)

  if test $total_pods -eq 0
    echo "ERROR: no running pods found for app '$_flag_app'" >&2
    return 1
  end

  set -q _flag_podnum; or set -l _flag_podnum 1
  set _flag_podnum (math "min($_flag_podnum, $total_pods)")

  set -l pod $pods[$_flag_podnum]
  echo "POD#$_flag_podnum/$total_pods: $pod"

  set -l cmd /bin/bash
  if set -q _flag_clean
    set cmd pkill -9 -f manage.py
  else if set -q _flag_shell
    if [ $_flag_app = 'grata-search' ]
      set cmd python manage.py shell
    else if not string match -rq 'crawl' $_flag_app
      set cmd python
    end
  end
  echo "CMD: $cmd"
  echo

  kubectl exec -it $pod -n search -- $cmd
end

function pod-staging
  pod-connect --context 'staging-use1-eks-general' $argv
end

function pod-beta
  pod-connect --context 'beta-use1-eks-general' $argv
end

function pod-prod
  pod-connect --context 'prod-use1-eks-general' $argv
end

function pod-prod-eu
  pod-connect --context 'prod-euc1-eks-general' $argv
end

function pod-crawl
  pod-connect --context 'crawl-prod.grata.com' $argv
end

# gcommand
fish_add_path -gP '/Users/vino/.hermes/bin/gcommand'

# aliases
alias db-prod='ssh -N -p80 -i ~/.ssh/bastion-prod.pem -L 5432:grata-search-prod.cxmnmuyxrqly.us-east-1.rds.amazonaws.com:5432 forward@ec2-3-216-95-167.compute-1.amazonaws.com'
alias db-staging='ssh -N -p80 -i ~/.ssh/bastion-staging.pem -L 5432:grata-search-staging-blue.cxmnmuyxrqly.us-east-1.rds.amazonaws.com:5432 forward@bastion-staging.devapp.grata.com'
alias psql-prod='psql -h localhost -p 5432 -U gsd enterprise-search'

alias dctest='docker compose -f docker-compose-test.yaml'
alias dctestpy='dctest run --rm -e TEST_ENV=true app-test python manage.py'
alias dctestrun-nodb='dctestpy test'
alias dctestrun='dctestrun-nodb --keepdb'

alias ghprc='gh pr create -t "$(git branch --show-current | string split -f2 / | string upper): $(git show -s --format=%s)" -T pull_request_template.md'
