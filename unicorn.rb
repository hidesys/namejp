@dir = "#{Dir.pwd}/"

worker_processes 2 # CPUのコア数に揃える
working_directory @dir

timeout 300
#listen 3000
listen "#{@dir}tmp/sockets/unicorn.sock"

pid "#{@dir}tmp/pids/unicorn.pid" #pidを保存するファイル

# unicornは標準出力には何も吐かないのでログ出力を忘れずに
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"

