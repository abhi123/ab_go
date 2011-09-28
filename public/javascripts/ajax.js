//var filePath = "http://www.mycyberhosting.net/admin/" changed on 25 sep 2010
var filePath = "http://www.mycyberhosting.net/billing/admin/"
function stateChanged() 
{	
	//alert(xmlHttp.responseText );
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	 { 
		

		var counterObject = xmlHttp.responseXML.getElementsByTagName("count")[0];
		var counter = counterObject.childNodes[0].nodeValue;
		
		if(counter > 0) {
		document.getElementById('divAlais').innerHTML = '<table class="form"><tr><td><span class="required">*</span> Customer Alias:</td><td><select name="txtCustomer_Alais" id="txtCustomer_Alais" class= "validate[required]" ><option value=""> - - - SELECT ONE - - - </option></select></td></tr></table>';
		}
		else {
		document.getElementById('divAlais').innerHTML = '<table class="form"><tr><td><span class="required">*</span> Customer Alias:</td><td><input type="text" name="txtCustomer_Alais" id="txtCustomer_Alais" class= "validate[required]" /></td></tr></table>';
		}

		var objSelect=document.getElementById("txtCustomer_Alais");
		objSelect.options.length = 1;
		for(i=0;i<counter;i++)
		{
			var objAliasName = xmlHttp.responseXML.getElementsByTagName("customerName"+i)[0];
			var alaisName = objAliasName.childNodes[0].nodeValue;

			var newOpt = new Option(alaisName,alaisName);
			objSelect.options[objSelect.options.length] = newOpt;
		}
		//document.getElementById("kelly").innerHTML=xmlHttp.responseText 
		 
	 } 
}
function stateChanged2() 
{	
	//alert(xmlHttp.responseText );
	if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete")
	 { 
		document.getElementById('showfields').innerHTML = xmlHttp2.responseText ;
		 
	 } 
}
function stateChanged3() 
{	
	//alert(xmlHttp.responseText );
	if (xmlHttp3.readyState==4 || xmlHttp3.readyState=="complete")
	 { 
		document.getElementById('newfeaturetype').innerHTML = xmlHttp3.responseText ;
		 
	 } 
}
function stateChanged4() 
{	
	//alert(xmlHttp.responseText );
	if (xmlHttp4.readyState==4 || xmlHttp4.readyState=="complete")
	 { 
		document.getElementById('showfields').innerHTML = xmlHttp4.responseText ;
		 
	 } 
}
function ajaxCheckAlias(customername)
{
	xmlHttp=GetXmlHttpObject()
	if (xmlHttp==null)
	 {
	 alert ("Browser does not support HTTP Request")
	 return
	 }
	var SiteUrl=filePath+"ajaxaliascheck.php"
	SiteUrl=SiteUrl+"?sid="+Math.random()
	SiteUrl=SiteUrl+"&customername="+customername
	//alert(SiteUrl);
	xmlHttp.onreadystatechange=stateChanged
	xmlHttp.open("GET",SiteUrl,true)
	xmlHttp.send(null)
}
function ajaxshowfields(val)
{
	xmlHttp2=GetXmlHttpObject()
	if (xmlHttp2==null)
	 {
	 alert ("Browser does not support HTTP Request")
	 return
	 }
	var SiteUrl2=filePath+"ajaxshowfields.php"
	SiteUrl2=SiteUrl2+"?sid="+Math.random()
	SiteUrl2=SiteUrl2+"&flag="+val
	//alert(SiteUrl);
	xmlHttp2.onreadystatechange=stateChanged2
	xmlHttp2.open("GET",SiteUrl2,true)
	xmlHttp2.send(null)
}
function ajaxshowparentaffcommfields(val1,val2)
{
	xmlHttp4=GetXmlHttpObject()
	if (xmlHttp4==null)
	 {
	 alert ("Browser does not support HTTP Request")
	 return
	 }
	var SiteUrl4=filePath+"ajaxshowparentafffields.php"
	SiteUrl4=SiteUrl4+"?sid="+Math.random()
	SiteUrl4=SiteUrl4+"&affId="+val1
	SiteUrl4=SiteUrl4+"&affParentId="+val2
	//alert(SiteUrl);
	xmlHttp4.onreadystatechange=stateChanged4
	xmlHttp4.open("GET",SiteUrl4,true)
	xmlHttp4.send(null)
}


function ajaxfeaturetype(val)
{
	xmlHttp3=GetXmlHttpObject()
	if (xmlHttp3==null)
	 {
	 alert ("Browser does not support HTTP Request")
	 return
	 }
	var SiteUrl3=filePath+"ajaxfeaturetype.php"
	SiteUrl3=SiteUrl3+"?sid="+Math.random()
	SiteUrl3=SiteUrl3+"&flag="+val
	xmlHttp3.onreadystatechange=stateChanged3
	xmlHttp3.open("GET",SiteUrl3,true)
	xmlHttp3.send(null)
}

function GetXmlHttpObject()
{
 
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}

function stateChanged1() 
{	

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	 { 
		

		var counterObject = xmlHttp.responseXML.getElementsByTagName("count")[0];
		var counter = counterObject.childNodes[0].nodeValue;
		
		var objtxtAmount=document.getElementById("txtAmount");

		for(i=0;i<counter;i++)
		{
			var objAmount = xmlHttp.responseXML.getElementsByTagName("price"+i)[0];
			var amount = objAmount.childNodes[0].nodeValue;

			objtxtAmount.value = amount;
		}
		 
	 } 
}
function stateChanged5() 
{	

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	 { 
		document.getElementById('txtCustomerVat').value = xmlHttp.responseText ;
		 
	 } 
}

function ajaxCheckAlias1(product,affiliate)
{
	xmlHttp=GetXmlHttpObject1()
	if (xmlHttp==null)
	 {
	 alert ("Browser does not support HTTP Request")
	 return
	 }
	var SiteUrl=filePath+"ajax_getAmount.php"
	SiteUrl=SiteUrl+"?sid="+Math.random()
	SiteUrl=SiteUrl+"&product="+product
	SiteUrl=SiteUrl+"&affiliate="+affiliate
	//alert(SiteUrl);
	xmlHttp.onreadystatechange=stateChanged1
	xmlHttp.open("GET",SiteUrl,true)
	xmlHttp.send(null)
}

function ajaxGetProductDetails(prodName)
{
	
	xmlHttp=GetXmlHttpObject()
	if (xmlHttp==null)
	 {
	 alert ("Browser does not support HTTP Request")
	 return
	 }
	var SiteUrl=filePath+"ajax_getProductVat.php"
	SiteUrl=SiteUrl+"?sid="+Math.random()
	SiteUrl=SiteUrl+"&name="+prodName
	
	
	//alert(SiteUrl);
	xmlHttp.onreadystatechange=stateChanged5
	xmlHttp.open("GET",SiteUrl,true)
	xmlHttp.send(null)
}

function GetXmlHttpObject1()
{
 
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}

/// for invoice