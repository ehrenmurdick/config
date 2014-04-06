namespace :install do
  desc "install everything"
  task :all => ["install:git", "install:vim"]

  desc "install git config"
  task :git do
    install("gitconfig", "gitignore")
  end

  desc "install vim config"
  task :vim do
    install('vim', 'vimrc', 'gvimrc')
  end

  desc 'bash setup'
  task :bash do
    exec 'git clone https://github.com/revans/bash-it.git ~/.bash_it'
    exec '~/.bash_it/install.sh'
    install('bash_profile')
  end
end

def install(*files)
  files.each do |file|
    src = "#{File.expand_path(".")}/#{file}"
    dest = "#{ENV["HOME"]}/.#{file}"

    rm_rf dest
    ln_s src, dest
  end
end
