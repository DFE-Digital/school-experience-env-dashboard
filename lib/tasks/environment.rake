require File.join(Rails.root, "app", "models", "application_record")
require File.join(Rails.root, "app", "models", "environment")

namespace :environment do
  desc "Provides a way for the pipeline to update the environments state"
  task :update, [:name, :version, :git_hub_release, :url, :db_url, :db_user] => :environment do |task, args|
    puts "work", args
    environment = Environment.find_or_create_by(name: args[:name])
    puts environment
#    environment.update(name: 'Dave')
    environment.update( 
      version: args[:version], 
      git_hub_release: args[:git_hub_release], 
      url: args[:url],
      db_url: args[:db_url],
      db_user: args[:db_user]
    )

  end

  desc "Provides a way for the pipeline to initialize an environment name"
  task :initialise, [:name] => :environment do |task, args|
    puts "work", args
    environment = Environment.find_or_create_by(name: args[:name])
    puts environment
  end
end
