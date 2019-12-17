uptime | awk '
              $4 ~ /min/ { d=0; h=0; m=$3; exit }
              $4 ~ /hr/ { d=0; h=1; m=0; exit }
              $4 ~ /day/ { d=$3; split($5,a,":"); h=a[1]; m=a[2]; exit }
              { d=0; split($3,a,":"); h=a[1]; m=a[2]; exit }
              END { printf ("%d Day%s %d Hour%s %d Min%s", d, (d == 1 ? "" : "s"), h, (h == 1 ? "" : "s"), m, (m == 1 ? "" : "s")) }'
echo ""
system_profiler SPSoftwareDataType | awk '{ if((/System Version/) && (/OS X/)) { print $3$4, $5, $6 }
                                            else if (/System Version/) { print $3, $4, $5 } }'

defaults read -g AppleInterfaceStyle
