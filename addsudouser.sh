# shell script to add a user to linux with username as password and create home directory with permissions
# usage: ./addsudouser.sh username

if [ $# -ne 1 ]; then
    echo "usage: adduser.sh <username>"
    exit 1
fi

username=$1

# add user
   useradd $username

# set password to username
   echo $username | passwd $username --stdin
    
# create home directory
   mkdir /home/$username

# set permissions
   chown $username:$username /home/$username
   chmod 700 /home/$username

# add user to sudoers
   echo "$username ALL=(ALL) ALL" >> /etc/sudoers
