#!/usr/bin/env ruby
require "./lib/detect_os.rb"

def install
  install_homebrew if detect_os == :macosx
  install_brewfiles if detect_os == :macosx # Std brew apps
  install_brewcasks_apps if detect_os == :macosx # Brew cask
  install_brewmas_apps if detect_os == :macosx # brew mas apps (app store, i.e xcode)
end

def install_brewmas_apps
  print "Would you like to install mas apps (mac app store apps) (Y/n)?"
  results = gets
  return unless results.match(/y/i) or results == "\n"
  puts "Installing mas apps now..."
  system('brew tap homebrew/bundle')
  system("brew bundle -v --file=./etc/homebrew/Brewmas_macosx")
end

def install_brewcasks_apps
  print "Would you like to install gui/dev apps (Y/n)?"
  results = gets
  return unless results.match(/y/i) or results == "\n"
  puts "Installing BrewCask's now..."
  system('brew tap homebrew/bundle')
  system("brew bundle -v --file=./etc/homebrew/Brewcask_#{detect_os}")
end

def install_homebrew
  system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
end

def install_brewfiles
  puts "Installing BrewFile now..."
  system('brew tap homebrew/bundle')
  system("brew bundle -v --file=./etc/homebrew/BrewFile_#{detect_os}")
end

puts "Installing HomeBrew!!!!"
install
