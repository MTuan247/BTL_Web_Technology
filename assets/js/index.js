function closeAllDropdown() {
	var dropdowns = document.getElementsByClassName('dropdown-expand')
	for (var i = 0; i < dropdowns.length; i++) {
		dropdowns[i].classList.remove('dropdown-expand')
	}
}

function 	openCloseDropdown(event) {
  if(event.target.matches('#search-bar')) {

  } else if (!event.target.matches('.dropdown-toggle')) { 
		closeAllDropdown()
	} 
  else {
		var toggle = event.target.dataset.toggle
		var content = document.getElementById(toggle)
		if (content.classList.contains('dropdown-expand')) {
			closeAllDropdown()
		} else {
			closeAllDropdown()
			content.classList.add('dropdown-expand')
		}
	}
}

window.onclick = function(event) {
	openCloseDropdown(event)
}

function toggleMenu() {
  document.getElementById("navbar-menu").classList.toggle("expand");
}

