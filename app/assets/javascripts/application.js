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
    'show': function() {
      $(".edit_mail_merge input").attr("disabled", "disabled");
      $(".edit_mail_merge textarea").attr("disabled", "disabled");
      var data = $.parseJSON($("#mail_merge_data").val());
      APP.mail_merges.display(data);
    },
    'new': function() {
      $("#pull").click(function(e) {
        e.preventDefault();
        var url = $("#google_spreadsheet_url").val();
        Tabletop.init( { key: url,
                       callback: APP.mail_merges.display,
                       simpleSheet: true } );
      });

      $("#mail_merge_body_template").keyup(
        APP.mail_merges.updatePreview);
    },
    'display': function(data, tabletop) {
      if (!data || data.length === 0) {
        alert("No spreadsheet found. Please make sure it's published.");
      }
      else if (!data[0]["email"]) {
        alert("Please create an email column");
      }
      else {
        APP.google_spreadsheet_data = data;
        $("#mail_merge_data").val(JSON.stringify(data));

        var table = $("#pulled_data");
        var thead = table.find("thead");
        var tbody = table.find("tbody");
        
        thead.find("th").remove();
        tbody.find("tr").remove();

        for (var key in data[0]) {
          thead.append("<th>" + key + "</th");
        }

        for (var row in data) {
          var cells = "";
          for (var key in data[row]) {
            cells += "<td>" + data[row][key] + "</td>";
          }
          tbody.append("<tr>" + cells + "</tr>");
        }

        table.slideDown();
      }
    },
    'updatePreview': function() {
      var template = $("#mail_merge_body_template").val();
      var message = Mustache.render(template, 
                                    APP.google_spreadsheet_data[0]);
      $("#preview").html(message);
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


