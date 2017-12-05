require 'erb'
require './lib/config.rb'
require './lib/detect_os.rb'

# Install a component
# *.nothing => Do nothing
# *.sh => Do nothing. These files are for system usage.
# *.run => Run custom install script
# *.smylink => file get's symlinked to $HOME
# *.zshrc => get source into system .zshrc file
def install_components(options = {})
  puts "Options: #{options}" if ENV['DEBUG']
  for component in components_list do
    puts "Installing component: #{component}"
    process_zshrc_files(component)
    process_script_files(component, options)
    process_symlink_files(component)
    process_erb_files(component)
  end
end

# Return [] of compents listed in config file to be installed
def components_list
  config["#{detect_os}"]
end

def process_zshrc_files(component)
  for file in zshrc_files(component) do
    file = file.sub("./","")
    addline = "source #{Dir.pwd}/#{file}\n"
    zshrc_file = "#{Dir.home}/.zshrc"
    dest_file = File.readlines(zshrc_file)
    if dest_file.grep(addline).any?
      puts "!!! #{file} already added to #{Dir.home}/.zshrc. Doing Nothing !!!"
    else
      # puts "Adding #{file} to #{Dir.home}/.zshrc"
      File.open(zshrc_file, 'a') { |file| file.write(addline) }
    end
  end
end

# A way to process general purpose scripts.
def process_script_files(component, options = {})
  for script in script_files(component) do
    puts "Running install script: #{script.split("/").last}"
    system(script, options.to_s)
  end
end

def process_symlink_files(component)
  for symlink in symlink_files(component) do    
    sourse_file = Dir.pwd + "/" + symlink.sub("./","")
    dest_file = ENV['HOME'] + "/." + symlink.split("/").pop.sub(".symlink", "")

    if File.exist?(dest_file)
      puts "!!! File: #{dest_file} exists. Doing nothing. !!!"
    else
      puts "Linking #{sourse_file} to #{dest_file}"
      File.symlink("#{sourse_file}","#{dest_file}")
    end
  end
end

def process_erb_files(component)
  for file in erb_files(component) do
    new_file_data = ERB.new(File.read(file)).result(binding)
    dest = "#{ENV['HOME']}/.#{file.split("/").last.sub(".erb","")}"

    if File.exist?(dest)
      puts "!!! File: #{dest} exists. Doing nothing. !!!"
    else
      puts "Writing file: #{dest}" if ENV['DEBUG']
      File.write(dest, new_file_data) unless File.exist?(dest)
    end
  end
end

# Return Array of erb files in component directory
def erb_files(component)
  Dir["./etc/#{component}/*.erb"]
end

# Return Array of zshrc files in component directory
def zshrc_files(component)
  Dir["./etc/#{component}/*.zshrc"]
end

# Return Array of symlink files in component directory
def symlink_files(component)
  Dir["./etc/#{component}/*.symlink"]
end

# Return Array of *.run files in component directory (Should only be one. However there is nothing stop there being more. )
def script_files(component)
  Dir["./etc/#{component}/install_#{component}.zsh"] +
  Dir["./etc/#{component}/install_#{component}*.rb"]
end
