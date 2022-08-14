# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

if Rake.application.top_level_tasks.grep(/^(default$|test(:|$))/).any?

  ENV["RAILS_ENV"] ||= if Rake.application.options.show_tasks
    "development"
  else
    "test"
  end

end
require_relative "config/application"

Rails.application.load_tasks
