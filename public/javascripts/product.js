// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function check_prod(id){
  if (document.getElementById("check_"+id).checked == true)
   document.getElementById("check_"+id).checked = false;
  else
   document.getElementById("check_"+id).checked = true;
}

function create_order(id){
var selected = [];
$('input:checked').each(function() {
    selected.push($(this).attr('value'));
});
if(selected.length > 0)
  $.post("orders",{ids: selected, user: id} );
else
  alert("Please select a product to proceed");
}