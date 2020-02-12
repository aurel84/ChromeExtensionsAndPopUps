### SETTING UP THE SCRIPT ####

1.) Open ChromeExtensionsAndPopUPs.ps1 using a text or code editor

2.) Locate the PSCustomObject for ChromeExtensionForceInstall, which starts on line 23:
- Replace "PutYourExtensionIDGoesHere" with a Extension ID from your preferred Ext at the Chrome Web Store.  Leave it inside the quotations.
- If Needing to add additional Extensions, do so starting on line 23, in the same Quoted area.  If not, close the PSCustomObject with a ';' delete any lines that you dont' need.

3.) Locate the PSCustomObject for ChromeExtensionBlackList, which starts on line 32:
- Replace "PutYourExtensionIDGoesHere" with a Extension ID from your preferred Ext at the Chrome Web Store.  Leave it inside the quotations.
- If Needing to add additional Extensions, do so starting on line 33, in the same Quoted area.  If not, close the PSCustomObject with a ';' delete any lines that you dont' need.

4.) Locate the PSCustomObject for ChromeExtensionBlackList, which starts on line 40:
- Replace "PutYourAddressHere.com" with address inside the quotations.  Leave out the 'www.', 'http://', 'http:' from the address (i.e. it should look like "example.com")
- If Needing to add additional Extensions, do so starting on line 41, in the same Quoted area.  If not, close the PSCustomObject with a ';' delete any lines that you dont' need.

### DEPLOYING THE SCRIPT ###

