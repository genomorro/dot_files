// "${XDG_CONFIG_HOME}"/conkeror/user_agent.js : user-agent manipulation
// Thanks to retroj

require("user-agent-policy");

session_pref("general.useragent.compatMode.firefox", true);

user_agent_policy.define_policy("google",
    user_agent_firefox(),
    "images.google.com",
    build_url_regexp($domain = /(.*\.)?google/, $path = "images"),
    "plus.google.com");

var user_agents = {
    "conkeror": null,
    "chromium": "Mozilla/5.0 (X11; U; Linux x86_64; en-US) " +
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0" +
        " Safari/537.36.",
    "chrome": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64) " +
	"AppleWebKit/535.11 (KHTML, like Gecko) Chrome/53.0.2785.34" +
	" Safari/537.36",
    "firefox": user_agent_firefox(),
    "iphone": "Mozilla/5.0 (iPhone; U; CPU iPhone OS 9_3_1 like Mac OS X; " +
        "en-us) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 " +
        "Mobile/13E238 Safari/601.1",
    "android": "Mozilla/5.0 (Linux; Android 6.0.1; 404SC Build/MMB29K)" +
	"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89" +
	"Mobile Safari/537.36"
};

interactive("user-agent",
    "Pick a user agent from the list of presets",
    function (I) {
        var ua = (yield I.window.minibuffer.read_object_property(
            $prompt = "Agent:",
            $object = user_agents));
        set_user_agent(user_agents[ua]);
    });

interactive(
    "firefox", "Open URL in Firefox",
    function (I) {
        var error = "";
	var url;
	if (I.prefix_argument) url = read_from_x_primary_selection();
	else url = I.buffer.current_uri.spec;
	shell_command_with_argument_blind("firefox", url);
	if (error != "")
            throw new interactive_error("error:  " + error);
    }
);
