echo "editing namelist.wps"

cd /home/nma/work/bash_auto/


#cat test.wps | sed -i 's/tt/0/g' test.wps

wps = namelist.wps

tt=23
#read -p "Enter year:" year
#read -p "Enter Month" month
#read -p "Enter Date" date
#read -p "Enter start hour" hour
#read -p "enter minutes" mins
#read -p "enter seconds" sec

dom="$(cat test.wps |grep max_dom)"
dom1=`echo $dom | cut -d '=' -f 2`
echo $dom1

declare -i doms=$dom1
if [ $doms=0 ]
then
	echo "what the f**"
elif [ $doms=1 ]
then
	cat test.wps |sed -i "s:^ end_date.*$: end_date =\'${year}\-${month}\-${date}\_${hour}\:${mins}\:${sec}\'\,:g" test.wps
elif [ $doms=2 ]
then
	cat test.wps |sed -i "s:^ end_date.*$: end_date =\'${year}\-${month}\-${date}\_${hour}\:${mins}\:$#{sec}\'\,\\'${year}\-${month}\-${date}\_${hour}\:${mins}\:${sec}\'\, :g" test.wps
else
	echo "None"
elif [ $dom=3 ]
then
	cat test.wps |sed -i "s:^ end_date.*$: end_date =\'${year}\-${month}\-${date}\_${hour}\:${mins}\:$#{sec}\'\,\\'${year}\-${month}\-${date}\_${hour}\:${mins}\:${sec}\'\,\\'${year}\-${month}\-${date}\_${hour}\:${mins}\:${sec}\'\, :g" test.wps
fi
#elif [$dom == 2];then
#	cat test.wps |sed -i "s:^ end_date.*$: end_date =\'${year}\-${month}\-${date}\_${hour}\:${mins}\:$#{sec}\'\,\\'${year}\-${month}\-${date}\_${hour}\:${mins}\:${sec}\'\, :g" test.wps

#cat test.wps
