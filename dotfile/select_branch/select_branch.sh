function branch_show() {
	local index=$1
	local array=($(git for-each-ref --format="%(refname:short)" refs/heads))
	local cbranch=$(git symbolic-ref --short HEAD)
	for ((i = 0; i < ${#array[@]}; i++)); do
		[ ! $index ] && [ $cbranch = ${array[i]} ] && rindex=$i && rbranch=${array[i]} && echo -e "\033[31m${array[i]}\033[0m"
		[ ! $index ] && [ $cbranch != ${array[i]} ] && echo ${array[i]}
		[ $index ] && [ $i = $index ] && rindex=$i && rbranch=${array[i]} && echo -e "\033[31m${array[i]}\033[0m"
		[ $index ] && [ $i != $index ] && echo ${array[i]}
	done
}

cd /home/lewis/Public/WorkPro/ihr360-kpi
tput sc
branchShow
while true
do
	read -sn1 key1
	read -sn1 -t 0.01 key2
	read -sn1 -t 0.01 key3
	key=$key1$key2$key3
	[[ $key == $'\e[A' ]] && ((rindex--)) && tput rc && branch_show ${rindex} && echo "当前下标：$rindex"
	[[ $key == $'\e[B' ]] && ((rindex++)) && tput rc && branch_show ${rindex} && echo "当前下标：$rindex"
	[[ $key == "" ]] && echo "回车"
	[[ $key == $'\e' ]] && exit 1
done
