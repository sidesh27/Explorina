

function checkLog() {
  //alert("Executing checkLog");
  var xhttp = new XMLHttpRequest();
  var URL = "LogServlet";

  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        if( this.responseText.trim() === 'null null' || this.responseText.trim() === 'NO COOKIES FOUND') {
          //document.getElementById("change").innerHTML = "Welcome, " + this.responseText;
          //alert("USER HAS NOT LOGGED IN!");
        }
        else{
          var uname = this.responseText;
          //alert("USER LOGGED IN");
          //document.getElementById("change").innerHTML = this.responseText;
          if (typeof(Storage) !== "undefined") {
	  	    localStorage.setItem("username", uname);
	  		//changeContent();
			}
          document.getElementById("welcome").innerHTML = "Welcome, " + uname;
          document.getElementById("logout").innerHTML = "Logout";
          document.getElementById("login").innerHTML = "";
        }
    }
  };
  xhttp.open("GET", URL, true);
  xhttp.send();
}

// function changeContent() {
// 	alert("CHANGE CONTENT EXECUTES");
//  	document.getElementById("change").innerHTML = localStorage.getItem("username");
// }

function loadCard() {
	alert("LOAD CARD EXECUTES");
	document.getElementById("card-name").innerHTML = localStorage.getItem("username");
}


function viewHistory() {
  alert("VIEWHISTORY() EXECUTES");
	var xhttp = new XMLHttpRequest();
	var URL = "BookingHistory";

	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
           alert("RENDERING TABLE ELEMENTS");
           document.getElementById("t-body").innerHTML = this.responseText;
      	}
  	};
  	xhttp.open("GET", URL, true);
  	xhttp.send();
}