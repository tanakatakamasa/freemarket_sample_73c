$(function(){
  $(document).on('click', '.thumbImage li', function(){
    var class_name = $(this).attr("class");
    var number = class_name.slice(5);
    // console.log(this);
    $('.mainImage li').hide();
    $('.image' + number).fadeIn();
  });
});