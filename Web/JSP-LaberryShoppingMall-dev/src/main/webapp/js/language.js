function changeLanguage(language) {
    let xhr = new XMLHttpRequest();
	xhr.open("POST", "/jungseungjae-portfolio/LanguageController", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.responseText);
			
			location.reload();
		}
	};
	
	let data = "language=" + encodeURIComponent(language);
	
	xhr.send(data);
}

