// Themes
// theme_load_paths.push("/home/genomorro/.conkerorrc/styles");
// theme_load_paths.unshift("/home/genomorro/.conkerorrc/styles");
// theme_load("zenburn-conkeror"); 

//user_pref("browser.display.use_system_colors", "false");

register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/ad-block.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/arch.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/github-dark.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/google-solarized-dark.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/imdb.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/orgmode-solarized.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/pdf-dark-local.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/reddit.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/rottentomatoes.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/stackoverflow-dark.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/telegram-solarized-dark.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/txt-solarized-dark-local.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/wikipedia-solarized-dark-local.css');
register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/youtube-progress-bar-2.css');

var global_css_registered=false;
function solarized (I){
    global_css_registered=global_css_registered ? false : true;
    if(global_css_registered){
	register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/gtk-local.css');
	// register_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/solarized-dark-everywhere.css');
    }else{
	unregister_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/gtk-local.css');
	// unregister_user_stylesheet('file:///home/genomorro/.conkerorrc/styles/stylesheets/solarized-dark-everywhere.css');
    }
}
interactive("Dark-Solarized-Colors", "Ethan Schoonover's Solarized color scheme", solarized);
define_key(default_global_keymap, "C-t", "Dark-Solarized-Colors");

// require("favicon");
// add_hook("mode_line_hook", mode_line_adder(buffer_icon_widget), true);
// read_buffer_show_icons = true;

function my_zoom_set (buffer) {
    browser_zoom_set(buffer, false, 100);
}
add_hook('create_buffer_late_hook', my_zoom_set);
