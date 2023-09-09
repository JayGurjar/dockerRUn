
# pull base image
FROM reactnativecommunity/react-native-android:6.0

# Adds user and group node
RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=development
ENV NODE_ENV $NODE_ENV

# default to port 19006 for node, and 19001 and 19002 (tests) for debug
ARG PORT=5037
ENV PORT $PORT

# install global packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global    
ENV PATH /home/node/.npm-global/bin:$PATH

# due to default /opt permissions we have to create the dir with root and change perms
# !!! change dockeRUn to your project name
RUN mkdir /dockeRUn && chown node:node /dockeRUn
WORKDIR /dockerRUn
ENV PATH /dockeRUn/node_modules/.bin:$PATH

USER node
RUN npm install