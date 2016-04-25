#!/usr/bin/env ruby

git_bundles = [
  # Start Vim - Completion / FS plugins.
  "git://github.com/ervandew/supertab.git",
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/tomtom/vim-tcomment.git",
  #"git://github.com/xolox/vim-easytags",
  #"git://github.com/alvan/vim-closetag",
  # End Vim - Completion plugins.

  # Start Vim - Ruby plugins.
  #"git://github.com/hallison/vim-rdoc.git",
  #"git://github.com/tpope/vim-cucumber.git",
  #"git://github.com/astashov/vim-ruby-debugger.git",
  #"git://github.com/tpope/vim-rails.git",
  #"git://github.com/vim-ruby/vim-ruby.git",
  #"git://github.com/tsaleh/vim-shoulda.git",
  # End Vim - Ruby plugins.

  # Start Vim - Syntax Highlighting plugins.
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tmux-plugins/vim-tmux.git",
  # End Vim - Syntax Highlighting plugins.

  # Start Vim - git plugins.
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  # End Vim - git plugins.

  # Start Vim - SASS/HAML/SCSS plugins.
  #"git://github.com/tpope/vim-haml.git",
  # End Vim - SASS/HAML/SCSS plugins.

  # Start Vim - Vim builtin wrappers plugins.
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  # End Vim - Vim builtin wrappers plugins.

  # Start Vim - Vim interface plugins.
  "git://github.com/vim-airline/vim-airline",
  "git://github.com/xolox/vim-misc",
  # End Vim - Vim interface plugins.

  # Start Vim - Mac Only plugins.
  #"git://github.com/davidoc/taskpaper.vim.git",
  # End Vim - Mac Only plugins.
]

vim_org_scripts = [
  ["IndexedSearch", "7062",  "plugin"],
  ["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end












