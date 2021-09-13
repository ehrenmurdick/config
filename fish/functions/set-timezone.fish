function set-timezone
  sudo echo
  curl https://ipapi.co/timezone | xargs sudo timedatectl set-timezone
  sudo ntpdate 1.ro.pool.ntp.org
end
