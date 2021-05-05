<div class="card-group">
<div class="card" style="width: 18rem; padding:5px;">
  <img src="images/manali.jpg" class="card-img-top">
  <div class="card-body">
    <p class="card-text">Manali</p>
  </div>
</div>

<div class="card" style="width: 18rem; padding:5px;">
  <img src="images/dubai.jpg" class="card-img-top">
  <div class="card-body">
    <p class="card-text">Dubai</p>
  </div>
</div>

<div class="card" style="width: 23rem; padding:5px;">
  <img src="images/mumbai.jpg" class="card-img-top">
  <div class="card-body">
    <p class="card-text">Mumbai</p>
  </div>
</div>

<div class="card" style="width: 18rem; padding:5px;">
  <img src="images/maldives.jpg" class="card-img-top">
  <div class="card-body">
    <p class="card-text">Maldives</p>
  </div>
</div>

</div>
<div class="card-group">
  <div class="card" style="width:10px; padding:5px; height:15px;">
  <img src="images/paris.jpg" class="card-img-top">
  <div class="card-body">
    <p class="card-text">Paris</p>
  </div>
</div>
<div class="card-group">
  <div class="card" style="width: 10rem; padding:5px; height:15px;">
  <img src="images/goa.jpg" class="card-img-top">
  <div class="card-body">
    <p class="card-text">Goa</p>
  </div>
</div>

function checkLog() {
  var xhttp = new XMLHttpRequest();
  var URL = "MyServlet1";
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", URL, true);
  xhttp.send();
}
