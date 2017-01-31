#Update script for Ubuntu
#Check that user is root
if [ $(whoami) != "root" ]
then
	echo "Please run as root."
	#Exit
	exit 0
fi
#Check for apt
if [ $(which apt) ]
then
	#If $1 is empty
	if [ -z $1 ]
	then
		echo "Updating package indexes..."
		apt update
		"Updating..."
		apt upgrade -y
		apt dist-upgrade -y
	#Else if $1 is fix
	elif [ $1 = "fix" ]
	then
		rm /var/lib/apt/lists/lock
		rm /var/cache/apt/archives/lock
		rm /var/lib/dpkg/lock
		dpkg --configure -a
		apt update
		apt -f -y install
	#Else if $1 is clean
	elif [ $1 = "clean" ]
	then
		echo "Cleaning apt cache..."
		apt clean
		apt autoclean
		echo "Removing old/unused packages..."
		apt autoremove -y
	fi
elif [ $(which apt-get) ]
then
	#If $1 is empty
	if [ -z $1 ]
	then
		echo "Updating package indexes..."
		apt-get update
		"Updating..."
		apt-get upgrade -y
		apt-get dist-upgrade -y
	#Else if $1 is fix
	elif [ $1 = "fix" ]
	then
		rm /var/lib/apt/lists/lock
		rm /var/cache/apt/archives/lock
		rm /var/lib/dpkg/lock
		dpkg --configure -a
		apt-get update
		apt-get -f -y install
	#Else if $1 is clean
	elif [ $1 = "clean" ]
	then
		echo "Cleaning apt cache..."
		apt-get clean
		apt-get autoclean
		echo "Removing old/unused packages..."
		apt-get autoremove -y
	fi
fi
