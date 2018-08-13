var ctg = $(".ctg--list");
var user_ctg = [];
ctg.on("click", function(){
   if ($(this).hasClass("onSelect")){
      $(this).removeClass("onSelect");
      user_ctg.splice(user_ctg.indexOf($(this).data("value")), 1);
   }
   else {
      $(this).addClass("onSelect");
      user_ctg.push($(this).data("value"));
   }
   $("#category").attr("value", user_ctg);
});