FROM node:22

WORKDIR /app

COPY . . 

RUN  npm install
RUN  npm run build
RUN  npx prisma generate

EXPOSE 3000


# all the commands above will run when u create the image and the below command run that container
CMD [ "node","dist/index.js" ]