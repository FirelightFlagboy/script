ps -W | grep -i $1 | awk '{print $1}' | while read line; do echo $line | xargs kill -f; done;
