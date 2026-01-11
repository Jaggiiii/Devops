FROM node:22

WORKDIR /app

COPY package* .
COPY ./prisma .

# very expensive step is npm install
RUN  npm install   
RUN  npx prisma generate

COPY . . 

RUN  npm run build

EXPOSE 3000


# all the commands above will run when u create the image and the below command run that container
CMD [ "node","dist/index.js" ]