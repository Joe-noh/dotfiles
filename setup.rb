#!/usr/bin/env ruby

require "optparse"
require "fileutils"

opts = ARGV.getopts("", "os:")

os = opts["os"]

raise "Give --os option" unless os
raise unless Dir.exists?(os)

os_specifics = %w[
  zshrc
].map{|e| File.join(Dir.pwd, os, e) }

commons =%w[
  tmux.conf
  gitignore
  gitconfig
  vimrc
].map{|e| File.join(Dir.pwd, "common", e) }

(os_specifics + commons).each do |source|
  target = File.join(Dir.home, "." + File.basename(source))

  puts "create symlink: #{source} -> #{target}"

  FileUtils.ln_s(source, target, force: true)
end
