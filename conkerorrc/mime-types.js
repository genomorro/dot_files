// External programs for handling various mime types.
external_content_handlers =
{
    "*": "emacsclient -a= -c",
    text: "emacsclient -a= -c",
    image: { "*": "display" },
    video: { "*": "vlc" },
    audio: { "*": "vlc" },
    application: {
	msword: "lowriter",
        postscript: "emacsclient -a= -c",
	"vnd.ms-excel": "libreoffice",
	"vnd.ms-powerpoint": "libreoffice",	
	"vnd.openxmlformats-officedocument.presentationml.presentation": "libreoffice",
	"vnd.openxmlformats-officedocument.spreadsheetml.sheet": "libreoffice",
	"vnd.openxmlformats-officedocument.wordprocessingml.document": "libreoffice",
	"x-gimp": "display",	
	"x-photoshop": "display",
        "x-dvi": "emacsclient -a= -c",
	"x-ogg": "vlc",
	"ogg": "vlc",
	"x-vlc2": "vlc",
	"x-ms-wmv": "vlc",
	"x-ms-wmp": "vlc",
	"x-drm-v2": "vlc",
	"asx": "vlc",
	"smil": "vlc",
	"x-quicktimeplayer": "vlc",
	"vnd.rn-realmedia": "vlc",
	"vnd.rn-realaudio": "vlc",
	"x-shockware-flash": "vlc"
    }
}

// Automatically handle some mime types internally.
content_handlers.set("*", content_handler_prompt);
content_handlers.set("text/*", content_handler_prompt);
content_handlers.set("image/*", content_handler_prompt);
content_handlers.set("video/*", content_handler_prompt);
content_handlers.set("audio/*", content_handler_prompt);
content_handlers.set("application/*", content_handler_prompt);
