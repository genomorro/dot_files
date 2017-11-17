//https://github.com/legumbre/conkeror-rc/blob/master/conkerorrc.js
// current url QR code
interactive("qrcode", "Open QR code of current URL.",
           function qrcode(I) {
               I.window.minibuffer.message(I.window.content.location.href);
                I.window.content.location = 'http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=' +
                   encodeURIComponent(I.window.content.location.href);
            });
define_key(content_buffer_normal_keymap, "Z", "qrcode");
