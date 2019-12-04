echo 
echo 
echo Welcome To EonSign!
echo Made By CaspD3V @iTweakOS

read -p "Enter .IPA Name: " input
echo $input.ipa

read -p "Enter Mobile Privision Name: " input1
echo $input1.mobileprovision

read -p "Enter Enterprise Cert Name: " input2
echo $input2.p12

IPA="$input".ipa
PROVISION="$input1".mobileprovision
CERTIFICATE="$input2".p12
unzip -q "$IPA"
rm -rf Payload/*.app/_CodeSignature
cp "$PROVISION" Payload/*.app/embedded.mobileprovision
/usr/bin/codesign -f -s "$CERTIFICATE" Payload/*.app
zip -qr signed-"$input".ipa Payload