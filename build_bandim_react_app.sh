cd $1
npm install
yarn build
rsync -av build/ ../webserver/build