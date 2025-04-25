function checkStatus() {
	// 현재 URL에서 쿼리 파라미터 가져오기
	const url = new URL(window.location.href);
	const params = new URLSearchParams(url.search);

	// 파라미터 값 가져오기
	const paramValue = params.get("status");

	// 메시지 객체
	const messages = {
		cart: {
			ko: "장바구니에 상품이 추가되었습니다.",
			en: "The product has been successfully added to your cart."
		},
		DeleteSingleCart: {
			ko: "장바구니에서 해당 항목을 제거했습니다.",
			en: "The item has been removed from your shopping cart."
		},
		DeleteCart: {
			ko: "장바구니를 비웠습니다.",
			en: "You have emptied your shopping cart."
		},
		register: {
			ko: "회원가입에 성공하였습니다.",
			en: "Your account has been successfully registered."
		},
		IdNotFound: {
			ko: "아이디가 올바르지 않거나, 존재하지 않습니다.",
			en: "The ID is incorrect or does not exist."
		},
		IncorrectPW: {
			ko: "비밀번호가 올바르지 않습니다.",
			en: "The password is incorrect."
		},
		login: {
			ko: "로그인에 성공하였습니다.",
			en: "Your account has been successfully logged in."
		},
		logout: {
			ko: "로그아웃에 성공하였습니다.",
			en: "Your account has been successfully logged out."
		},
		InvalidRequest: {
			ko: "잘못된 접근입니다.",
			en: "Invalid request."
		},
		AddProduct: {
			ko: "상품이 성공적으로 추가되었습니다.",
			en: "The product has been added successfully."
		},
		UpdateProduct: {
			ko: "상품을 성공적으로 수정하였습니다.",
			en: "The product has been updated successfully."
		},
		DeleteProduct: {
			ko: "상품이 성공적으로 제거되었습니다.",
			en: "The product has been removed successfully."
		},
		NeedLogin: {
			ko: "로그인이 필요합니다.",
			en: "You must log in."
		},
		AddContact: {
			ko: "문의가 접수되었습니다.",
			en: "Your inquiry has been received."
		}
	};

	// 언어 확인 (기본값: ko)
	const language = getCookie("language") || "ko";

	// 메시지 출력
	if (paramValue && messages[paramValue]) {
		alert(messages[paramValue][language]);
	}

	// 파라미터 제거 및 URL 업데이트
	editParam();
}

function getCookie(name) {
	const value = `; ${document.cookie}`;
	const parts = value.split(`; ${name}=`);
	if (parts.length === 2) return parts.pop().split(';').shift();
	return null;
}

function editParam() {
	// 현재 페이지의 URL 가져오기
	const url = new URL(window.location.href);

	// URLSearchParams 객체 생성
	const params = new URLSearchParams(url.search);

	// 파라미터 제거
	params.delete('status'); // 'status' 파라미터를 제거

	// URL에 쿼리 문자열을 반영
	url.search = params.toString();

	// 히스토리 상태를 변경하여 페이지를 새로 고침하지 않고 URL 수정
	window.history.replaceState({}, '', url);
}

// 상태 메시지 확인
checkStatus();