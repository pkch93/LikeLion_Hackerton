var ctg = $(".ctg--list");
var user_ctg = [];
var count = 0;
ctg.on("click", function(){
   if ($(this).hasClass("onSelect")){
      $(this).removeClass("onSelect");
      count -= 1;
      user_ctg.splice(user_ctg.indexOf($(this).data("value")), 1);
   }
   else {
      if (checkCtgCount(count)){
         return false;
      }
      $(this).addClass("onSelect");
      user_ctg.push($(this).data("value"));
      count += 1;
   }
   $("#lecturer_categories_category").attr("value", user_ctg);
   $("#lecture_categories_category").attr("value", user_ctg);
});

var checkCtgCount = function(c){
   if(c >= 2){
      alert("카테고리는 2개만 가능합니다!");
      return true;
   }
   return false;
}