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

A.) Run this locally, with adminstrator privalges.  When script is run, user is unable to remove Ext or change associated seettings unless they edit the registries.  

Or....

B.)  Deploy the script through your Computer Management Software, for example in AirWAtch, this can be deployed with a product list that downloads and runs a file/action .ps1 script.  Per usual guidelines, consult your own software's guide and test thoroughly.  
