#!/usr/bin/env ruby
#
# This script is used to see what /applications match whats installed via brew cask.
# I used this file to move most of my installed apps to brew cask installs and then generated the brewfiles
# for the repo.
# TODO: Look for a way to have less false positives in matches.  
require 'fuzzy_match'

system("mkdir -p ./tmp")
brew_cask_file = "./tmp/brew_cask_installed.txt"
apps_installed_file = "./tmp/apps_installed.txt"

# Return's all apps not installed via Brew cask
def match_apps(brew_cask, apps)
  apps = File.readlines(apps).map { |e| e.strip.sub(".app","") }
  brewed = File.readlines(brew_cask).map { |e| e.strip.sub("-", " ")}

  matcher = FuzzyMatch.new(brewed, must_match_at_least_one_word: true) # Match on sub-set.

  puts [ 'Apps'.ljust(32), 'Brewed' ].join    # print a nice table header
  puts "*******************************************************"
  matcher = FuzzyMatch.new(brewed)   # set up a matcher object

  apps.each do |app|
    a = matcher.find_best(app)
    puts [ app.ljust(32), a ].join
  end

end

def generate_brew_cask_apps_list(brew_cask_file)
  system("rm #{brew_cask_file}")
  system("brew cask list > #{brew_cask_file}")
end

def generate_apps_installed_file(apps_installed_file)
  system("rm #{apps_installed_file}")
  system("ls /Applications > #{apps_installed_file}")
end

generate_brew_cask_apps_list(brew_cask_file)
generate_apps_installed_file(apps_installed_file)
match_apps(brew_cask_file, apps_installed_file)
