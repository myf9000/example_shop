// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


# select the element to watch for changes
$('form').on('change', '#category_id'), function() {
  var category_id = $(this).val(); # save the category_id set in the first dropdown

  $.ajax({
    url: "/categories/" + category_id + "/get_subcategories", # a custom route, see routes.rb further down
    type: "GET",
    dataType: "script", # we expect a response in js format
    data: { "category_id": category_id } # the only value we will need to get the subcategories
  });
});