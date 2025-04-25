function getLanguageFromCookie() {
	const cookie = document.cookie.split(';').find(cookie => cookie.trim().startsWith('language='));
	if (cookie) {
		return cookie.split('=')[1];
	}
	return 'ko';  // 기본 언어 설정 (ko)
}

function form_check(formType) {
	// formType 유효성 검사
	if (formType !== 'product' && formType !== 'user' && formType !== 'signin' && formType != 'board') {
		console.error('Invalid formType');
		return false;
	}

	// 기본 폼 제출 동작을 방지
	const language = getLanguageFromCookie();

	const messages = {
		ko: {
			productName: "상품명을 입력해주세요.",
			unitPrice: "상품 가격을 입력해주세요.",
			unitPriceInvalid: "상품 가격은 숫자만 입력할 수 있습니다.",
			description: "상품 설명을 입력해주세요.",
			category: "카테고리를 입력해주세요.",
			condition: "상품 상태를 선택해주세요.",
			quantity: "수량을 입력해주세요.",
			quantityInvalid: "수량은 숫자만 입력할 수 있습니다.",
			userId: "사용자 아이디를 입력해주세요.",
			userName: "사용자 이름을 입력해주세요.",
			userPW: "비밀번호를 입력해주세요.",
			userPhone: "전화번호를 입력해주세요.",
			userPhoneInvalid: "전화번호는 숫자만 입력해주세요.",
			userEmail: "이메일을 입력해주세요.",
			userEmailInvalid: "유효한 이메일을 입력해주세요.",
			birthDate: "정말로 1901년 1월 1일생이십니까?",
			userIdInvalid: "아이디는 5자 이상 20자 이하의 알파벳과 숫자로만 구성되어야 합니다.",
			userPWInvalid: "비밀번호는 6자 이상 30자 이하의 알파벳과 숫자로만 구성되어야 합니다.",
			boardSubject: "게시판 제목을 입력해주세요.",
			boardMessage: "게시판 메시지를 입력해주세요.",
			boardMessageTooLong: "게시판 메시지는 3000자를 넘길 수 없습니다."			
		},
		en: {
			productName: "Please enter the product name.",
			unitPrice: "Please enter the product price.",
			unitPriceInvalid: "The product price can only contain numbers.",
			description: "Please enter a description for the product.",
			category: "Please enter the category.",
			condition: "Please select the condition of the product.",
			quantity: "Please enter the quantity.",
			quantityInvalid: "Quantity can only contain numbers.",
			userId: "Please enter your user ID.",
			userName: "Please enter your user name.",
			userPW: "Please enter your password.",
			userPhone: "Please enter your phone number.",
			userPhoneInvalid: "Phone number can only contain numbers.",
			userEmail: "Please enter your email address.",
			userEmailInvalid: "Please enter a valid email address.",
			birthDate: "Are you sure you were born on January 1st, 1901?",
			userIdInvalid: "The user ID must be between 5 and 20 characters, containing only letters and numbers.",
			userPWInvalid: "The password must be between 6 and 30 characters, containing only letters and numbers.",
			boardSubject: "Please enter the board subject.",
			boardMessage: "Please enter the board message.",
			boardMessageTooLong: "The board message cannot exceed 3000 characters."
		}
	};

	function validateField(field, messageKey, regex) {
		if (!field.value) {
			alert(language === "en" ? messages.en[messageKey] : messages.ko[messageKey]);
			field.focus();
			return false;
		}
		if (regex && !regex.test(field.value)) {
			alert(language === "en" ? messages.en[`${messageKey}Invalid`] : messages.ko[`${messageKey}Invalid`]);
			field.focus();
			return false;
		}
		if (maxLength && field.value.length > maxLength) {
			alert(language === "en" ? messages.en[`${messageKey}TooLong`] : messages.ko[`${messageKey}TooLong`]);
			field.focus();
			return false;
		}
		return true;
	}

	// 공통 필드 검증 (상품 관련 또는 사용자 관련)
	if (formType === 'product') {
		if (!validateField(document.getElementById("productName"), "productName")) return false;
		if (!validateField(document.getElementById("unitPrice"), "unitPrice", /^\d+(\.\d{1,2})?$/)) return false;
		if (!validateField(document.getElementById("description"), "description")) return false;
		if (!validateField(document.getElementById("category"), "category")) return false;
		const condition = document.querySelector('input[name="condition"]:checked');
		if (!condition) {
			alert(language === "en" ? messages.en.condition : messages.ko.condition);
			return false;
		}
		if (!validateField(document.getElementById("quantity"), "quantity", /^\d+$/)) return false;
	}
	else if (formType === 'user') {
		if (!validateField(document.getElementById("userId"), "userId")) return false;
		if (!validateField(document.getElementById("userPW"), "userPW")) return false;
		if (!validateField(document.getElementById("userName"), "userName")) return false;
		if (!validateField(document.getElementById("userPhone"), "userPhone", /^\d+$/)) return false;
		let userYear = document.getElementById("birthYear").value;
		let userMonth = document.getElementById("birthMonth").value;
		let userDay = document.getElementById("birthDay").value;
		if (userYear === "1901" && userMonth === "1" && userDay === "1") {
			alert(language === "en" ? messages.en.birthDate : messages.ko.birthDate);
			return false;
		}
		if (!validateField(document.getElementById("userEmail"), "userEmail", /\S+@\S+\.\S+/)) return false;
	} else if (formType === 'signin') {
		// userId 유효성 검사
		const userIdField = document.getElementById("userId");
		if (!validateField(userIdField, "userId", /^[a-zA-Z0-9]{5,20}$/, 5)) return false;

		// userPW 유효성 검사
		const userPWField = document.getElementById("userPW");
		if (!validateField(userPWField, "userPW", /^[a-zA-Z0-9]{6,30}$/, 6)) return false;

		// 모든 필드가 유효하면 폼 제출
		return true;
	} else if (formType === 'board') {
		if (!validateField(document.getElementById("userName"), "userName")) return false;
		if (!validateField(document.getElementById("boardSubject"), "boardSubject")) return false;
		if (!validateField(document.getElementById("boardMessage"), "boardMessage", null, 3000)) return false;
	}

	return true; // 폼 제출
}
