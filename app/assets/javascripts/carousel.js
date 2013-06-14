var Carousel = (function() {

  var delay = 5000;
  var $carousel = $("#carousel");
  var $itemsHolder = $carousel.find("> ul");
  var $items = $itemsHolder.find("> li");
  var itemWidth = $items.first().width();
  var currentItem = -1;
  var timerId;

  var $nextButton = $("#carousel-nav > .next");
  var $previousButton = $("#carousel-nav > .prev");

  var init = function() {
    $itemsHolder.css({"width": ($items.length * itemWidth) + "px"});
    bind();
    start();
  };

  var bind = function () {
    $nextButton.on("click", loop);
    $previousButton.on("click", previous)
  };

  var start = function() {
    loop();
    timerId = window.setInterval(loop, delay);
  };

  var stop = function() {
    if(timerId) {
      window.clearInterval(timerId);
    }
  };

  var loop = function() {
    currentItem++;

    if (currentItem == $items.length) {
      currentItem = 0;
    }

    move();
  };

  var previous = function() {
    currentItem--;

    if (currentItem <= 0) {
      currentItem = $items.length - 1;
    }

    move();
  };

  var move = function() {
    var leftPosition = currentItem * itemWidth * -1;
    $itemsHolder.stop().animate({"left": leftPosition + "px"}, 1000);
  };

  return {
    init: init,
    loop: loop,
    start: start,
    stop: stop
  };
})();

