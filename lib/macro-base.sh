test -n "${__macro_base:+x}" && return ; __macro_base=1


. $scriptdir/lib/macro-docker.sh


macro_base_build() {
    local baseimage="$1" ; shift

    local user=$(current_user)
    local uid=$(current_uid)
    local gid=$(current_gid)

    macro_docker_build \
        macro-base \
        macro-base \
        --build-arg baseimage=$baseimage \
        --build-arg user=$user \
        --build-arg uid=$uid \
        --build-arg gid=$gid
}
