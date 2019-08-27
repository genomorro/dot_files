// General Settings
//http://dotshare.it/dots/413/

url_remoting_fn = load_url_in_new_buffer;
url_completion_use_bookmarks = true;
url_completion_use_history = true;
user_pref("intl.accept_languages", "es-MX, es-ES, es-AR, es, en-US, en");
user_pref("layout.spellcheckDefault", 2);
user_pref("media.gstreamer.enabled", true);
user_pref("network.http.pipelining", true);
user_pref("network.http.proxy.pipelining", true);
user_pref("spellchecker.dictionary", "es-MX");
user_pref("spellchecker.dictionary_path", "/usr/share/myspell");
user_pref("layout.css.devPixelsPerPx", "1");
user_pref("full-screen-api.enabled", true);

interactive("load-file",
           "(Re-)load an initialization file",
           function(I) {
               config_dir= get_home_directory();
               config_dir.appendRelativePath(".conkerorrc");
               filename= (yield I.minibuffer.read($prompt = "Load file: ",
                                                  $initial_value = config_dir.path + "/",
                                                  $history = "load_file"));
               I.window.minibuffer.message("Loaded file "+filename);
               load(make_file(filename));
           }
          );
