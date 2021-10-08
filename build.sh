#!/bin/bash
pushd front
yarn build
popd

pushd back
npm run build
popd

git add .
git commit -m "update files"
git push