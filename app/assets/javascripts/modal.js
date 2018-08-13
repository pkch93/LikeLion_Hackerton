/* modal */

var btn = $(".modalopen");
var close = $(".modal--close");
var modal = $(".target__modal");

btn.on("click", function(){
   var target = "." + $(this).data("modal") + "__modal";
   $(target).css("display", "block");
});

close.on("click", function(){
   modal.css("display", "none");
});