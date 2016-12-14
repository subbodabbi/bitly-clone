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
  	        var data = JSON.parse(response)

				document.getElementById('shortened').setAttribute("href",data['short_url'])
				document.getElementById('shortened').innerHTML= '<a href=\"' +  data.short_url + '\">' + "http://localhost:9393/" + data.short_url

  	          $(".table tbody").prepend('<tr><td>' + data.long_url + '</td><td><a href=\"' +  data.short_url + '\">' + "http://localhost:9393/" + data.short_url + '</a></td><td>' + data.click_count + '</td></tr>');
  	      }  
        }).done(function(){ 
          console.log("success?")
        })
    })
});