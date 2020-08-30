//배열
// - Array + Collection

//int[] nums = new int[3];
var nums = new Array();

nums[0] = 100; // [index] :: indexer
nums[1] = 200;
nums[2] = 300;

nums[5] = 600; //이렇게 사용 금지

for (var i=0; i<nums.length; i++) {
    console.log(nums[i]);
}

console.log(nums[6]); //undefined
console.log(nums[100]); //결론 -> 자바스크립트는 배열이 없다. -> 유사 배열(순수 배열이 아닌데 배열처럼 행동하는 객체)
// console.log(n1);

nums["one"] = "하나";
console.log(nums["one"]);
nums[1] = 100; //X

//배열 초기화 리스트
//int[] nums = {100, 200, 300}
var nums2 = [ 100, 200, 300 ];
console.log(nums2[0]);

//배열 생성(빈 배열)
var m1 = new Array(); //객체 생성
var m2 = []; //배열 리터럴

//예외처리
try {
    console.log(name);
} catch(e) {
    console.log("예외 처리");
}

//자바 조건 -> boolean
// - 정수: 0(false), 나머지 숫자(true)
// - 실수: 0.0(false), 나머지 숫자(true)
// - 문자: ""(false), 나머지 문자(true)
var n = 1;
n = 3.14;
n = 0.0;
n = "홍길동";
n = ""; //false
n = null; //false
n = undefined; //false
n = new Date(); //true

if (n) {
    console.log("참");
} else {
    console.log("거짓");
}