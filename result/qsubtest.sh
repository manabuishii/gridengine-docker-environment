qsub -j y -o /tmp/result/echo.log -wd /tmp/result /tmp/result/echo.sh
qsub -j y -o /tmp/result/dockertest.log -wd /tmp/result /tmp/result/dockertest.sh
sleep 10
RET=0
grep "vagrant@exec" /tmp/result/echo.log
RET=$((${RET}+$?))
echo "RET[${RET}] echo"
grep "Hello from Docker" /tmp/result/dockertest.log
RET=$((${RET}+$?))
echo "RET[${RET}] docker"
exit ${RET}
