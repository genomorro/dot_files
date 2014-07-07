// https://github.com/mwu/conkerorrc
//Firebug
interactive("firebug lite", "open firebug lite",
            function firebug (I) {
              var doc = I.buffer.document;
              var script = doc.createElement('script');
              script.setAttribute('type', 'text/javascript');
              script.setAttribute('src', 'https://getfirebug.com/firebug-lite.js#startOpened=true');
              doc.body.appendChild(script);
            });
