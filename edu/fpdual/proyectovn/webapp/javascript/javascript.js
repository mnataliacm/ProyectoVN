//replicar barra navegación
$(function(){
  $('#nav-placeholder').load('navbar.jsp');
});

//bootstrap modal
var myModal = document.getElementById('myModal');
var myInput = document.getElementById('myInput');

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus();
});





