#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
# wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/soffchen/GeoIP2-CN/release/CN-ip-cidr.txt
wget --no-check-certificate -c -O CNIP.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN address=$net comment=AS4809"
done

} > ../CNIP.rsc

cd ..
rm -rf ./pbr
