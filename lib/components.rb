require './lib/config.rb'
require './lib/detect_os.rb'

# Run once off installers for all components listed in the config file
def install_components

  for component in components_list do
    install_component(component)
  end
end

# Return [] of compents listed in config file to be installed
def components_list
  config["#{detect_os}"]
end

# Install a component
# *.nothing => Do nothing
# *.sh => Do nothing. These files are for system usage.
# *.run => Run custom install script
# *.smylink => file get's symlinked to $HOME
# *.zshrc => get source into system .zshrc file
def install_component(component)
  puts "Installing component: #{component}"
  process_zshrc_files(component)
  process_script_files(component)
  process_symlink_file(component)
end

def process_zshrc_files(component)
  # puts "No zshrc files to process" if zshrc_files(component).empty?
  for file in zshrc_files(component) do
    add_zshrc_files_to_sys_zshrc(file)
  end
end

# A way to process general purpose scripts.
def process_script_files(component)
  # puts "No install scripts to run" if script_files(component).empty?
  for script in script_files(component) do
    run_script(script)
  end
end

def process_symlink_file(component)
  # puts "No symlink files to link" if symlink_files(component).empty?
  for symlink in symlink_files(component) do
    symlink_file(symlink)
  end
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
  Dir["./etc/#{component}/*.run"]
end

# Execute script (*.run, *.rb, *.py, *.sh)
def run_script(script)
  puts "Running custom install script: #{script}"
  system(script)
end

# Symlink files to home directory
def symlink_file(symlink)
  puts "Symlinking: #{symlink}"
  pwd = Dir.pwd
  sourse_file = symlink.sub("./","")
  dest_file = symlink.split("/").pop.sub(".symlink", "")
  cmd = "gln -srf #{pwd}/#{sourse_file} ~/.#{dest_file}"
  system(cmd)
end

def add_zshrc_files_to_sys_zshrc(file)
  puts "Adding #{file} to #{Dir.home}/.zshrc"
  file = file.sub("./","")
  addline = "source #{Dir.pwd}/#{file}\n"
  zshrc_file = "#{Dir.home}/.zshrc"
  dest_file = File.readlines(zshrc_file)
  File.open(zshrc_file, 'a') { |file| file.write(addline) } unless dest_file.grep(addline).any?
end
