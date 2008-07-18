function Query()
{                         
	this.readGet();
}   

Query.prototype.readGet = function ()
{
	var location = window.location.toString();
	
	var getstring = location.match(/.*\?(.*)/);
	
	if (getstring)
	{
		getstring = getstring[1]; // we just want the last part
		var params = getstring.split("&");    
		
		var get = {};
		
		for (var i in params)  
		{                  
			var pair = params[i].split("=");
			
			var key = pair[0];
			var value = pair[1];
			
			if (value == undefined)
				value = true;
			
			else if (value == 'true')
				value = true;
				
			else if (value == 'false')
				value = false;  
				
			get[key] = value;
		}  
		
		this.getParams = get;
	}
}

Query.prototype.get = function (param)
{ 
	return this.getParams[param];
}