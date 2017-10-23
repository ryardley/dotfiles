# This file will uninstll all of your Homebrew packages.
# Used during the creation of this project.

brewfile = "brewfiles.txt"

system("brew list > #{brewfile}")

File.open("#{brewfile}","r") do |f|
  f.each_line do |line|
    print "Uninstalling #{line}"
    system("brew uninstall --ignore-dependencies #{line}")
  end
end
