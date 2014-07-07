// Themes
// theme_load_paths.push("/home/bofe/.conkerorrc/styles");
// theme_load_paths.unshift("/home/bofe/.conkerorrc/styles");
// theme_load("zenburn-conkeror"); 

register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/ad-block.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/arch.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/diaspora.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/emacswiki-zenburn.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/github-zenburn.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/google-dark.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/no-gtk.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/stackoverflow.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/startpage.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/txt-zenburn.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/userstyle-zenburn.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/wikipedia-zenburn-dark.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/youtube-player.css');
register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/youtube.css');

var global_css_registered=false;
function darken_page(I){
    global_css_registered=global_css_registered ? false : true;
    if(global_css_registered){
	register_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/general-zenburn.css');
    }else{
	unregister_user_stylesheet('file:///home/bofe/.conkerorrc/styles/stylesheets/general-zenburn.css');
    }
}
interactive("darken-page", "Darken the page in an attempt to save your eyes.", darken_page);
define_key(default_global_keymap, "C-t", "darken-page");

// require("favicon");
// add_hook("mode_line_hook", mode_line_adder(buffer_icon_widget), true);
// read_buffer_show_icons = true;

function my_zoom_set (buffer) {
    browser_zoom_set(buffer, false, 100);
}
add_hook('create_buffer_late_hook', my_zoom_set);
