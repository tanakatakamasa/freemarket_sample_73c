$(function(){
  $('.thumbImage li').click(function(){
    var class_name = $(this).attr("class");
    var number = class_name.slice(5);
    // console.log(this);
    $('.mainImage li').hide();
    $('.image' + number).fadeIn();
  });
});