user_pref("dom.webnotifications.enabled", false); // disable notifications prompt
user_pref("signon.rememberSignons", false);
user_pref("browser.startup.page", 3); // restore previous session

// Privacy tweaks
user_pref("dom.battery.enabled", false);
user_pref("media.peerconnection.enabled", false);

// disable Pocket
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("extensions.pocket.enabled", false);
