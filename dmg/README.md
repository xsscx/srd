## For Apple Security Research Device Holders Only

# Example DMG for a Sample Cryptex with Toybox Unstripped for Debugging the SRD Command Line Terminal

-----------
This is a sample cryptex with various files included as examples.

Some of the code is compiled to Crash.

Some of the Code works.

IF you need help.. Connect on Slack at srdcx.slack.com

Open an Issue

@h02332 on twitter

-------------
How do it work?
If you have read the Makesfile and Documentation thenyou can download the dmg and put it in ../example-cryptex/ and use it. I'll Post a How-to here and on https://srd.cx with look at hand-rolling a cryptex, but, its very easy.. just look at the example in the Makefile.. this DMG has Toybox Unstripped for Debugging.. Its critical to have the Unstripped.. how can you see anything??? (cough).

So rip out the code and then start hand-rolling, or just wait for my CopyPasta Instructions... here is a sample..

This is where I'm dropping you at in the Build Pipeline:
created: /Users/dhoyt/srd/share/security-research-device/example-cryptex/com.example.cryptex.dmg

Now you have this DMG, lets walk thru the hand-roll and smoke out cryptex....

This is how the Makefile does it.. no magic.. follow along.. if you get it.. cool.. but if not, Open an Issue, ping me on Slack, hit me up on Twitter.. this is a critical hurdle to get over...

Next Steps:
```
cryptexctl uninstall com.example.cryptex 
```
```
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot/ com.example.cryptex.dmg  
```
```
...................................................
created: /Users/dhoyt/srd/share/security-research-device/example-cryptex/com.example.cryptex.dmg
```
```
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v H.O.Y.T com.example.cryptex.dmg
```
```
cryptexctl install com.example.cryptex.cptx 
```
```
cryptexctl list                            
com.example.cryptex
  version = H.O.Y.T
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.bAa5aS
```


---------
Do you want your Code loaded on an Example Cryptex for the SRD Cohort?

Open an Issue with a Link to your Code

Create a PR

Thanks!
