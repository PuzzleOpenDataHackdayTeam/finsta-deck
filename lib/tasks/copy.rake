desc 'copy relavant files  empty rails project'
task :copy do
  destination = Pathname.new('/tmp/finsta')

  sh "cp -rv #{Rails.root.join('app','models')} #{destination.join('app')}"
  sh "cp -rv #{Rails.root.join('app','jobs')} #{destination.join('app')}"

  sh "cp -rv #{Rails.root.join('lib','tasks')} #{destination.join('lib')}"

  sh "cp -rv #{Rails.root.join('db','csv')} #{destination.join('db')}"
  sh "cp -rv #{Rails.root.join('db','migrate')} #{destination.join('db')}"
  
  sh "cp -rv #{Rails.root.join('spec')} #{destination.join('spec')}"
  sh "cp -rv #{Rails.root.join('Gemfile')} #{destination}"
end
