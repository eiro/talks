local -A user=(
    login         mc
    firstname     marc
    lastname      Chantreux
    displayname   'Marc "eiro" Chantreux'
)

user[displayname]='l''évangeliste de $renater'
print $user[login], $user[displayname]


