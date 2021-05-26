// xử lý dropdown
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

// đóng mở menu
function toggleMenu() {
  document.getElementById("navbar-menu").classList.toggle("expand");
}


// show/hide pass
function hidePwd(hide_pwd_id, show_pwd_id, pwd_id) {
	document.getElementById(hide_pwd_id,).style.display = "none";
	document.getElementById(show_pwd_id).style.display = "block";

	document.getElementById(pwd_id).setAttribute("type", "password");
}

function showPwd(hide_pwd_id, show_pwd_id, pwd_id) {
	document.getElementById(hide_pwd_id).style.display = "block";
	document.getElementById(show_pwd_id).style.display = "none";

	document.getElementById(pwd_id).setAttribute("type", "text");
}


/*var index_email;

// lưu thông tin subscribe
function saveEmailSubscribe(email) {
  var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			alert("Hello");

		}
	};
	
  xhttp.open("PUT", `https://subscribe-8fb4a-default-rtdb.firebaseio.com/email/${index_email}.json`, true);
  xhttp.send(JSON.stringify(email));
	index_email ++;
}


function getNumberEmail() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
				var res = JSON.parse(this.responseText);
				// console.log(res.length);
				index_email = res.length;
	    }
	  };
	  xhttp.open("GET", "https://subscribe-8fb4a-default-rtdb.firebaseio.com/email.json", true);
	  xhttp.send();
}

var subscribe_submit = document.getElementById("subscribe-submit");
var subscribe_input = document.getElementById("subscribe-input");

subscribe_submit.onclick = () => {
	saveEmailSubscribe(subscribe_input.value);
}*/

// add loading page
function doneLoading() {
	document.getElementsByClassName("loading-wrapper")[0].style.display = "none";
}

window.onload = () => {
	// setTimeout(() => {doneLoading()}, 1000);
	doneLoading();
	/*getNumberEmail();*/
}






