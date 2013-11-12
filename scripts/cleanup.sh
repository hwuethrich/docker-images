#!/bin/bash


function ask {
	read -p "$1 " -n 1 -r
  [[ $REPLY =~ ^[Yy]$ ]] || exit
  echo -e "\n"
}

function untagged_images {
	sudo docker images | grep --color=never '<none>'
}

function stopped_containers {
	sudo docker ps -a | grep --color=never 'Exit'
}

# CONTAINERS
count=$(stopped_containers | wc -l)
if [[ $count -gt 0 ]]; then
	sudo docker ps | head -1
  stopped_containers

	ask "Remove $count stopped containers?" || exit
  echo "Removing containers ..."
  stopped_containers | awk '{print $1}' | sudo xargs docker rm
else
	echo "No stopped containers found"
fi

# IMAGES
count=$(untagged_images | wc -l)
if [[ $count -gt 0 ]]; then
	sudo docker images | head -1
  untagged_images

	ask "Remove $count untagged images?" || exit
	echo "Removing images ..."
	untagged_images | awk '{print $3}' | sudo xargs docker rmi
else
	echo "No untagged images found"
fi
