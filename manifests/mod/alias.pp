class apache::mod::alias {
  $icons_path = $::osfamily ? {
    'debian' => '/usr/share/apache2/icons',
    /(?i)(redhat|Linux)/ => '/var/www/icons',
  }
  apache::mod { 'alias': }
  # Template uses $icons_path
  file { 'alias.conf':
    ensure  => file,
    path    => "${apache::mod_dir}/alias.conf",
    content => template('apache/mod/alias.conf.erb'),
  }
}
