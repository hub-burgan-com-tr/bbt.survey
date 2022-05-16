FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 80
RUN adduser -u 5678 --disabled-password --gecos "" surveyuser && chown -R surveyuser /usr/src/app
USER surveyuser
CMD ["npm", "start"]
