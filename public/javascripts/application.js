// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$('.target').keyup(function() {
  alert('Handler for .keyup() called.');
});



function publish_data(name)
{
	var values = $("input#chat_input").val();
	$.ajax({ 
        dataType: "json",
        cache: false,
        url: "/chats/send_data?chat_input=" + values + "&name=" + name,
        timeout: 2000,
        success: function(data){
            $.each(data, function(i, j)
                                                    {
                                                        
                                                        
                                                    });


        }
    });
}

function connect_chat()
{
	var jug = new Juggernaut;
  var offline = $("<div></div>")
    .html("The connection has been established! <br /> ")
    .dialog({
        autoOpen: false,
        modal:    true,
        width:    330,
        resizable: false,
        closeOnEscape: false,
        title: "Connection"
    });

	jug.on("connect", function(){ 
	  offline.dialog("open");
	});

	jug.on("disconnect", function(){ 
	  offline.dialog("close");
	});

  jug.subscribe("channel1", function(data){
    console.log("Got data: " + data);
	$("#chats").append($("<li />").text(data["name"] +"  :        "+ data["data"]));
  });
}
  
  // dynamic append form
function reply_form(val1,  val2)
{
	$(".reply_form").hide();
	$(val1).show();
	$(".reply").show();
	$(val2).hide();
}

 // cancel reply form
function cancel_reply()
{
	$(".reply_form").hide();
	$(".reply").show();
}


		
	