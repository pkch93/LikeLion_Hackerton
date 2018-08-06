var male = document.querySelector('.field__radio--male');
var female = document.querySelector('.field__radio--female');
male.addEventListener("click", function(){
    document.querySelector("#lecturer_male").checked = true;
});

female.addEventListener("click", function(){
    document.querySelector("#lecturer_female").checked = true;
});