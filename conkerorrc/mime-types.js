// External programs for handling various mime types.
external_content_handlers.set("application/pdf", "emacsclient -a= -c");
external_content_handlers =
{
    "*": "emacsclient -a= -c",
    text: "emacsclient -a= -c",
    image: { "*": "display" },
    video: { "*": "mpv" },
    audio: { "*": "mpv" },
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
	"x-ogg": "mpv",
	"ogg": "mpv",
	"x-mpv2": "mpv",
	"x-ms-wmv": "mpv",
	"x-ms-wmp": "mpv",
	"x-drm-v2": "mpv",
	"asx": "mpv",
	"smil": "mpv",
	"x-quicktimeplayer": "mpv",
	"vnd.rn-realmedia": "mpv",
	"vnd.rn-realaudio": "mpv",
	"x-shockware-flash": "mpv",
    }
}

// Automatically handle some mime types internally.
content_handlers.set("*", content_handler_prompt);
content_handlers.set("text/*", content_handler_prompt);
content_handlers.set("image/*", content_handler_prompt);
content_handlers.set("video/*", content_handler_prompt);
content_handlers.set("audio/*", content_handler_prompt);
content_handlers.set("application/*", content_handler_prompt);
