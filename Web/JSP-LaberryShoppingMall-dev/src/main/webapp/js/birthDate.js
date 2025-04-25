function birthYear() {
	// 드롭다운을 채울 연도 범위 설정
	const start = 1901;
	const end = 2024;

	// year select 요소를 선택
	const select = document.getElementById('birthYear');

	// 연도 옵션 생성
	for (let i = start; i <= end; i++) {
	  const option = document.createElement('option');
	  option.value = i;   // option의 value로 연도 설정
	  option.textContent = i;  // option에 표시할 텍스트로 연도 설정
	  select.appendChild(option);  // select에 option 추가
	}
}

function birthMonth() {
	// 드롭다운을 채울 연도 범위 설정
	const start = 1;
	const end = 12;

	// year select 요소를 선택
	const select = document.getElementById('birthMonth');

	// 연도 옵션 생성
	for (let i = start; i <= end; i++) {
	  const option = document.createElement('option');
	  option.value = i;   // option의 value로 연도 설정
	  option.textContent = i;  // option에 표시할 텍스트로 연도 설정
	  select.appendChild(option);  // select에 option 추가
	}
}

function birthDay() {
	// 드롭다운을 채울 연도 범위 설정
	const start = 1;
	const end = 31;

	// year select 요소를 선택
	const select = document.getElementById('birthDay');

	// 연도 옵션 생성
	for (let i = start; i <= end; i++) {
	  const option = document.createElement('option');
	  option.value = i;   // option의 value로 연도 설정
	  option.textContent = i;  // option에 표시할 텍스트로 연도 설정
	  select.appendChild(option);  // select에 option 추가
	}
}

birthYear();
birthMonth();
birthDay();