. config
msgTg=$(echo -e "<b>[ INFO ]</b> Telegram bot authorized ! ")
tgTest=$(curl -s -X POST https://api.telegram.org/bot${tgApiQn}/sendMessage -d chat_id=${tgIdQn} -d text="${msgTg}" -d parse_mode="HTML" | grep 'error_code') 
tgTest=$(echo ${tgTest})
if [ -n "${tgTest}" ];
then
echo -e "[ ERROR ] Unauthorized !\nPlease recheck your API and CHAT ID and make sure you starting your bot"

tgTest=$(curl -s -X POST https://api.telegram.org/bot${tgApiQn}/sendMessage -d chat_id=${tgIdQn} -d text="${msgTg}" -d parse_mode="HTML" | grep 'error_code')
tgTest=$(echo ${tgTest})
else

brnUrl="https://brn.explorer.caldera.xyz//api?module=account&action=balance&address=${address}"
arbtUrl="https://arbitrum-sepolia.blockscout.com//api?module=account&action=balance&address=${address}"
blssUrl="https://blast-testnet.blockscout.com//api?module=account&action=balance&address=${address}"
bsspUrl="https://base-sepolia.blockscout.com//api?module=account&action=balance&address=${address}"
opspUrl="https://optimism-sepolia.blockscout.com//api?module=account&action=balance&address=${address}"

brnUrlEx="https://brn.explorer.caldera.xyz/address/${address}"
arbtUrlEx="https://arbitrum-sepolia.blockscout.com/address/${address}"
blssUrlEx="https://blast-testnet.blockscout.com/address/${address}"
bsspUrlEx="https://base-sepolia.blockscout.com/address/${address}"
opspUrlEx="https://optimism-sepolia.blockscout.com/address/${address}"

mega=$( echo 10/10^19 | bc -l );


function brnFetch(){
brnBal=$( curl $brnUrl 2>/dev/null | jq -r .result );
brnBal=$( bc <<<  "$brnBal * $mega" );
brnBalRound=$( echo $brnBal | sed "s/\..*//g"  );
brnBalFloat=$( echo $brnBal | sed "s/.*[.]//g");
brnBalFloat=$( echo ${brnBalFloat:0:2} );
brnBal=$( echo "$brnBalRound.$brnBalFloat" );

}
function secBrnFetch(){
cekBrnBal=$( curl $brnUrl 2>/dev/null | jq -r .result );
cekBrnBal=$( bc <<<  "$cekBrnBal * $mega" );
cekBrnBalRound=$( echo $cekBrnBal | sed "s/\..*//g"  );
cekBrnBalFloat=$( echo $cekBrnBal | sed "s/.*[.]//g");
cekBrnBalFloat=$( echo ${cekBrnBalFloat:0:2} );
cekBrnBal=$( echo "$cekBrnBalRound.$cekBrnBalFloat" );

}
function arbtFetch(){
arbtBal=$( curl $arbtUrl 2>/dev/null | jq -r .result );
arbtBal=$( bc <<<  "$arbtBal * $mega" );
arbtBalRound=$( echo $arbtBal | sed "s/\..*//g"  );
arbtBalFloat=$( echo $arbtBal | sed "s/.*[.]//g");
arbtBalFloat=$( echo ${arbtBalFloat:0:2} );
arbtBal=$( echo "$arbtBalRound.$arbtBalFloat" );

}
function secArbtFetch(){
cekArbtBal=$( curl $arbtUrl 2>/dev/null | jq -r .result );
cekArbtBal=$( bc <<<  "$cekArbtBal * $mega" );
cekArbtBalRound=$( echo $cekArbtBal | sed "s/\..*//g"  );
cekArbtBalFloat=$( echo $cekArbtBal | sed "s/.*[.]//g");
cekArbtBalFloat=$( echo ${cekArbtBalFloat:0:2} );
cekArbtBal=$( echo "$cekArbtBalRound.$cekArbtBalFloat" );
}
function blssFetch(){
blssBal=$( curl $blssUrl 2>/dev/null | jq -r .result );
blssBal=$( bc <<<  "$blssBal * $mega" );
blssBalRound=$( echo $blssBal | sed "s/\..*//g"  );
blssBalFloat=$( echo $blssBal | sed "s/.*[.]//g");
blssBalFloat=$( echo ${blssBalFloat:0:2} );
blssBal=$( echo "$blssBalRound.$blssBalFloat" );

}
function secBlssFetch(){
cekBlssBal=$( curl $blssUrl 2>/dev/null | jq -r .result );
cekBlssBal=$( bc <<<  "$cekBlssBal * $mega" );
cekBlssBalRound=$( echo $cekBlssBal | sed "s/\..*//g"  );
cekBlssBalFloat=$( echo $cekBlssBal | sed "s/.*[.]//g");
cekBlssBalFloat=$( echo ${cekBlssBalFloat:0:2} );
cekBlssBal=$( echo "$cekBlssBalRound.$cekBlssBalFloat" );

}
function bsspFetch(){
bsspBal=$( curl $bsspUrl 2>/dev/null | jq -r .result );
bsspBal=$( bc <<<  "$bsspBal * $mega" );
bsspBalRound=$( echo $bsspBal | sed "s/\..*//g"  );
bsspBalFloat=$( echo $bsspBal | sed "s/.*[.]//g");
bsspBalFloat=$( echo ${bsspBalFloat:0:2} );
bsspBal=$( echo "$bsspBalRound.$bsspBalFloat" );

}
function secBsspFetch(){
cekBsspBal=$( curl $bsspUrl 2>/dev/null | jq -r .result );
cekBsspBal=$( bc <<<  "$cekBsspBal * $mega" );
cekBsspBalRound=$( echo $cekBsspBal | sed "s/\..*//g"  );
cekBsspBalFloat=$( echo $cekBsspBal | sed "s/.*[.]//g");
cekBsspBalFloat=$( echo ${cekBsspBalFloat:0:2} );
cekBsspBal=$( echo "$cekBsspBalRound.$cekBsspBalFloat" );

}
function opspFetch(){
opspBal=$( curl $opspUrl 2>/dev/null | jq -r .result );
opspBal=$( bc <<<  "$opspBal * $mega" );
opspBalRound=$( echo $opspBal | sed "s/\..*//g"  );
opspBalFloat=$( echo $opspBal | sed "s/.*[.]//g");
opspBalFloat=$( echo ${opspBalFloat:0:2} );
opspBal=$( echo "$opspBalRound.$opspBalFloat" );

}
function secOpspFetch(){
cekOpspBal=$( curl $opspUrl 2>/dev/null | jq -r .result );
cekOpspBal=$( bc <<<  "$cekOpspBal * $mega" );
cekOpspBalRound=$( echo $cekOpspBal | sed "s/\..*//g"  );
cekOpspBalFloat=$( echo $cekOpspBal | sed "s/.*[.]//g");
cekOpspBalFloat=$( echo ${cekOpspBalFloat:0:2} );
cekOpspBal=$( echo "$cekOpspBalRound.$cekOpspBalFloat" );

}
function recap(){
while sleep 2;
do
echo "[INFO] Recap jobs is running ✅"
brnFetch;
arbtFetch;
blssFetch;
bsspFetch;
opspFetch;
totalFirstEth=$( bc <<< "${arbtBal} + ${blssBal} + ${bsspBal} + ${opspBal}" );
echo "[INFO] your total ETH balance is ${totalFirstEth} ETH"
brnFirstBal=${brnBal};
while sleep 3600;
do
secBrnFetch;
secArbtFetch;
secBlssFetch;
secBsspFetch;
secOpspFetch;
arbtPoint=$( bc <<< "${cekArbtBalRound} - ${arbtBalRound}" );
if [ ${arbtPoint%.*} -gt 0 ];
then
arbtPoint=$( echo -e "_\\\(\\\-${arbtPoint}\\\)_" | sed "s/\./\\\./g" );
echo $arbtPoint
else
arbtPoint=""
fi

blssPoint=$( bc <<< "${cekBlssBalRound} - ${blssBalRound}" );
if [ ${blssPoint%.*} -gt 0 ];
then
blssPoint=$( echo "_\\\(\\\-${blssPoint}\\\)_" | sed "s/\./\\\./g" );
else
blssPoint=""
fi

bsspPoint=$( bc <<< "${cekBsspBalRound} - ${bsspBalRound}" );
if [ ${bsspPoint%.*} -gt 0 ];
then
bsspPoint=$( echo "_\\\(\\\-${bsspPoint}\\\)_" | sed "s/\./\\\./g" );
else
bsspPoint=""
fi

opspPoint=$( bc <<< "${cekOpspBalRound} - ${opspBalRound}" );
if [ ${opspPoint%.*} -gt 0 ];
then
opspPoint=$( echo "_\\\(\\\-${opspPoint}\\\)_" | sed "s/\./\\\./g" );
else
opspPoint=""
fi

ipAddr=$( curl -w '\n' ifconfig.me | sed "s/\./\\\./g" );
status=$( ps aux | grep -c executor );

if [ $status -gt 1 ];
then
status="Active \\\| Running"
else
status="Inactive"
fi

totalEth=$( bc <<< "${cekArbtBal} + ${cekBlssBal} + ${cekBsspBal} + ${cekOpspBal}" );
ethPoint=$( bc <<< "${totalFirstEth} - ${totalEth}" )
#ethPoint=$( echo $ethPoint | sed "s/\..*//g" );
if [ ${ethPoint%.*} -gt 0 ];
then
ethPoint=$( echo "_\\\(\\\-${ethPoint}\\\)_" | sed "s/\./\\\./g" );
else
ethPoint=""
fi

brnPoint=$( bc <<< "${cekBrnBal} - ${brnFirstBal}" )
#brnPoint=$( echo  $brnPoint | sed "s/\..*//g" )
if [ ${brnPoint%.*} -gt 0 ];
then
brnPoint=$( echo "_\\\(\%2B ${brnPoint}\\\)_" | sed "s/\./\\\./g" );
else
brnPoint=""
fi
totalEth=$( echo $totalEth |  sed "s/\./\\\./g" );
cekBrnBal=$( echo $cekBrnBal | sed "s/\./\\\./g" );
cekArbtBal=$( echo $cekArbtBal | sed "s/\./\\\./g" );
cekBlssBal=$( echo $cekBlssBal | sed "s/\./\\\./g" );
cekBsspBal=$( echo $cekBsspBal | sed "s/\./\\\./g" );
cekOpspBal=$( echo $cekOpspBal | sed "s/\./\\\./g" );

recapMsg=$( echo -e " \
  ℹ️  Executor Hourly Recap   ℹ️    \n \
\n \
▫️IP address : \`${ipAddr}\` \n \
▫️Status : ${status} \n \
▫️EVM address : \`${address}\`\n \
▫️arbt ETH balance : [${cekArbtBal} ETH]($arbtUrlEx) ${arbtPoint} \n \
▫️blss ETH balance : [${cekBlssBal} ETH]($blssUrlEx) ${blssPoint} \n \
▫️bssp ETH balance : [${cekBsspBal} ETH]($bsspUrlEx) ${bsspPoint} \n \
▫️opsp ETH balance : [${cekOpspBal} ETH]($opspUrlEx) ${opspPoint} \n \
▫️Total ETH balance : ${totalEth} ETH ${ethPoint} \n \
▫️l1rn BRN balance : [$cekBrnBal BRN]($brnUrlEx) ${brnPoint} \n \

Creator : [Mr9868 ☕](https://www\.github\.com/mr9868)" );


echo -e '\n[INFO] Sending telegram message ... ⏳';
echo -e '[INFO] Message output details : \n';
echo -e "<=()=======================( BEGIN )=====================()=>\n"
curl -s -X POST https://api.telegram.org/bot${tgApiQn}/sendMessage -d chat_id=${tgIdQn} -d text="${recapMsg}" -d parse_mode='MarkdownV2' | jq -r 
echo;
echo -e "<=()========================( END )======================()=>\n"
echo -e '[INFO] Telegram message sent ! ✅';

done
done
}


function mainProcess(){
brnFetch;
brnBal=$( echo $brnBal | sed "s/\./\\\./g");
msgTg=$( echo -e "Your base point is _${brnBal}_");
echo -e '[INFO] Sending telegram message ... ⏳';
echo -e '[INFO] Message output details : \n';
echo -e "<=()=======================( BEGIN )=====================()=>\n"
curl -s -X POST https://api.telegram.org/bot${tgApiQn}/sendMessage -d chat_id=${tgIdQn} -d text="${msgTg}" -d parse_mode='MarkdownV2' | jq -r
echo;
echo -e "<=()========================( END )======================()=>\n"
echo -e '[INFO] Telegram message sent ! ✅';

while sleep 5;
do
brnFetch;
secBrnFetch;
until [ $cekBrnBalRound -gt $brnBalRound ]; 
do
echo -e "The current balance is $cekBrnBal, Nothing change ...";
echo "Sleep for 2 minutes ...";
sleep 120;
secBrnFetch;
done
points=$((cekBrnBalRound-brnBalRound));
cekBrnBal=$( echo $crkBrnBal | sed "s/\./\\\./g" );
echo -e "[INFO] The balance has increased by $points\nYour total balance is $cekBrnBal"
msgTg=$( echo -e "[INFO] The balance has increased by $points\nYour total balance is $cekBrnBalRound\.$cekBrnBalFloat");
echo -e '[INFO] Sending telegram message ... ⏳';
echo -e '[INFO] Message output details : \n';
echo -e "<=()=======================( BEGIN )=====================()=>\n"
curl -s -X POST https://api.telegram.org/bot${tgApiQn}/sendMessage -d chat_id=${tgIdQn} -d text="${msgTg}" -d parse_mode='MarkdownV2' | jq -r
echo;
echo -e "<=()========================( END )======================()=>\n"
echo -e '[INFO] Telegram message sent ! ✅';
done

}

mainProcess & recap
fi;


}

mainProcess & recap
fi;
