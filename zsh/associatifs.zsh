typeset -A user # declaration 
user=(
    login mc
    firstname marc
    lastname Chantreux
    displayname 'Marc Chantreux'
)

user[displayname]="le sysop avec une barbe"
print $user[login], $user[displayname]
