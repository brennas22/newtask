// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery; // Bootstrap requires a global "$" object.
import "bootstrap";

(function () {
  "use strict";

  let start_time = 0;

  document.getElementById("start_button").addEventListener("click", function () { start(start_button); });

  function start(el) {
    console.log("hi");
    start_time = new Date();
    var startbutton = document.getElementById("start_button");
    startbutton.innerHTML = start_time;

  }

})();


// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
