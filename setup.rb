#!/usr/bin/env ruby

require "optparse"
require "fileutils"

opts = ARGV.getopts("", "os:")

os = opts["os"]

raise "Give --os option" unless os
raise unless Dir.exists?(os)

entries = %w[
  zshrc
  tmux.conf
  gitignore
  gitconfig
  vimrc
]

entries.each do |entry|
  source = File.join(Dir.pwd, os, entry)
  target = File.join(Dir.home, ".#{entry}")

  puts "create symlink: #{source} -> #{target}"

  FileUtils.ln_s(source, target, force: true)
end
