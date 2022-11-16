#start of moodle with mariadb in docker installation
wget [put a link to raw content]
read -p 'Do you want to allow empty passwords? y/n ' ans
if [$ans = "n"]
then
    sed -i 's/ALLOW_EMPTY_PASSWORD=yes/ALLOW_EMPTY_PASSWORD=no' moodle.yml
else
    echo "next question"
fi
read -p 'Do you need a password for mariadb? y/n ' ans
if [$ans = "y"] 
then
    read -p 'Enter the root password for mariadb: ' pass
    sed -i 's/#- MARIADB_ROOT_PASSWORD=aramaki404/- MARIADB_ROOT_PASSWORD=$pass' moodle.yml
    read -p 'Enter the password for mariadb: ' pass2
    sed -i 's/#- MARIADB_PASSWORD=aramaki404/- MARIADB_PASSWORD=$pass2' moodle.yml
    sed -i 's/#- MOODLE_DATABASE_PASSWORD=aramaki404/- MOODLE_DATABASE_PASSWORD=$pass2' moodle.yml
else 
    echo 'next question'
fi
read -p 'Do you need a moodle password? y/n ' ans
if [$ans = "y"]
then
    read -p 'Enter the password: ' pass
    sed -i 's/#- MOODLE_PASSWORD=aramaki404/- MOODLE_PASSWORD=$pass' moodle.yml
else
    echo 'next question'
fi
read -p 'Do you want to change ports on host? y/n ' ans
if [$ans = "y"]
then
    read -p 'port 80 change to ' port1 
    sed -i 's/- '80:8080'/- '$port1:8080' moodle.yml
    read -p 'port 8443 change to ' port2
    sed -i 's/- '8443:8443'/- '$port2:8443'' moodle.yml
else
    echo 'No changes to ports'
fi
mv moodle.yml docker-compose.yml
sudo docker compose up
#end of installation
#
