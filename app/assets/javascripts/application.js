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

/* scroll into view */


var toSearch = function(){
    var url = window.location.pathname;
    if(url !== "/") window.location.href = "https://likelion-hackerton-chorizzori.c9users.io/#searchhide";
    else document.getElementById("searchhide").scrollIntoView({block: 'start', behavior: 'smooth'});
};

var toPopular = function(){
    var url = window.location.pathname;
    if(url !== "/") window.location.href = "https://likelion-hackerton-chorizzori.c9users.io/#searchdiv";
    else document.getElementById("searchdiv").scrollIntoView({block: 'start', behavior: 'smooth'});
};

var toInfo = function(){
    var url = window.location.pathname;
    if(url !== "/") window.location.href = "https://likelion-hackerton-chorizzori.c9users.io/#infohide";
    else document.getElementById("infohide").scrollIntoView({block: 'start', behavior: 'smooth'});
}

$(document).ready(function(){
   $(".navbar__downdrop").on("click", function(){
   $(".navbar--togglelist").toggle();
   
   $(window).resize(function(){
      if( screen.width > 725 ) {
          $(".navbar--togglelist").hide();
      }
   });
})
});
