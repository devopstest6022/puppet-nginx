class nginx(
 String $package_ensure,
 String $package_name, 
 String $config_dir, 
 String $config_ensure,
 String $config_mode,
 String $config_owner,
 String $config_group,
 String $config_confd,
 String $config_log_dir,
 String $config_pid_file,
 Optional[String] $config_vdir_enable,
 String $config_process_user,
 String $vhost_dir,
 String $service_pattern,
 String $service_ensure,
 String $service_name,
 Boolean $service_enable,
 Boolean $service_hasstatus,
 Boolean $service_hasrestart,
 String $docroot,
){
  class { '::nginx::install': }
  -> class { '::nginx::config': }
  ~> class { '::nginx::service': }
}
