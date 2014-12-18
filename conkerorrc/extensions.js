//Extensions
session_pref("xpinstall.whitelist.required", false);

interactive("viewmarks", "Open ViewMarks",
	    "find-url-new-buffer",
	    $browser_object = "chrome://viewmarks/content/viewmark.xul");

interactive("fireftp", "Open FireFTP",
	    "find-url-new-buffer",
	    $browser_object = "chrome://fireftp/content/fireftp.xul");


//adblockplus
//require("adblockplus");
