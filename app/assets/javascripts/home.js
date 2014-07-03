$(function(){ 
  $(document).foundation(); 
  $('.autoplay').slick({
    // arrows: true,
    dots: true,
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 750,
    fade: true,
    // pauseOnHover: true,
    cssEase: 'linear',
    swipe: true,
    touchMove: true,
  });
});
