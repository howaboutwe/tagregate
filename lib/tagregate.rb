require 'cucumber/rake/task'
Dir["/tagregate/*.rb"].each { |file| require file }

def load_rake_tasks
  Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each do |f|
    load f
  end
end

if defined?(Rails)
  class TagregateTasks < Rails::Railtie
    rake_tasks do
      load_rake_tasks
    end
  end
else
  raise "Sorry, tagregate currently only works with Ruby on Rails applications."
end
