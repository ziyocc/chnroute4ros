#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://cdn.jsdelivr.net/gh/misakaio/chnroutes2@master/chnroutes.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN address=$net comment=AS4809"
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
