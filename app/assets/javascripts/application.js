//= require jquery
//= require jquery_ujs
//= require foundation
//= require tabletop
//= require mustache
//= require_tree .

$(document).foundation();
var APP = APP || {};
APP = {
  common: {
    init: function() {

    },
  },
  mail_merges: {
    'new': function() {
      $("#pull").click(function(e) {
        e.preventDefault();
        var url = $("#google_spreadsheet_url").val();
        Tabletop.init( { key: url,
                       callback: APP.mail_merges.display,
                       simpleSheet: true } );
      });
    },
    'display': function(data, tabletop) {
      $("#mail_merge_data").val(JSON.stringify(data));
    }
  },
}

UTIL = {
  exec : function(controller, action){
    var ns = APP,
    action = (action === undefined) ? "init" : action;

    if (controller !== "" &&
      ns[controller] &&
      typeof ns[controller][action] === "function" ) {
      ns[controller][action]();
    }
  },
  init: function() {
    var body = document.body,
    controller = body.getAttribute("data-controller"),
    action = body.getAttribute("data-action");
    UTIL.exec("common");
    UTIL.exec(controller);
    UTIL.exec(controller, action);
  }
};
$(document).ready(UTIL.init);


