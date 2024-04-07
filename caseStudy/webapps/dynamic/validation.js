function checkUsername() {
	let username = document.getElementById("username").value;
	let xhr = new XMLHttpRequest();
	xhr.open(
		"GET",
		"ValidationServlet?username=" + username,
		true
	);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200) {
				let response = JSON.parse(xhr.responseText);
				document.getElementById("usernameHint").innerText =
					response.hint;
			} else {
				console.error("Error:", xhr.status);
			}
		}
	};
	xhr.send();
}
