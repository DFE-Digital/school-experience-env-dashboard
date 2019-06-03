# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

The Ruby version mandated is 2.5.5

* Build
  
    docker build  -t environment-dashboard:latest .  

* Local Deployment

    export DATABASE_URL='postgres://postgres:secret@postgres/environment_dashboard'
    docker run --name=postgres -e POSTGRES_PASSWORD -d postgres:11-alpine
    docker run --rm --link postgres:postgres -e DATABASE_URL -e RAILS_ENV=test environment-dashboard:latest rake db:create db:migrate

    docker run --rm --link postgres:postgres -e DATABASE_URL environment-dashboard:latest rake environment:update[Dev,,,,,]
    docker run --rm --link postgres:postgres -e DATABASE_URL environment-dashboard:latest rake environment:update[Staging,,,,,]
    docker run --rm --link postgres:postgres -e DATABASE_URL environment-dashboard:latest rake environment:update[Research,,,,,]
    docker run --rm --link postgres:postgres -e DATABASE_URL environment-dashboard:latest rake environment:update[Prod,,,,,]

    docker run --rm --link postgres:postgres -e DATABASE_URL -e WEB_HOOK_KEY=123456789 -e SECURE_USERNAME=environments -e SECURE_PASSWORD=dashboard -p 3000:3000 environment-dashboard:latest

* Testing

    Create a file data.json with contents

    { "web_hook_key" : "123456789", "environment": {"id":1,"name":"Dev","version":"v100","git_hub_release":"https://release","url":"https://environmentsdashboard2.azurewebsites.net/environments/1.json","db_url":"asdasd","db_user":"asdppeppeppep","created_at":"2019-05-31T12:26:28.203Z","updated_at":"2019-05-31T12:26:28.203Z"}}

    Then to invoke the web hook

    curl -f -X PATCH http://environments:dashboard@localhost:3000/environmentsByName.json -d @data.json --header "Content-Type: application/json"    
