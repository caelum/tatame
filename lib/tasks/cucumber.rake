$:.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib')

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format pretty"
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/}
    t.rcov_opts << %[-o "features_rcov"]
  end
  task :features => 'db:test:prepare'
rescue LoadError
  desc 'Cucumber rake task not available. Be sure to install cucumber as a gem or plugin'
  task :features do
    abort 'Cucumber rake task not available. Be sure to install cucumber as a gem or plugin'
  end
end
