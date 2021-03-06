#
# puppet magic for dev boxes
#
import "classes/*.pp"

$PROJ_DIR = "/vagrant"
$HOME_DIR = "/home/vagrant"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class {
    init: ;
    mesos_setup: require => Class[init];
    docker_setup:;
    python_setup:;
    ohmyzsh_setup:;
    # javascript: require => Class[init];
    marathon_setup: require => Class[mesos_setup];
}


