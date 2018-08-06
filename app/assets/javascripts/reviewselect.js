var generation = document.getElementsByClassName("field__radio--age");
for(var i = 0; i < generation.length; i++){
    (function(){
        var age = generation[i].dataset.value;
        generation[i].addEventListener("click", function(){
        var idvalue = "#review-age-" + age;
        document.querySelector(idvalue).checked = true;
    });
    })();
}

$('.field--starpoint span').click(function(){
  $(this).parent().children('span').removeClass('staron');
  $(this).addClass('staron').prevAll('span').addClass('staron');
  var x = parseInt($(this).attr('value'));
  $("#point").val(x);
  return false;
});

/* review form modal */

var btn = $("#write__review");
var close = $(".modal--close");
var modal = $("#review__modal");

btn.on("click", function(){
   modal.css("display", "block");
});

close.on("click", function(){
    modal.css("display", "none");
});