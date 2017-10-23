require 'rake'
Dir["./lib/*.rb"].each {|file| require file }
os = detect_os

# Order of operations for installing a fresh osx machine
#
# 0. Install xcode & command line tools?
# 1. Install Homebrew
# 2. Setup zsh shell environment
# 3. Setup Git
# 4. Setup Ruby, python, nvm, node, yarn
#
desc "Bootstrap a fresh system install"
task :bootstrap do
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

#
desc "Update"
task :update do
  update_components
end

desc "Uninstall all"
task :uninstall do
  uninstall_components
end
