// Working with history
function history_clear () {
    var history = Cc["@mozilla.org/browser/nav-history-service;1"]
        .getService(Ci.nsIBrowserHistory);
    history.removeAllPages();
}
interactive("history-clear",
    "Clear the history.",
    history_clear);

