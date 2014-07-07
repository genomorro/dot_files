// Hide scrollbars.
// function disable_scrollbars (buffer) {
//     buffer.browser.contentWindow.scrollbars.visible = false;
// }
// add_hook ("content_buffer_location_change_hook", disable_scrollbars);
// var old_isearch_start = (old_isearch_start || isearch_start);
// isearch_start = function (window, direction) {
//     window.buffers.current.browser.contentWindow.scrollbars.visible = true;
//     old_isearch_start(window, direction);
// };
// var old_isearch_session_destroy = (old_isearch_session_destroy ||
//                                    isearch_session.prototype.destroy);
// isearch_session.prototype.destroy = function () {
//     this.minibuffer.window.buffers.current.browser.contentWindow.scrollbars.visible = false;
//     old_isearch_session_destroy.call(this);
// };
