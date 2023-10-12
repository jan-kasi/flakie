{
  # LimitNOFILE for Steam Proton games
  # timeoutstop so you don't wait 90s on poweroff stop jobs
  systemd.extraConfig = ''
    DefaultLimitNOFILE=1048576
    DefaultTimeoutStopSec=10s
  '';
}
