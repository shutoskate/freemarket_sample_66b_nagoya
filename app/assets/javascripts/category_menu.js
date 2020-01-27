window.onload = function() {
  var lis = document.getElementById('menu').getElementsByTagName('li');
  for (var i = 0; i < lis.length; i++) {
    var li = lis[i];
    if (li.className == 'top-item' || li.className == 'cate' || li.className == 'sub' ) {
      li.onmouseover = function () { this.getElementsByTagName('ul').item(0).style.display = 'block'; }
      li.onmouseout = function () { this.getElementsByTagName('ul').item(0).style.display = 'none'; }
    }
  }
}