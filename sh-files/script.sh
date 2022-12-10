#start of moodle with mariadb in docker installation
wget https://raw.githubusercontent.com/StEugen/Opus-5/Test/docker-files/moodle.yml 
echo 'Do you want to allow empty passwords? y/n '
read ans
case $ans in 
    y ) echo "next question";;
    n ) sed -i "s/ALLOW_EMPTY_PASSWORD=yes/ALLOW_EMPTY_PASSWORD=no/g" moodle.yml;;
esac
echo 'Do you need a password for mariadb? y/n ' 
read ans
case $ans in 
    y ) echo 'Enter the root password for mariadb: ' 
        read pass
        sed -i "s/#- MARIADB_ROOT_PASSWORD=aramaki404/- MARIADB_ROOT_PASSWORD=$pass/g" moodle.yml
        echo 'Enter the password for mariadb: ' 
        read pass2 
        sed -i "s/#- MARIADB_PASSWORD=aramaki404/- MARIADB_PASSWORD=$pass2/g" moodle.yml
        sed -i "s/#- MOODLE_DATABASE_PASSWORD=aramaki404/- MOODLE_DATABASE_PASSWORD=$pass2/g" moodle.yml;;
    n ) echo 'next question';;
esac
echo 'Do you need a moodle password? y/n'
read ans 
case $ans in   
    y ) echo 'Enter the password'
        read pass 
        sed -i "s/#- MOODLE_PASSWORD=aramaki404/- MOODLE_PASSWORD=$pass/g" moodle.yml;;
    n ) echo 'next question';;
esac
echo 'Do you want to change ports on host? y/n'
read ans 
case $ans in
    y ) echo 'port 80 change to'
        read port1 
        sed -i "s/- '80:8080'/- '$port1:8080'/g" moodle.yml
        echo 'port 8443 change to' 
        read port2 
        sed -i "s/- '8443:8443'/- '$port2:8443'/g" moodle.yml;;
    n ) echo 'No changes to ports';;
esac
mv moodle.yml docker-compose.yml
sudo docker compose up
#end of installation
#
