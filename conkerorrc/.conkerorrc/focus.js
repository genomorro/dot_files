// Focus
require("block-content-focus-change.js");
// block_content_focus_change_duration = 20;
// function focusblock (buffer) {
//     var s = Components.utils.Sandbox(buffer.top_frame);
//     s.document = buffer.document.wrappedJSObject;
//     Components.utils.evalInSandbox(
//         "(function () {\
//             function nothing () {}\
//             if (! document.forms)\
//                 return;\
//             for (var i = 0, nforms = document.forms.length; i < nforms; i++) {\
//               for (var j = 0, nels = document.forms[i].elements.length; j < nels; j++)\
//                 document.forms[i].elements[j].focus = nothing;\
//             }\
//           })();",
//         s);
// }
// add_hook('content_buffer_progress_change_hook', focusblock);
block_content_focus_change_duration = 40;

// require("key-kill");
// key_kill_mode.test.push(build_url_regexp($domain = "youtube"));
// key_kill_mode.test.push(/\/\/.*slashdot\.org\//);
// key_kill_input_fields = true;
