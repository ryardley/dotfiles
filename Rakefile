require 'rake'
Dir["./lib/*.rb"].each {|file| require file }
os = detect_os

desc "Install the dofiles magic"
task :install do
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
