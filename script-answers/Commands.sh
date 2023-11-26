exit # Put exit above to prevent running this script
# Curl and paste to file
curl http://helsinki.fi > script-answers/exercise12_1.txt

# To start recording terminal / can be used without filename
script destination/filename.txt

# exit terminal recording
exit

# run a container even if the image to run is not downloaded on our device yet
docker container run hello-world

# See all containers
docker ps -a  # OR docker container ls -a

# See running containers
docker ps    # OR docker container ls

# start a container - docker start <container_id>
docker start 987bd1352431

# Kill a container - docker kill <container_id>
docker kill 987bd1352431

# Start a container in interactive mode
docker start -i 987bd1352431

# Once done changes inside the container, create a new image that includes the changes we have made.
docker commit 987bd1352431 hello-node-world

# container diff to check for the changes between the original image and container before doing above command.
docker container diff

# List the new images
docker image ls

# Run new image
docker run -it hello-node-world bash

# Remove the old container
docker container rm 987bd1352431

# Run a container in interactive mode with custom name
docker container run -it --name hello-node node:16 bash

# Create a new directory inside the container
# ->Run this inside container bash
mkdir /usr/src/app

# Copy your local files into the new directory
docker container cp ./index.js hello-node:/usr/src/app/index.js