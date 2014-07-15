#!/bin/bash         
# Sets the selected_bg_color to one of the Solarized accent colors
clear
# Color selection
read -p "Please chose an accent color (yellow, orange, red, magenta, violet, blue, cyan or green) : " color
clear
# Feedback
echo "Accent color set to $color"
# Sed operations
if [ $color = yellow ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #b58900;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #b58900;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#b58900\\ntext/g' gtk-2.0/gtkrc
elif [ $color = orange ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #cb4b16;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #cb4b16;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#cb4b16\\ntext/g' gtk-2.0/gtkrc
elif [ $color = red ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #dc322f;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #dc322f;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#dc322f\\ntext/g' gtk-2.0/gtkrc		
elif [ $color = magenta ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #d33682;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #d33682;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color #.*\\ntext/nselected_bg_color:#d33682\\ntest/g' gtk-2.0/gtkrc		

elif [ $color = violet ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #6c71c4;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #6c71c4;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#6c71c4\\ntext/g' gtk-2.0/gtkrc

elif [ $color = blue ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #268bd2;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #268bd2;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#268bd2\\ntext/g' gtk-2.0/gtkrc
		
elif [ $color = cyan ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #2aa198;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #2aa198;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#2aa198\\ntext/g' gtk-2.0/gtkrc
elif [ $color = green ]
	then
		sed -i 's/selected_bg_color #.*;/selected_bg_color #859900;/g' gtk-3.0/gtk.css
		sed -i 's/selected_bg_color #.*;/selected_bg_color #859900;/g' gtk-3.0/gtk-dark.css
		sed -i 's/nselected_bg_color:#.*\\ntext/nselected_bg_color:#859900\\ntext/g' gtk-2.0/gtkrc
fi
