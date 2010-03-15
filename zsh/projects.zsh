function wk {
  cdproject $1
  current_working_project

  if [[ -s ~/tmp/rails.pid ]] {
    echo "Killing already running rails process..."
    kill -2 `cat ~/tmp/rails.pid`
  }

  {
    script/server >/dev/null 2>&1 &
    local pid=$!
    echo $pid > ~/tmp/rails.pid
    tail -n 0 -f log/development.log
  } always {
    kill -0 $pid
    if [[ $? -eq 0 ]] {
      kill -2 $pid 
      rm ~/tmp/rails.pid
    }
  }
}

compctl -W "$HOME/projects" -g '*(-/)' wk
