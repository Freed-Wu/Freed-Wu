document.write('<div class="v"></div>');
var loadJs = (function () {
  var script = document.createElement("script");
  if (script.readyState) {
    return function (url) {
      return new Promise(function (res, rej) {
        script = document.createElement("script");
        script.src = url;
        document.body.appendChild(script);
        script.onreadystatechange = function () {
          if (
            script.readyState == "loaded" ||
            script.readyState == "complete"
          ) {
            script.onreadystatechange = null;
            res();
          }
        };
      });
    };
  } else {
    return function (url) {
      return new Promise(function (res, rej) {
        script = document.createElement("script");
        script.src = url;
        document.body.appendChild(script);
        script.onload = function () {
          res();
        };
      });
    };
  }
})();
loadJs("//cdn.jsdelivr.net/npm/valine").then(function () {
  new Valine({
    appId: "dI55GI1uvs20LRGMerurKrjS-gzGzoHsz",
    appKey: "FCRSnq0WltePG6w5Yq6Fr255",
    avatar: "identicon",
    placeholder: "ヾﾉ≧∀≦)o来啊，快活啊！",
    notify: "true",
    verify: "true",
    highlight: "true",
    avatarForce: "true",
    visitor: "true",
    recordIP: "true",
    el: ".v",
  });
});
