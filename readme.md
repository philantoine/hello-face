### How to create a facebook token

http://developers.facebook.com/tools/explorer/

bundle exec heroku config:add OAUTH_ACCESS_TOKEN=AAACEdEose0cBAEIZCkDuvslxMGg56NP7wlLL8n7sUtXXNzuWQbDUAUhS4MPOxA7KTJrZCNDv0HMiiHZArrtsAVaDjZCXNJIwC5cjDRa2aDBQ6VRdkEcR

### How to deploy

open git bash prompt

git status
git add XXX
git status
git commit -m "message"
git push heroku master

### How to run locally

set OAUTH_ACCESS_TOKEN=xxx
ruby hello.rb

### How to save on github

git push origin master