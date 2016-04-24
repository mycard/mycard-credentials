FROM node
RUN apt-get update
RUN apt-get install -y git
RUN ssh-keyscan github.com bitbucket.org > /etc/ssh/ssh_known_hosts
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app
CMD [ "./entrypoint.sh" ]
