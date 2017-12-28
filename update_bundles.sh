#!/usr/bin/env ruby

git_bundles = [
  # Start Vim - Snippets
  #"https://github.com/SirVer/ultisnips",
  #"https://github.com/honza/vim-snippets",
  # End Vim - Snippets

  # Start Vim - Syntax
  "https://github.com/sheerun/vim-polyglot",
  # End Vim - Syntax

  # Start Vim - Completion / FS plugins.
  "https://github.com/vim-syntastic/syntastic.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/scrooloose/nerdcommenter.git",
  "https://github.com/majutsushi/tagbar",
  "https://github.com/shougo/deoplete.nvim",
  "https://github.com/shougo/vimproc.vim",
  "https://github.com/shougo/unite.vim",
  "https://github.com/davidhalter/jedi",
  "https://github.com/zchee/deoplete-jedi",
  # End Vim - Completion / FS plugins.

  # Start Vim - C++ plugins.
  "https://github.com/zchee/deoplete-clang",
  "https://github.com/shougo/neoinclude.vim",
  "https://github.com/neomake/neomake",
  # End Vim - C++ plugins.

  # Start Vim - Go plugins.
  "https://github.com/fatih/vim-go",
  "https://github.com/zchee/deoplete-go",
  # End Vim - Go plugins.

  # Start Vim - HTML plugins.
  "https://github.com/alvan/vim-closetag",
  "https://github.com/othree/html5.vim",
  # End Vim - HTML plugins.

  # Start Vim - Javascript plugins.
  "https://github.com/carlitux/deoplete-ternjs",
  "https://github.com/othree/jspc.vim",
  # End Vim - Javascript plugins.

  # Start Vim - Docker plugins.
  "https://github.com/zchee/deoplete-docker",
  # End Vim - Docker plugins.

  # Start Vim - Dlang plugins.
  "https://github.com/landaire/deoplete-d",
  # End Vim - Dlang plugins.

  # Start Vim - Python plugins.
  "https://github.com/python-mode/python-mode",
  # End Vim - Python plugins.

  # Start Vim - Ruby plugins.
  #"https://github.com/tpope/vim-rails.git",
  #"https://github.com/vim-ruby/vim-ruby.git",
  "https://github.com/fishbullet/deoplete-ruby.git",
  # End Vim - Ruby plugins.

  # Start Vim - Syntax Highlighting plugins.
  "https://github.com/tpope/vim-markdown.git",
  #"https://github.com/tmux-plugins/vim-tmux.git",
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

# Vim.org scripts.
# IndexedSearch shows a count of items that match various search operations.
vim_org_scripts = [
  ["IndexedSearch", "7062", "plugin"],
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

vim_org_scripts.each do |name, script_id, script_type|
  puts "\n###### Downloading vim.org #{script_type} - #{name} ######"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
