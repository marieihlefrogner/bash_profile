cd $(dirname $0)

for profile in ./*.profile
do
	source $profile
done
