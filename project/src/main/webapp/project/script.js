function idCheck() {
	let value = document.registerForm.id.value;
	if (value == "") {
		alert("아이디를 입력해주세요.");
		document.registerForm.id.focus();
	} else {
		url = "idCheck.jsp?id=" + value;
		window.open(url, "post", "width=300,height=150");
	}
}

function zipcodeCheck() {
	url = "zipcodeCheck.jsp?check=y";
	window.open(url, "post", "toolbar=no ,width=800 ,height=600 , directories = no, status = yes, scrollbars = yes, menubar = no");
}

function dongCheck() {
	let value = document.zipForm.dong.value;
	if (value == "") {
		alert("동이름을 입력해 주세요.");
		document.zipForm.dong.focus();
		return;
	}
	document.zipForm.submit();
}

function sendAddress(zipcode, sido, gugun, dong, bunji) {
	var address = sido + " " + gugun + " " + dong + " " + bunji;
	opener.document.registerForm.zipcode.value = zipcode;
	opener.document.registerForm.address1.value = address;
	opener.document.modifyForm.zipcode.value = zipcode;
	opener.document.modifyForm.address1.value = address;
	self.close();
}



function inputCheck() {
	//패턴검색
	const idPattern = /^[A-Za-z]{4,}/; //영 대소문자, 4글자 이상 입력
	const pwdPattern = /^[A-Z|a-z|0-9]{8,}$/; //영 대소문자,숫자, 6~10자 입력
	const namePattern = /^[가-힣]+$/; //한글로 입력
	const phone1Pattern = /^[0-9]{3,}/; //숫자 3자리이상

	// 객체 가져오기
	const inputID = document.querySelector("#id");
	const inputPWD = document.querySelector("#pwd");
	const inputName = document.querySelector("#name");
	const inputPhone1 = document.querySelector("#phone1");
	const inputPhone2 = document.querySelector("#phone2");
	const inputPhone3 = document.querySelector("#phone3");

	if (document.registerForm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.registerForm.id.focus();
		return;
	}
	if (!(idPattern.test(inputID.value))) {
		alert("아이디 : 영 대소문자, 4글자 이상 입력");
		inputID.focus();
		return;
	};

	if (document.registerForm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.registerForm.pwd.focus();
		return;
	}
	if (!(pwdPattern.test(inputPWD.value))) {
		alert("비밀번호 : 영 대소문자, 숫자 8글자 이상 입력");
		inputPWD.focus();
		return;
	}

	if (document.registerForm.name.value == "") {
		alert("이름을 입력해주세요");
		document.registerForm.name.focus();
		return;
	}
	if (!(namePattern.test(inputName.value))) {
		alert("이름 : 한글로 입력");
		inputName.focus();
		return;
	}

	if (document.registerForm.phone1.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.registerForm.phone1.focus();
		return;
	}
	if (!(phone1Pattern.test(inputPhone1.value))) {
		alert("전화번호 : 숫자 3자리 이상 입력");
		inputPhone1.focus();
		return;
	}

	if (document.registerForm.phone2.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.registerForm.phone2.focus();
		return;
	}
	if (!(phone1Pattern.test(inputPhone2.value))) {
		alert("전화번호 : 숫자 3자리 이상 입력");
		inputPhone2.focus();
		return;
	}

	if (document.registerForm.phone3.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.registerForm.phone3.focus();
		return;
	}
	if (!(phone1Pattern.test(inputPhone3.value))) {
		alert("전화번호 : 전화번호 형식 입력");
		inputPhone3.focus();
		return;
	}

	if (document.registerForm.email1.value == "") {
		alert("이메일을 입력해 주세요.");
		document.registerForm.email1.focus();
		return;
	}
	if (document.registerForm.zipcode.value == "") {
		alert("우편번호를 입력해 주세요.");
		document.registerForm.zipcode.focus();
		return;
	}
	if (document.registerForm.address1.value == "") {
		alert("주소를 입력해 주세요.");
		document.registerForm.address1.focus();
		return;
	}
	if (document.registerForm.address2.value == "") {
		alert("상세주소를 입력해 주세요.");
		document.registerForm.address3.focus();
		return;
	}
	document.registerForm.submit();
}

function modifyCheck() {
	//패턴검색
	const pwdPattern = /^[A-Z|a-z|0-9]{8,}$/; //영 대소문자,숫자, 6~10자 입력
	const namePattern = /^[가-힣]+$/; //한글로 입력
	const phone1Pattern = /^[0-9]{3,}/; //숫자 3자리이상

	// 객체 가져오기
	const inputPWD = document.querySelector("#pwd");
	const inputName = document.querySelector("#name");
	const inputPhone1 = document.querySelector("#phone1");
	const inputPhone2 = document.querySelector("#phone2");
	const inputPhone3 = document.querySelector("#phone3");

	if (document.modifyForm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.modifyForm.pwd.focus();
		return;
	}
	if (!(pwdPattern.test(inputPWD.value))) {
		alert("비밀번호 : 영 대소문자, 숫자 8글자 이상 입력");
		inputPWD.focus();
		return;
	}

	if (document.modifyForm.name.value == "") {
		alert("이름을 입력해주세요");
		document.modifyForm.name.focus();
		return;
	}
	if (!(namePattern.test(inputName.value))) {
		alert("이름 : 한글로 입력");
		inputName.focus();
		return;
	}

	if (document.modifyForm.phone1.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.modifyForm.phone1.focus();
		return;
	}
	if (!(phone1Pattern.test(inputPhone1.value))) {
		alert("전화번호 : 숫자 3자리 이상 입력");
		inputPhone1.focus();
		return;
	}

	if (document.modifyForm.phone2.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.modifyForm.phone2.focus();
		return;
	}
	if (!(phone1Pattern.test(inputPhone2.value))) {
		alert("전화번호 : 숫자 3자리 이상 입력");
		inputPhone2.focus();
		return;
	}

	if (document.modifyForm.phone3.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.modifyForm.phone3.focus();
		return;
	}
	if (!(phone1Pattern.test(inputPhone3.value))) {
		alert("전화번호 : 전화번호 형식 입력");
		inputPhone3.focus();
		return;
	}

	if (document.modifyForm.email1.value == "") {
		alert("이메일을 입력해 주세요.");
		document.modifyForm.email1.focus();
		return;
	}
	if (document.modifyForm.zipcode.value == "") {
		alert("우편번호를 입력해 주세요.");
		document.modifyForm.zipcode.focus();
		return;
	}
	if (document.modifyForm.address1.value == "") {
		alert("주소를 입력해 주세요.");
		document.modifyForm.address1.focus();
		return;
	}
	if (document.modifyForm.address2.value == "") {
		alert("상세주소를 입력해 주세요.");
		document.modifyForm.address3.focus();
		return;
	}
	document.modifyForm.submit();
}

function onLoad(){
		//패턴검색
	   const idPattern = /^[A-Za-z]{4,}/; //영 대소문자, 4글자 이상 입력
	   const pwdPattern = /^[A-Z|a-z|0-9]{8,}$/; //영 대소문자,숫자, 6~10자 입력
	   const namePattern = /^[가-힣]+$/; //한글로 입력
	   const phonePattern = /^\d{3,}$/;	//숫자 3글자 이상 입력

	   // 객체 가져오기
	   const inputID = document.querySelector("#id");
	   const inputPWD = document.querySelector("#pwd");
	   const inputName = document.querySelector("#name");
	   const inputPhone1 = document.querySelector("#phone1");
	   const inputPhone2 = document.querySelector("#phone2");
	   const inputPhone3 = document.querySelector("#phone3");

	   // 폼객체 가져오기
	   const registerFom = document.querySelector(".registerform");

	   // 이벤트리스너
	   inputID.addEventListener("blur",()=>validate(inputID, idPattern, "영 대소문자, 4글자 이상 입력"));
	   inputPWD.addEventListener("blur",()=>validate(inputPWD, pwdPattern, "영 대소문자,숫자, 8자 이상 입력"));
	   /*inputPWD2.addEventListener("blur",()=>{
	       validate(inputPWD2, pwdPattern, "영 대소문자,숫자, 6~10자 입력");
	       if(inputPWD.value !== inputPWD2.value){
	           inputPWD2.nextSibling.textContent = "비밀번호가 일치하지 않습니다."
	           inputPWD2.nextSibling.style.color = "red";
	           inputPWD2.value="";
	           inputPWD2.focus();
	           return;
	       }
	   });*/
	   inputName.addEventListener("blur",()=>validate(inputName, namePattern, "한글로 입력"));
	   
	   //이벤트핸들러
	   function validate(userInput, pattern, message){
	       if(userInput.value.match(pattern)){
	           userInput.nextSibling.textContent = "성공";
	           userInput.nextSibling.style.color = "blue";
	       }else{
	           userInput.nextSibling.textContent = message;
	           userInput.nextSibling.textContent.style.color = "red";
	           userInput.nextSibling.textContent.style.size = "7px";
	           userInput.value = "";
	           userInput.focus();
	           return;
	       }
	   }

	   //폼이벤트
	   registerFom.addEventListener("submit", (e)=>{
	       e.preventDefault;
	       validate(inputID, idPattern, "영 대소문자, 4글자 이상 입력");
	       validate(inputPWD, pwdPattern, "영 대소문자,숫자, 6~10자 입력");
	       validate(inputName, namePattern, "한글로 입력");
	       validate(inputPhone1, phonePattern, "숫자 세자리 이상 입력");
	       validate(inputPhone2, phonePattern, "숫자 세자리 이상 입력");
	       validate(inputPhone3, phonePattern, "숫자 세자리 이상 입력");
	       alert("서버로 전송합니다");
	       document.registerForm.submit();})
}
