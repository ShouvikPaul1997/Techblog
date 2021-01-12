/**
 * 
 */
function doLike(x,pId,uId) {
	const d={
			
			pId:pId,
			uId:uId,
			
	
			
			
	}
	
	$.ajax({
		
		url:"LikeServlet",
		data:d,
		success : function(data, textStatus, jqXHR) {
			console.log(data)
			if(data.trim()=='true'){
			let c=$(x).eq(0).text();
			console.log(c);
			c++;
			$(x).removeClass("unlike")
			$(x).addClass("like")
			$(x).eq(0).html(c);
			}
			
			else if(data.trim()=='liked'){
				
				let d=$(x).eq(0).text();
				console.log(d);
				d--;
				console.log(d);
				$(x).removeClass("like")
				$(x).addClass("unlike")
				$(x).eq(0).html(d);
				
				
			}
		},

		error : function(jqXHR, textStatus, errorThrown) {
			console.log(data)

		}
})
		
		
	
}