function list() {
  const pullDownButton = document.getElementById("index-prefecture")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('click', function(e) {
    e.preventDefault();
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
  
}

window.addEventListener('load', list);