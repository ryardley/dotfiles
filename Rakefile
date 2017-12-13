require 'rake'
Dir["./lib/*.rb"].each {|file| require file }
os = detect_os

desc "Default task to install dotfiles, Will ask question reguarding brewcask and brewmas app installations"
task :default do
  case os
  when :macosx
    puts "Running MacOSX Development system Bootstrap sequence..."
    install_components
  when :linux
    raise NotImplementedError, 'Not Implemented Sorry!'
  else
    print "Sorry not currently supported!"
  end
end

task :uninstall do
  system('rm -rf ~/.zshrc')
  system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"')
  system('sudo dscl . -create /Users/$USER UserShell `which bash`')
end


namespace :install do
  desc "Install all the dofiles magic, brewcask and brewmas will be installed without question"
  task :all do
    case os
    when :macosx
      puts "Running MacOSX Development system Bootstrap sequence..."
      install_components({brewmas: true, brewcask: true})
    when :linux
      raise NotImplementedError, 'Not Implemented Sorry!'
    else
      print "Sorry not currently supported!"
    end
  end

  desc "Install the dofiles magic with only shell setup. No Brewcask or Brewmas apps will be installed."
  task :shell do
    case os
    when :macosx
      puts "Running MacOSX Development system Bootstrap sequence..."
      install_components({brewmas: false, brewcask: false})
    when :linux
      raise NotImplementedError, 'Not Implemented Sorry!'
    else
      print "Sorry not currently supported!"
    end
  end
end
