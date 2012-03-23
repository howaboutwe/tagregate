namespace :cucumber do
  namespace :tagregate do
    Cucumber::Rake::Task.new(:count, "List the count of all tags") do |t|
      tags = ENV["TAGS"].present? ? "--tags #{ENV["TAGS"]}" : ""
      path = File.join(File.dirname(__FILE__), "..", "tagregate", "count")

      t.cucumber_opts = "--dry-run features -r #{path} --format Tagregate::Count #{tags}"
    end
  end
end
