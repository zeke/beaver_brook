(function() {
  var Carousel;

  Carousel = (function() {
    function Carousel(selector) {
      var _this = this;

      this.selector = selector;
      this.slide_count = $(this.selector).length;
      $('body').on('keydown', function(event) {
        _this.slide_offset = parseInt(document.body.scrollTop / window.innerHeight);
        if ((document.body.scrollTop % window.innerHeight) > window.innerHeight / 2) {
          _this.slide_offset++;
        }
        switch (event.keyCode) {
          case 39:
          case 40:
            return _this.next();
          case 37:
          case 38:
            return _this.prev();
        }
      });
    }

    Carousel.prototype.next = function() {
      if (this.slide_offset !== (this.slide_count - 1)) {
        this.slide_offset++;
      }
      return this.animate();
    };

    Carousel.prototype.prev = function() {
      if (this.slide_offset !== 0) {
        this.slide_offset--;
      }
      return this.animate();
    };

    Carousel.prototype.animate = function() {
      return $("html, body").animate({
        scrollTop: window.innerHeight * this.slide_offset
      });
    };

    return Carousel;

  })();

  window.Carousel = Carousel;

  $(function() {
    return window.carousel = new Carousel('#slides > li');
  });

}).call(this);
