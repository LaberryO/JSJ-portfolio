function gotoIndex(id,event) {
	console.log(id, event);
	event.preventDefault();
	const pathName = window.location.pathname;
	const index = "/jungseungjae-portfolio/index.jsp";
	const link = document.getElementById(id);
		
	if (pathName === index) {
		link.scrollIntoView({ behavior: "smooth" });
	} else {
		window.location.href = `${index}#${id}`;
	};
	
	return false;
};