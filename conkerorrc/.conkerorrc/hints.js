// Hints Colors 
hint_background_color = '';
active_hint_background_color = '#586e75';
img_hint_background_color = '';
active_img_hint_background_color = '#586e75';

register_user_stylesheet(
    "data:text/css," +
        escape(
            "@namespace url(\"http://www.w3.org/1999/xhtml\");\n" +
            "span.__conkeror_hint {\n"+
            "  font-size: 12px !important;\n"+
            "  line-height: 12px !important;\n"+
            " border: 1px solid #eee8d5 !important;" +
            " color: #93a1a1 !important;" +
            " background-color: #073642 !important;" +
            "}"));

/*
 * display properties of the current selected node during
 * the hints interaction.
 */
// hints_display_url_panel = true;
