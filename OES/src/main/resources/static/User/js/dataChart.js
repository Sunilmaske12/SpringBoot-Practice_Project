var ctx=document.getElementById("myChart").getContext("2d");
let i=6;
var j=new Array();
for(let k=0; k<10; k++){
	j[k]=k+'jan';
}

const arr=[i,2,0,3,4,5,i,2,9,3,4,5,i,2,0,3,4,5,i,2,0,3,4,5];
const arr2=	["A", "B", "c","A", "B", "c","A", "B", "c"];

var myChart=new Chart(ctx, {
	type:"line",
	
	data:{
		
		labels:j,
		datasets:[
		{
			data: arr, 
			tension: 0.3
		}

		]
	}


})
