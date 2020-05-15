cd ServerAgent
cmd3=`bash startAgent.sh 2>&1 >/dev/null &`
cd ..
cmd1=`java -jar logindemo-current.jar 2>&1 >/dev/null &`
echo $cmd1
echo $cmd2
echo $cmd3
