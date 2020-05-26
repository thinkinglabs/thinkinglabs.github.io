#!/usr/bin/env bash
set -e

function usage() {
  echo "usage:  $0 <command> [<terraform params>]"
  echo
  echo "  <command>           plan|apply"
  echo "  <terraform params>  any supported terraform command parameters"
  exit 1
}

function static_analysis() {
  echo "validating ..."
  terraform validate

  echo "linting ..."
  tflint .
}

function switch_workspace() {
  local env=$1

  echo "switching workspace to ${env} ..."
  terraform workspace select ${env}
}

function plan() {
  echo "creating a plan ..."
  terraform plan -var-file=$HOME/.ovh/ovh.tfvar -out=tfplan -input=false $@
}

function apply() {
  echo "applying plan ..."
  terraform apply -input=false tfplan $@
}

if [[ $# < 1 ]]; then
  usage
fi

command=$1
shift 1

case "${command}" in
  plan)
    static_analysis
    plan "$@"
    ;;

  apply)
    apply "$@"
    ;;

  *)
    usage
    ;;
esac
