#!/bin/bash
echo "" > /home/imam/cekserver/hasil.txt
echo "Status server saat ini:" >> /home/imam/cekserver/hasil.txt
tanggal= 'date' >> /home/imam/cekserver/hasil.txt
echo $tanggal >> /home/imam/cekserver/hasil.txt
while read hostname
do
ping -c 2 $hostname &> /dev/null
if [ $? -eq 0 ]
then
printf "%-17s %b %2s\n" "$hostname" "[HIDUP]" >> /home/imam/cekserver/hasil.txt
else
printf "%-17s %b %2s\n" "$hostname" "[MODAR]" >> /home/imam/cekserver/hasil.txt
fi
done < /home/imam/cekserver/host.txt
 
/usr/bin/sendemail -f email_pengirim@sampel.com -t email_penerima@sample.com -u "Subject email" -s mail.sample.com:587 -xu sample@sample.com -xp password_smtp -o message-file=/home/imam/cekserver/hasil.txt
