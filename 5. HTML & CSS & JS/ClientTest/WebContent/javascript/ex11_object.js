/*

자바스크립트 객체
1. 내장 객체
    - Array, Date, Math 등..

2. BOM 객체
3. DOM 객체
4. 사용자 정의 객체
    - 클래스를 사용해서 객체를 생성하는 것과 유사 작업

사용자 정의 객체 생성
1. Object 클래스 사용
2. {} : 객체 리터럴(*****)

자바 + 홍길동 객체 생성

class User {
    private String name;
    private int age;
    private String address;
}

User hong = new User();
User lee = new User();

*/

var hong = new Object(); //무소유 순수 객체
hong.name = "홍길동"; //프로퍼티 생성
console.log(hong.name);
hong.age = 20;
hong.address = "서울시 강남구";
console.log(hong.age);
console.log(hong.address);
console.log(hong);

var lee = new Object();
lee.name = "이순신";
lee.age = 30;
lee.address = "부산"
console.log(lee);


//객체 리터럴
var haha = {}; //new Object()
haha.name = "하하하";
haha.age = 20;
haha.address = "서울시";
console.log(haha);

var hoho = { name: "호호호", age: 20, address: "서울시" };
console.log(hoho);

var huhu = {
    name: "후후후", //멤버변수(X) -> 프로퍼티(O)
    age: 20,
    address: "서울시"
}


//프로퍼티 접근 방법
console.log(huhu.name); //읽기 - 멤버 접근 연산자
huhu.name = "후후후후후후"; //쓰기

console.log(huhu["name"]); //읽기 - 연관 배열 접근 방법(indexer)

huhu["gender"] = "남자";
huhu.height = 180;

huhu["mobile-number"] = "010"; //쓰지 말것

console.log(huhu);


//프로퍼티 삭제
delete huhu.gender;
console.log(huhu);


//향상된 for문
// - 배열, 컬렉션 탐색(X)
// - 객체 프로퍼티 탐색(O)
// - 특정 객체가 가지고 있는 프로퍼티 목록을 탐색하는 제어문
for (var p in huhu) {
    console.log(p);
}


//객체(클래스) 멤버
// 1. 변수
// 2. 메소드

var hong = new Object();
hong.name = "홍길동";
hong.age = 20;

//익명 함수
hong.hello = function() {
    console.log("안녕하세요. 저는 " + this.name + "입니다.");
};

console.log(hong);
hong.hello();


var hong = {
    name: "홍길동",
    age: 20,
    hello: function() {
        console.log("안녕하세요. 저는 " + this.name + "입니다.")
    }
};

hong.hello();


//서울시 강남구 역삼동 20번지
hong.address = "서울시 강남구 역삼동 20번지";

//자바 -> 멤버 변수 -> 다른 클래스 형
// class User {
//     private String name;
//     private Address address;
// }

var hong = {
    name: "홍길동",
    age: 20,
    hello: function() {

    },
    // address: "서울시 강남구 역삼동 20번지"
    address: {
        sido: "서울시",
        gugun: "강남구",
        dong: "역삼동",
        bunji: "20번지"
    },
    job: ["학생", "직장"]
};

//동?
console.log(hong.address);
console.log(hong.address.dong);
console.log(hong["address"]["dong"]);

//직업
console.log(hong.job);
console.log(hong.job[0]);
console.log(hong.job[1]);


//생성자 함수(=클래스 역할)
// - 함수 일종
// - 목적이 객체를 만드는데 사용하는 전용 함수
// - 표기법(대문자 시작, 파스칼 표기)

var user = {
    name: "홍길동",
    age: 20,
    hello: function() {}
};

//생성자 함수
function User(name, age) {
    this.name = name;
    this.age = age;
    this.hello = function() {
        console.log(this.name);
        console.log(this.age);
    };
};

var hong = new User("홍길동", 20);
//hong.name = "홍길동"
hong.hello();

var lee = new User("이순신", 30);
//lee.name = "이순신"
lee.hello();

var list = [];
var today = new Date();

console.log(typeof hong);
console.log(typeof lee);
console.log(typeof list);
console.log(typeof today);
console.log("----------------");
console.clear();

console.log(hong.constructor);
console.log(lee.constructor);
console.log(list.constructor);
console.log(today.constructor);

console.log(hong.constructor == lee.constructor);
console.log(hong.constructor == list.constructor);