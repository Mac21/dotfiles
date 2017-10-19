#!/usr/bin/env ruby

git_bundles = [
  # Start Vim - Completion / FS plugins.
  #"https://github.com/ervandew/supertab.git",
  #"https://github.com/godlygeek/tabular.git",
  "https://github.com/vim-syntastic/syntastic.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/majutsushi/tagbar",
  #"https://github.com/tomtom/vim-tcomment.git",
  #"https://github.com/xolox/vim-easytags",
  #"https://github.com/alvan/vim-closetag",
  "https://github.com/shougo/deoplete.nvim",
  "https://github.com/davidhalter/jedi",
  "https://github.com/zchee/deoplete-jedi",
  # End Vim - Completion plugins.

  # Start Vim - C++ plugins.
  "https://github.com/zchee/deoplete-clang",
  "https://github.com/shougo/neoinclude.vim",
  "https://github.com/neomake/neomake",
  # End Vim - C++ plugins.

  # Start Vim - Go plugins.
  "https://github.com/fatih/vim-go",
  "https://github.com/zchee/deoplete-go",
  # End Vim - Go plugins.

  # Start Vim - Python plugins.
  "https://github.com/python-mode/python-mode",
  # End Vim - Python plugins.

  # Start Vim - Ruby plugins.
  #"https://github.com/hallison/vim-rdoc.git",
  #"https://github.com/tpope/vim-cucumber.git",
  #"https://github.com/astashov/vim-ruby-debugger.git",
  #"https://github.com/tpope/vim-rails.git",
  #"https://github.com/vim-ruby/vim-ruby.git",
  "https://github.com/fishbullet/deoplete-ruby.git",
  # End Vim - Ruby plugins.

  # Start Vim - Syntax Highlighting plugins.
  "https://github.com/tpope/vim-markdown.git",
  "https://github.com/tmux-plugins/vim-tmux.git",
  "https://github.com/chrisbra/Colorizer.git",
  # End Vim - Syntax Highlighting plugins.

  # Start Vim - git plugins.
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-git.git",
  "https://github.com/airblade/vim-gitgutter.git",
  # End Vim - git plugins.

  # Start Vim - Vim builtin wrappers plugins.
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/mbbill/undotree.git",
  # End Vim - Vim builtin wrappers plugins.

  # Start Vim - Vim interface plugins.
  "https://github.com/vim-airline/vim-airline",
  "https://github.com/vim-airline/vim-airline-themes",
  "https://github.com/xolox/vim-misc",
  # End Vim - Vim interface plugins.

  # Start Vim - saltstack plugins.
  "https://github.com/saltstack/salt-vim",
  # End Vim - saltstack plugins.
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")
if Dir.exist?(bundles_dir)
  FileUtils.cd(bundles_dir)
else
  Dir.mkdir(bundles_dir, 0755)
  FileUtils.cd(bundles_dir)
end

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "\n###### Installing #{url} into #{dir} ######"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
  puts "###### Installed #{dir} ######\n"
end
