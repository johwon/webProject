const all = document.querySelector("#all"); // 전체문단 객체
const slideObj = document.querySelectorAll(".slide"); // 슬라이드 이미지 객체 배열[]
const navLeft = document.getElementById("navgateleft"); // 왼쪽으로 이동
const navRight = document.getElementById("navgateright"); // 오른쪽으로 이동
const indicateA = document.querySelectorAll("#indicator > a"); // 하단 인디케이터
let list2 = [0, 100, 200, -100]; // 슬라이드 위치 상태

// 초기 위치 배치
function listArray() {
	for (let i = 0; i < list2.length; i++) {
		slideObj[i].style.left = `${list2[i]}%`;
	}

	// 인디케이터 상태 업데이트
	for (let i = 0; i < indicateA.length; i++) {
		indicateA[i].classList.remove("active");
	}
	indicateA[list2.indexOf(0)].classList.add("active");
}

// 배열 인덱스를 순환시키는 함수
function calcul(num, num2) {
	return (num + num2) % num2;
}

// 이미지 이동 함수
function moveImg(move) {
	slideObj[list2.indexOf(0)].style.transform = `translate(${move})`;
	slideObj[calcul(list2.indexOf(0) + 1, list2.length)].style.transform = `translate(${move})`;
	slideObj[calcul(list2.indexOf(0) - 1, list2.length)].style.transform = `translate(${move})`;
}

// 이미지 이동에 트랜지션 적용
function transitionImg(second) {
	slideObj[list2.indexOf(0)].style.transition = `${second}`;
	slideObj[calcul(list2.indexOf(0) + 1, list2.length)].style.transition = `${second}`;
	slideObj[calcul(list2.indexOf(0) - 1, list2.length)].style.transition = `${second}`;
}

// 좌측 이동 버튼 클릭 시
navLeft.addEventListener("click", () => {
	transitionImg("1s");
	moveImg("100%");
	setTimeout(() => {
		transitionImg("0s");
		moveImg("0");
		list2.push(list2.shift()); // 배열 순서 업데이트
		listArray(); // 슬라이드 위치 갱신
	}, 1000);
});


// 우측 이동 버튼 클릭 시
function moveRight() {
	transitionImg("1s");
	moveImg("-100%");
	setTimeout(() => {
		transitionImg("0s");
		moveImg("0");
		list2.unshift(list2.pop()); // 배열 순서 업데이트
		listArray(); // 슬라이드 위치 갱신
	}, 1000);
}

navRight.addEventListener("click", moveRight);

// 슬라이드 자동 전환
let timerID;
function startTimer() {
	timerID = setInterval(moveRight, 3000);
}
startTimer();

// 마우스 진입/탈출 시 자동 슬라이드 멈추기/재개
all.addEventListener("mouseenter", () => {
	clearInterval(timerID);
});
all.addEventListener("mouseleave", () => {
	startTimer();
});

// 인디케이터 클릭 시 슬라이드 전환
for (let i = 0; i < indicateA.length; i++) {
	indicateA[i].addEventListener("click", () => {
		list2 = [0, 0, 0, 0]; // 배열 초기화
		list2[calcul(i + 1, list2.length)] = 100;
		list2[calcul(i - 1, list2.length)] = -100;
		list2[calcul(i + 2, list2.length)] = 200;
		listArray();
	});
}

listArray(); // 초기 슬라이드 상태 설정
