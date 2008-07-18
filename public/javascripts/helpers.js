function filter(newParams)
{
	// 1 // get existing params
	var params = (new Query()).getParams;      
	
	if (!params)
		params = []
	
	for (var i in newParams)
		params[i] = newParams[i];    
		
	var paramArray = [];
		
	for (var i in params)
		paramArray.push(i + "=" + params[i]);
		
	return paramArray.join('&');
}