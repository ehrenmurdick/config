namespace :install do
  desc "install everything"
  task :all => ["install:vim", "install:zsh", "install:irb"]

  desc "install vim config"
  task :vim do
    install("vim", "vimrc")
  end

  desc "install irb stuffs"
  task :irb do
    install("irbrc")
  end

  desc "install zshrc"
  task :zsh do
    install("zshrc", "zsh")
  end
end

def install(*files)
  files.each do |src|
    dest = "#{ENV["HOME"]}/.#{src}"
    rm_rf dest

    ln_s "#{File.expand_path(".")}/#{src}", dest
  end
end
