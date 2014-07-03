$(function(){ 
  $(document).foundation(); 
  $('.autoplay').slick({
    //arrows: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 4000,
    dots: true,
    infinite: true,
    speed: 750,
    fade: true,
    pause_on_hover: true,
    cssEase: 'linear'
  });
});
