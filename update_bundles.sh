#!/usr/bin/env ruby

git_bundles = [
  # Start Vim - Completion / FS plugins.
  "https://github.com/ervandew/supertab.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/scrooloose/syntastic.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/majutsushi/tagbar",
  "https://github.com/tomtom/vim-tcomment.git",
  #"https://github.com/xolox/vim-easytags",
  "https://github.com/alvan/vim-closetag",
  "https://github.com/shougo/deoplete.nvim",
  "https://github.com/davidhalter/jedi",
  "https://github.com/zchee/deoplete-jedi",
  # End Vim - Completion plugins.

  # Start Vim - Go plugins.
  "https://github.com/fatih/vim-go",
  "https://github.com/zchee/deoplete-go",
  # End Vim - Go plugins.

  # Start Vim - Ruby plugins.
  #"https://github.com/hallison/vim-rdoc.git",
  #"https://github.com/tpope/vim-cucumber.git",
  #"https://github.com/astashov/vim-ruby-debugger.git",
  #"https://github.com/tpope/vim-rails.git",
  #"https://github.com/vim-ruby/vim-ruby.git",
  #"https://github.com/tsaleh/vim-shoulda.git",
  # End Vim - Ruby plugins.

  # Start Vim - Syntax Highlighting plugins.
  "https://github.com/pangloss/vim-javascript.git",
  "https://github.com/tsaleh/vim-matchit.git",
  "https://github.com/tpope/vim-markdown.git",
  "https://github.com/tmux-plugins/vim-tmux.git",
  # End Vim - Syntax Highlighting plugins.

  # Start Vim - git plugins.
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-git.git",
  "https://github.com/vim-scripts/Gist.vim.git",
  # End Vim - git plugins.

  # Start Vim - SASS/HAML/SCSS plugins.
  #"https://github.com/tpope/vim-haml.git",
  # End Vim - SASS/HAML/SCSS plugins.

  # Start Vim - Vim builtin wrappers plugins.
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-surround.git",
  # End Vim - Vim builtin wrappers plugins.

  # Start Vim - Vim interface plugins.
  "https://github.com/vim-airline/vim-airline",
  "https://github.com/xolox/vim-misc",
  # End Vim - Vim interface plugins.

  # Start Vim - Mac Only plugins.
  #"https://github.com/davidoc/taskpaper.vim.git",
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
