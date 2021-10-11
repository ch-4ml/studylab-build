#!/bin/bash
pushd ../front
yarn build
popd

pushd ../back
npm run build
sleep 3
popd

git add .
git commit -m "update files"
git push