// See https://panopticlick.eff.org/

// Anti-tracking protection
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
// Disable geolocation
user_pref("geo.enabled", false);
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoip.url", "");
//Google tracking
// browser.safebrowsing.enabled ===> false
// browser.safebrowsing.malware.enabled ===> false
// browser.safebrowsing.downloads.enabled ===> false
// browser.safebrowsing.downloads.remote.enabled ===> false
// Bloatware
user_pref("social.remote-install.enabled", false);
user_pref("social.toast-notifications.enabled", false);
user_pref("social.whitelist", "");
user_pref("social.directories", "");
user_pref("social.shareDirectory", "");
user_pref("browser.aboutHomeSnippets.updateUrl", "");
