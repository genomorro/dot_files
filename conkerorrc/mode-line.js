// mode-line
//mode_line_mode(false);
clock_time_format = '%a\ %d\ %b\ %R';
minibuffer_auto_complete_default = true;
add_hook("mode_line_hook", mode_line_adder(loading_count_widget), true);
add_hook("mode_line_hook", mode_line_adder(buffer_count_widget), true);
add_hook("mode_line_hook", mode_line_adder(downloads_status_widget), true);
//add_hook("mode_line_hook", mode_line_adder(buffer_icon_widget), true);
