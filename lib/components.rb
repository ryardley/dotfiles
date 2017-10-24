require 'erb'
require './lib/config.rb'
require './lib/detect_os.rb'

# Install a component
# *.nothing => Do nothing
# *.sh => Do nothing. These files are for system usage.
# *.run => Run custom install script
# *.smylink => file get's symlinked to $HOME
# *.zshrc => get source into system .zshrc file
def install_components
  for component in components_list do
    puts "Installing component: #{component}"
    process_zshrc_files(component)
    process_script_files(component)
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
      puts "Adding #{file} to #{Dir.home}/.zshrc"
      File.open(zshrc_file, 'a') { |file| file.write(addline) }
    end
  end
end

# A way to process general purpose scripts.
def process_script_files(component)
  for script in script_files(component) do
    puts "Running custom install script: #{script}"
    system(script)
  end
end

def process_symlink_files(component)
  for symlink in symlink_files(component) do
    puts "Symlinking: #{symlink}"
    pwd = Dir.pwd
    sourse_file = symlink.sub("./","")
    dest_file = symlink.split("/").pop.sub(".symlink", "")
    cmd = "gln -srf #{pwd}/#{sourse_file} ~/.#{dest_file}"
    system(cmd)
  end
end

def process_erb_files(component)
  for file in erb_files(component) do
    file_data = ERB.new(File.read(file)).result(binding)
    dest = "#{ENV['HOME']}/.gitconfig"

    if File.exist?(dest)
      puts "File: #{dest} exists. Doing nothing. "
    else
      puts "Writing file: #{dest}"
      File.write(dest, file_data) unless File.exist?(dest)
    end
  end
end

def erb_files(component)
  Dir["./etc/#{component}/*.erb"]
end

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
