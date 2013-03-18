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

      alert("init");
    },
  },
  mail_merges: {
    'new': function() {
      var public_spreadsheet_url = 'https://docs.google.com/spreadsheet/pub?key=0AuI4VolCrNFLdGF3YUVqQlRTV2ZHZ3hRVTNrQ2VMRFE&output=html';
      Tabletop.init( { key: public_spreadsheet_url,
                     callback: APP.mail_merges.display,
                     simpleSheet: true } );
    },
    'display': function(data, tabletop) {
      for(var i = 0; i < data.length; i++) {
        var output = Mustache.render("Say {{greeting}} to {{name}} from {{company}}", data[i]);
        alert(output);
      }
      console.log(data);
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


