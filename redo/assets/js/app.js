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

import jQuery from 'jquery';
window.jQuery = window.$ = jQuery; // Bootstrap requires a global "$" object.
import "bootstrap";

import "phoenix_html"

$(function () {

  $('#end_button').hide();
  $('.save-button').hide();

  let start_time = 0;
  let stop_time = 0;

  $('#start_button').click(() => {
    start_time = new Date();
    var starttime = document.getElementById("start_time");
    starttime.innerHTML = "timer running";
    $('#start_button').hide();
    $('#end_button').show();


  });

  $('.edit-button').click((ev) => {
    let show_save = $(ev.target).siblings(".save-button").show();
    $(ev.target).hide();

    let td = $(ev.target).closest(".editable-row");
    let endcell = td.find("#end-field").prop( "disabled", false );
    let startcell = td.find("#start-field").prop( "disabled", false );

  });

  $('#end_button').click((ev) => {
    stop_time = new Date();
    var starttime = document.getElementById("start_time");
    starttime.innerHTML = "timer stopped";

    let task_id = $(ev.target).data("task_id");

    $.ajax("/ajax/time_blocks", {
      method: "post",
      datatype: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({
        time_block: {
          start: start_time,
          end: stop_time,
          task_id: task_id,
        }
      }),
      success: (resp) => {location.reload()},
      error: (err) => {
      console.error(err);
    }
    });
  });

  $('.save-button').click((ev) => {
    let timeblock = $(ev.target).data("timeblock")
    let td = $(ev.target).closest(".editable-row");
    let endcell = td.find("#end-field").prop( "disabled", true );
    let startcell = td.find("#start-field").prop( "disabled", true );

    let show_edit = $(ev.target).siblings(".edit-button").show();
    $(ev.target).hide();

    let task_id = $(ev.target).data("task_id");

    $.ajax("/ajax/time_blocks/" + timeblock, {
      method: "put",
      datatype: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({
        time_block: {
          start: $(startcell).val(),
          end: $(endcell).val(),
          task_id: task_id,
        }
      }),
      success: (resp) => {},
      error: (err) => {
      console.error(err);
    }
    });
  });

});


// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
