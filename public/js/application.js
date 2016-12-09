

/*
$(document).ready(function(){

  $('.form').submit(function(e){
  	  console.log("this");
      e.preventDefault();
      console.log("this");
      $.ajax({
  	    url: "/urls",
  	    method: "POST",
  	    data: $('#search').serialize(),
  	    success: function(response){
  	    }
    }).done(function(){ 
    	console.log("success?")
      })
  })
});
/*