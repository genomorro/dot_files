// Webjumps
require("page-modes/wikipedia.js");
wikipedia_enable_didyoumean = true;
define_wikipedia_webjumps("es");
define_lastfm_webjumps("edgar_uriel84");

// Search engines
let (dir = get_home_directory()) {
  opensearch_load_paths.unshift(make_file("~/.conkerorrc/search-engines"));
  define_opensearch_webjump("blekko", "blekko.xml");  
  define_opensearch_webjump("commandlinefu", "command-line-fu.xml");
  define_opensearch_webjump("down?", "down-for-everyone-or-just-me.xml");
  define_opensearch_webjump("duckduckgo", "duck-duck-go.xml");
  define_opensearch_webjump("emacswiki", "emacswiki.xml");
  define_opensearch_webjump("foofind", "foofind.xml");
  define_opensearch_webjump("gentoo-wiki", "gentoo-wiki-en.xml");
  define_opensearch_webjump("github", "github.xml");
  define_opensearch_webjump("image", "picsearch.xml");
  define_opensearch_webjump("imdb", "imdb.xml");
  define_opensearch_webjump("ixquick", "ixquick.xml");
  define_opensearch_webjump("maps", "openstreetmap.xml");
  define_opensearch_webjump("mercadolibre", "mercadolibre-mexico.xml");
  define_opensearch_webjump("mycroft", "mycroft-project.xml");
  define_opensearch_webjump("php", "phpnet.xml");
  define_opensearch_webjump("startpage", "startpage-https---espanol.xml");
  define_opensearch_webjump("video", "ixquick-videos-search.xml");
  define_opensearch_webjump("waybak", "wayback-machine.xml");
  define_opensearch_webjump("wikemacs", "wikemacs-en.xml");
  define_opensearch_webjump("wr-en-es", "wr-english-spanish.xml");
  define_opensearch_webjump("wr-english", "wr-english.xml");
  define_opensearch_webjump("wr-es-en", "wr-spanish-english.xml");
  define_opensearch_webjump("wr-español", "wr-definicin.xml");
  define_opensearch_webjump("youtube", "bsqueda-de-vdeos-en-youtube.xml");
  define_opensearch_webjump("userstyle", "userstylesorg.xml");
}

// Remove unused webjumps
// From: https://github.com/ivoarch/.dot-org-files/blob/master/conkeror.org
var unused_webjumps = ['answers','creativecommons','dictionary','google','lucky','scholar','slang','wiktionary','yahoo'];

for (var i=0; i<unused_webjumps.length; i++) {
    delete webjumps[unused_webjumps[i]];
}
