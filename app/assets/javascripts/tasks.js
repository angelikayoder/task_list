document.addEventListener("turbolinks:load", function() {

  $(".completed-tasks ul:first").sortable({
    update: function(e, ui) {
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });

});
