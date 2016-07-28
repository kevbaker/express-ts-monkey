FROM nodesource/node:4.0

# References
# reference: https://nodesource.com/blog/dockerizing-your-nodejs-applications/
# usage: 
# docker build -t "express-ts-monkey" .
# docker run -it -p 3000:3000 "express-ts-monkey"

# Settings
ENV MODE=LOCAL
ENV NODE_ENV='development'


# Install Dependencies
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install tmux
RUN apt-get -y install bcrypt
RUN npm install pm2 -g
RUN npm install bower -g --allow-root
RUN npm install gulp -g --allow-root
RUN npm install grunt-cli -g --allow-root
RUN npm install gulp-rename -g --allow-root
RUN npm install gulp-clean -g --allow-root
RUN npm install gulp -g --allow-root
COPY package.json package.json


# Copy files
COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]


