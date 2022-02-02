#!/bin/bash

function usage () {
    [[ -n "$2" ]] && echo "$(basename $0): $2" >&2
    echo "$(basename $0) -e ENV [OPTIONS] | -h"
    echo
    echo "-h ................... print this message and exit"
    echo "-d ................... print the configuration used and exit"
    echo "-e ENV ............... set environment to ENV (default: standalone)"
    echo
    echo "ENV:"
    /bin/ls docker-compose.*.yml | sed 's/docker-compose\.\(.*\)\.yml/  - \1/g'
    exit $1
}

OPT_COMMAND="up -d"
OPT_ENVIRONMENT="standalone"
while getopts "hde:" opt ; do
  case "${opt}" in
    h) usage ; exit ;;
    d) OPT_COMMAND="config" ;;
    e) OPT_ENVIRONMENT="${OPTARG}" ;;
    *) usage 1 "error: unknown argument ${opt}" ; exit $? ;;
  esac
done
shift $((OPTIND-1))


override=docker-compose.${OPT_ENVIRONMENT}.yml
if [[ -z "${override}" ]] ; then
    usage 2 "error: missing mandatory argument: -e ENV"
fi
if [[ ! -r "${override}" ]] ; then
    usage 3 "error: unknown file '${override}'"
fi

docker-compose -f docker-compose.yml -f "${override}" ${OPT_COMMAND} $*
