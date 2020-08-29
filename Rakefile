require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require_relative 'app'
  end
end

namespace :db do
  namespace :seed do
    tasks = []

    Dir.glob('db/seeds/*.rb').each do |filename|
      task_name = File.basename(filename, '.rb').intern
      tasks << task_name

      task task_name => :environment do
        return nil unless File.exist?(filename)

        puts "Loading seed #{filename}"
        load(filename)
      end
    end

    task all: tasks
  end
end
