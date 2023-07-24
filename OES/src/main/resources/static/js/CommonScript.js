//================== Cart started=============================

function add_to_cart(pid, pname, pprice, pimagename)
{
	let cart=localStorage.getItem("cart");
	
	//no products in cart
	if(cart==null){
			let Product =[];
			let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice, pImageName:pimagename}
			Product.push(product);
			localStorage.setItem("cart", JSON.stringify(Product));	
			showToast("Product is added to cart")
	}
	
	//already some products in cart
	else{
		let pcart=JSON.parse(cart);
		
		let oldProduct= pcart.find((item)=> item.productId==pid)
		
		
		if(oldProduct){
			//if cart have old product then just increase quantity
			oldProduct.productQuantity = oldProduct.productQuantity+1
			pcart.map((item) =>{
				if(item.productId == oldProduct.productId){
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast("product quantity is increases")
		}
		
		
		else{
			//we get new product then add it into a cart
			let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice,  pImageName:pimagename}
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
    		showToast("product  is added")
		}
	}
	updateCart();
	
}


//update cart
function updateCart(){
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart == null || cart.length == 0){
		console.log("cart is empty")
		$(".cartItem").html("0");
		$(".totalOrder").html("00.00");
		$(".totalPrice").html("00.00");
		$(".charges").html("00.00");
		$("#product").html("00.00");
		$("#checkoutbutton").html("go to shopping cart and do shopping");
		
		
		$(".shoping_cart_body").html("<h1>Cart Does Not Have Any Items</h1>");
	}else{
		$("#product").html(` ${cart.length}`);
		console.log(cart.length)
		$(".cartItem").html(` ${cart.length}`);
		 $('#cartlegth').val(`${cart.length}`);
	
		let table=`
		
		<table>
							<thead>
								<tr>
									<th class="shoping__product">Products</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>Remove</th>
									
								</tr>
							</thead>
							`;
							let totalPrice=0;
							cart.map((item)=>{
								table+=`
								
								<tbody>
								<tr>
									<td class="shoping__cart__item"><img
										src="img/latest-product/${item.pImageName}"
										alt="product_image" style="height: 80px">
										<h5> ${item.productName}</h5></td>
									
									<td class="shoping__cart__price"> ${item.productPrice}</td>


									<td><input type="button"onclick='decrementQuantity(${item.productId})' value="-"/>
									
									 <input name="quantity" value="${item.productQuantity}" maxlength="2" max="10"
										size="1" /> 
										<input type="button" onclick='incrementQuantity(${item.productId})' value="+"/></td>
									<td class="shoping__cart__total">${item.productQuantity * item.productPrice} </td>

									<td><button class="remove-btn" onclick='deleteItemCart(${item.productId})'>Remove</button></td>

									
								</tr>
							</tbody> `
							
						totalPrice = totalPrice + item.productPrice*item.productQuantity;
							})
							
							
		table= table+`</table>	`
		$(".shoping_cart_body").html(table);
		if(totalPrice>999){
			$(".charges").html("Rs.00.00");
			$(".totalPrice").html(`Rs. ${totalPrice}`);
			 $('#totalPricePay').val(`${totalPrice}`);
		}else{
			$(".charges").html("Rs.100");
			$(".totalPrice").html(`Rs. ${totalPrice+ 100} `);
			 $('#totalPricePay').val(`${totalPrice+100}`);
		}
		
		$(".totalOrder").html(`Rs. ${totalPrice}`);
		
		 $('#totalPrice').val(`${totalPrice}`);
		 
		
		let checkout=`
			
					<table>
							<thead>
								<tr class="checkout__order__products"><th>Products</th>
									<th>Quantity</th>
									<th>Price</th>
								<tr>
							</thead>
						`;
						var i=0;
					cart.map((item)=>{ 
						i+=1;
				checkout+=`
						<tbody>
								<tr>
									<td>${i} . ${item.productName}</td>
									<td> ${item.productQuantity}</td>
									<td> ${item.productPrice * item.productQuantity}</td>
								</tr>
						</tbody>
						`
						
			})
			checkout+=`</table>`
		
		$(".check").html(checkout);
	
	
	//=============making orders=================
							var i=0;
								cart.map((item)=>{
								
								i+=1
								 $('#productIdO'+i).val(`${item.productId}`);
								  $('#productNameO'+i).val(`${item.productName}`);
								   $('#productQuantityO'+i).val(`${item.productQuantity}`);
								    $('#productPriceO'+i).val(`${item.productPrice}`);
								   						
							
							})
							
		
	//===============================
	
	}
	}
	
	
	//delete item from cart
	function deleteItemCart(pid){
	let cart=JSON.parse(localStorage.getItem("cart"));
	
	let newcart=cart.filter((item) => item.productId !=pid)
	
	localStorage.setItem('cart', JSON.stringify(newcart))
	updateCart();
	}
	
	
	
	
	
	//increment quantity in cart
	function incrementQuantity(pid){
	
	let cart=JSON.parse(localStorage.getItem("cart"));
	
	let oldProduct=cart.find((item) => item.productId ==pid)
	oldProduct.productQuantity=oldProduct.productQuantity+1
	
	cart.map((item) =>{
				if(item.productId == oldProduct.productId){
					item.productQuantity = oldProduct.productQuantity;
				}
			})
	
	localStorage.setItem("cart", JSON.stringify(cart));
			console.log("product quantity is increases")
	updateCart();
	}
	
	
	//decrement quantity in cart
	function decrementQuantity(pid){
	
	let cart=JSON.parse(localStorage.getItem("cart"));
	
	let oldProduct=cart.find((item) => item.productId ==pid)
	if(oldProduct.productQuantity>1){
	oldProduct.productQuantity=oldProduct.productQuantity-1
	
	cart.map((item) =>{
				if(item.productId == oldProduct.productId){
					item.productQuantity = oldProduct.productQuantity;
					
				}
			})
			console.log("product quantity is decreases")
			localStorage.setItem("cart", JSON.stringify(cart));
			updateCart();
			}
	}
	
	
	//clear cart
	function clearCart(){
		
	localStorage.removeItem('cart');
	updateCart();
	}
	
	
	
		
	//cart update function calling
	$(document).ready(function(){
		updateCart()
	})
	
	//================== Cart end=============================
	
	
//==================Product Added message==================
function showToast(content){
	$("#toast").addClass("display");
		setTimeout( ()=>{
			$("#toast").removeClass("display");
			},2000)	
			
	$("#toast").html(content);
}



//===================Like Products=======================================

function likeProducts(pid, pname, pprice, pimagename)
{
	let like=localStorage.getItem("like");
	
	//no products in like
	if(like==null){
			let LikeProduct =[];
			let likeproduct = {lproductId: pid, lproductName: pname, lproductPrice: pprice, lImageName:pimagename }
			LikeProduct.push(likeproduct);
			localStorage.setItem("like", JSON.stringify(LikeProduct));	
			showToast("Product is added to like")
	}
	
	//already some products in like
	else{
		let plike=JSON.parse(like);
		
		let oldProductlike= plike.find((item)=> item.lproductId==pid)
		if(oldProductlike){
			//if like have old product then remove it
			let newlike=plike.filter((item) => item.lproductId !=pid)
	        localStorage.setItem('like', JSON.stringify(newlike))
			showToast("product remove from favorite")
		}
		else{
			//we get new product then add it into a like
			let likeproduct = {lproductId: pid, lproductName: pname,  lproductPrice: pprice, lImageName:pimagename}
			plike.push(likeproduct);
			localStorage.setItem("like", JSON.stringify(plike));
    		showToast("product  is added to favorite")
		}
	}
	
	
	updateLike();
	
	
}


function updateLike(){
	let like=JSON.parse(localStorage.getItem("like"));
	if(like==null || like.length==0){
		$("#like_product_body").html("No product added in wishlist");
		console.log("like is empty")
	}else{
		console.log("like length "+like.length)
		$(".likeproduct").html(` ${like.length}`);
			
		let allLikeProducts=`
							
					
						`;
							like.map((item)=>{
								
							
							allLikeProducts+=`
											<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	<div style="border: 1px solid grey;" class="mt-5">
		<div class="featured__item m-4">
			<div class="featured__item__pic set-bg">
				<img style="max-height: 200px; height: auto;" class="center"
					src="img/latest-product/${item.lImageName}">
				<ul class="featured__item__pic__hover">
					<li><a onclick="likeProducts(${item.lproductId}, '${item.lproductName}', ${item.lproductPrice}, '${item.lImageName}')" ><i class="fa fa-heart"></i></a></li>
					<li><a href="#"><i class="fa fa-retweet"></i></a></li>
				</ul>
			</div>

			<div class="featured__item__text">
				<h6>
					<a href="Product-details.jsp?product= ${item.lproductId}"
						style="color: black"> ${item.lproductName}</a>
				</h6>

				<button type="button" class="btn btn-light">
					<h5>Rs. ${item.lproductPrice}/- 
					</h5>
				</button>

				<a href="#" class="primary-btn m-1" style="background-color: red"
				onclick="add_to_cart(${item.lproductId}, '${item.lproductName}', ${item.lproductPrice}, '${item.lImageName}')"
					onMouseOver="this.style.backgroundColor='#808080'"
					onMouseOut="this.style.backgroundColor='red'"> <i
					class="fa fa-shopping-cart"></i>ADD TO CARD
				</a>
				<div>
					<a href="shoping-cart.jsp"  class="btn btn-warning btn-sm mt-1">
						View CART </a>
				</div>

			</div>
		</div>
	</div>
</div>
							`
							})
	
		$("#like_product_body").html(allLikeProducts);
		
	}
	
}

	
	//like update function calling
	$(document).ready(function(){
		updateLike()
	})



//========================Like Products end===============


//===================Error & Success Popup================
function orderPlacePopUp(){
	swal("Good job!", "Your Order Place Succesfully!", "success");
	}

function addressrErrorPopUp(){
	swal("Oops!", "Please Insert Your Address!", "error");
	}
	
function msgErrorPopUp(){
	swal("Oops!", "Please select Your Payment Mode!", "error");
	}

	
//========================Download Invoice===============
  function downloadInvoice() {
            html2canvas($('#invoiceDownload')[0], {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("invoice.pdf");
                }
            });
        }
        
 //====================== Logout Warning ===============================
 function logoutWarning(){
	swal({
  title: "Are you sure?",
  text: "Once deleted, you will not be able to recover this imaginary file!",
  icon: "warning",
  buttons: true,
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
    swal("Poof! Your imaginary file has been deleted!", {
      icon: "success",
    });
  } else {
    swal("Your imaginary file is safe!");
  }
});
 }

