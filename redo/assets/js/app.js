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

  let start_time = null;
  let stop_time = null;

  document.getElementById("start_button").addEventListener("click", function () { start(); });
  document.getElementById("end_button").addEventListener("click", function () { end(); });


  function start() {
    start_time = new Date();
    var starttime = document.getElementById("start_time");
    starttime.innerHTML = "timer running";
  }

  function end() {
    stop_time = new Date();
    console.log(window.task_id);

    $.ajax("/ajax/time_blocks", {
      method: "post",
      datatype: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({
        time_block: {
          start: start_time,
          end: stop_time,
          task_id: window.task_id,
        }
      }),
      success: (resp) => {location.reload()},
      error: (err) => {
      console.error(err);
    }
    });
    console.log(start_time + ", " + stop_time);
  }



})();


// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
