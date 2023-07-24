//=============Payment Started=============
function choosePayment(payment){
	console.log(payment);
	if(payment=="online"){
			$(".paymentOrder").html(`<button type="button" onclick="onlinePayment()" class="site-btn" style="border-radius:10px;">MAKE PAYMENT</button>`);
		
	}else if(payment=="cash"){
			$(".paymentOrder").html(`<button type="submit"  class="site-btn" style="border-radius:10px;">PLACE ORDER</button>`);
		
	}
	
}

function onlinePayment(){
	console.log("working started");
	let orderId=$("#orderId").val();
	let amount1=$("#totalPricePay").val();
	console.log("==============");
	console.log(amount1);
	console.log(orderId);
	let options={
		key:"rzp_test_7TxMC9UB8XmbM0",
		amount:"900",
		currency:"INR",
		name:"ONLINE ELECTRICAL SHOPEE",
		description:"Payment",
		image:"img/N_logo.jpg",
		order_id:orderId,
		
		handler: function (response){
     // console.log(response.razorpay_signature);
    let pid=response.razorpay_payment_id;
    let oid=response.razorpay_order_id;
    $('#paymentId').val(`${pid}`);
    $('#ROrderId').val(`${oid}`);
   if(pid!=null){
	 $("#orderPayment").html(`	<h5 style="color:green">Payment successfully done!</h5>
							<button type="submit"  class="site-btn" style="border-radius:10px;">PLACE ORDER</button>`);  
   }
    onlineOrderPlace
	console.log(response)},
		prefill: {
			name:"",
			email:"",
			contact:"",
		},
		notes:{
			address:"shdjsk",
		},
		theme:{
			color:"red",
		},
	};

	let rzp=new Razorpay(options);
	rzp.open();
	rzp.on('payment.failed', function (response){
    alert(response.error.code);
    alert(response.error.description);
    alert(response.error.source);
    alert(response.error.step);
    alert(response.error.reason);
    alert(response.error.metadata.order_id);
    alert(response.error.metadata.payment_id);
})
	
}












