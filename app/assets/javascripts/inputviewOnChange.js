$(".input__included").change(function(){
    $(".input__view").val(this.options[this.selectedIndex].value);
})