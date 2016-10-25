// Javascript example
(function(w, d) {
    var countdown = 5;
    var timer;
    var callback = (function () {
        return function() {
            if (countdown > 0) {
              d.body.innerHTML = countdown;
              countdown--;
            } else {
              d.body.innerHTML = "done";
              clearInterval(timer);
            }
        };
    })()
    timer = w.setInterval(callback, 1000);
})(window, document);
