function nginx::data {
  $base_params = {
    'nginx::package_ensure'       => 'present',
    'nginx::package_name'         => 'nginx',
    'nginx::config_dir'           => '/etc/nginx',
    'nginx::config_ensure'        => 'file',
    'nginx::config_mode'          => '0664',
    'nginx::config_owner'         => 'root',
    'nginx::config_group'         => 'root',
    'nginx::config_confd'         => "${config_dir}/conf.d",
    'nginx::config_log_dir'       => '/var/log/nginx',
    'nginx::config_pid_file'      => '/run/nginx.pid',
    'nginx::service_name'         => 'nginx',
    'nginx::service_ensure'       => 'running',
    'nginx::service_pattern'      => 'nginx',
    'nginx::service_enable'       => true,
    'nginx::service_hasstatus'    => true,
    'nginx::service_hasrestart'   => true,
    'nginx::docroot'              => '/usr/share/nginx',
  }
  
  case $facts['os']['family'] {
    'Debian': {
      $os_params = { 
        'nginx::config_vdir_enable'  => $config_dir,
        'nginx::config_process_user' => $www-data,
        'nginx::vhost_dir'           => "${config_dir}/sites-avaliable",
      }
    }
    default: {
      $os_params = {
        'nginx::config_vdir_enable'  => undef,
        'nginx::config_process_user' => 'nginx',
        'nginx::vhost_dir'           => $config_confd,
      }
    }
  }
  $base_params + $os_params
}
