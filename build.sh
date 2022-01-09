#!/bin/bash

client=(3002 3001 3000)
server=(1116 1115 1114)
database=(studylab3 studylab2 studylab)

for idx in 0 1 2
do
  CLIENT_PORT=${client[${idx}]}
  SERVER_PORT=${server[${idx}]}
  DATABASE_NAME=${database[${idx}]}

  echo $CLIENT_PORT
  echo $SERVER_PORT
  echo $DATABASE_NAME

  pushd ../front

  cp .env.template .env.production
  API_SERVER_URI=localhost:${SERVER_PORT}
  sed -i "s/PARAM_API_SERVER_URI/${API_SERVER_URI}/g" .env.production

  yarn build
  popd

  pushd ../back

  cp .env.template .env.production
  MONGO_URI=mongodb+srv://studylab:1234@cluster0.pbv5i.mongodb.net/${DATABASE_NAME}?retryWrites=true&w=majority
  sed -i "s/PARAM_MONGO_URI/${MONGO_URI}/g" .env.production
  sed -i "s/PARAM_PORT/${SERVER_PORT}/g" .env.production

  npm run build
  popd

  cp start-template.bat start.bat
  cp stop-template.bat stop.bat

  sed -i "s/PARAM_CLIENT_PORT/${CLIENT_PORT}/g" start.bat
  sed -i "s/PARAM_SERVER_PORT/${SERVER_PORT}/g" start.bat
  sed -i "s/PARAM_SERVER_PORT/${SERVER_PORT}/g" stop.bat

  git add .
  git commit -m "update files"
  git push ${DATABASE_NAME} main
done