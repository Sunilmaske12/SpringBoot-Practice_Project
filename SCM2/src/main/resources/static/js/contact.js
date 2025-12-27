const baseUrl = "http://localhost:8080";


// set the modal menu element
const targetEl = document.getElementById('contactModal');

// options with default values
const options = {
	backdrop: 'dynamic',
	backdropClasses:
		'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
	closable: true,
	onHide: () => {
		console.log('modal is hidden');
	},
	onShow: () => {
		console.log('modal is shown');
	},
	onToggle: () => {
		console.log('modal has been toggled');
	},
};

// instance options object
const instanceOptions = {
	id: 'contactModal',
	override: true
};

const contactModal = new Modal(targetEl, options, instanceOptions);

function viewContact(contactID) {
	contactModal.show();
	console.log('contact id ', contactID);
	loadContactByID(contactID);
}

function hideContact() {
	contactModal.hide();
}

function deleteContact(contactID) {
	Swal.fire({
		title: "Are you sure?",
		text: "You won't be able to revert this!",
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Yes, delete it!"
	}).then((result) => {
		if (result.isConfirmed) {
			window.location.replace(baseUrl + "/user/contact/delete/" + contactID);
		}
	});
}



async function loadContactByID(contactID) {
	let data = await (await fetch(baseUrl + "/api/contact/" + contactID)).json();
	console.log(data);

	document.getElementById('contactName').innerHTML = data.name;
	document.getElementById('contactPhone').innerHTML = data.phoneNumber;
	document.getElementById('contactAddress').innerHTML = data.address;
	document.getElementById('contactFavorite').innerHTML = data.favorite ? '<i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>' : '';
	document.getElementById('contactDescrition').innerHTML = data.description;
	document.getElementById('contactWebsiteLink').innerHTML = data.websiteLink;
	document.getElementById('contactLinkden').innerHTML = data.linkedInLink;

	const img = document.getElementById('contactPicture');
	const pictureName = data.picture; // e.g., from AJAX

	if (pictureName) {
		img.src = "/" + pictureName;
	} else {
		img.src = "https://tse3.mm.bing.net/th/id/OIP.dyxjIxJtIRt7O_AfRQbZUAHaHa?cb=12&w=626&h=626&rs=1&pid=ImgDetMain&o=7&rm=3";
	}

	// optional: fallback if image URL is broken
	img.onerror = function() {
		this.src = "https://tse3.mm.bing.net/th/id/OIP.dyxjIxJtIRt7O_AfRQbZUAHaHa?cb=12&w=626&h=626&rs=1&pid=ImgDetMain&o=7&rm=3";
	};

}

