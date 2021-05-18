function clickRowLink(event) {
  if(event.target.matches('.table-row-link')) {
    var link = event.target.dataset.link;
    window.open(link);
  }
}

window.onclick = function(event) {
  clickRowLink(event);
};