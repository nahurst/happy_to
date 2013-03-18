//= require jquery
//= require jquery_ujs
//= require foundation
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
      alert("new");

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


