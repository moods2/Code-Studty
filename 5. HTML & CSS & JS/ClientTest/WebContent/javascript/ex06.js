/*

자바스크립트의 변화
1. BOM
-------->
2. DOM
-------->
3. ES6

ECMAScript2015 == ES6 //중요한 버전
ECMAScript2019 == ES10


변수 선언

1. var 키워드(BOM~DOM~ES6)
    - function-scoped
    - 중복 선언 가능(같은 이름의 변수를 여러번 선언 가능)

2. let 키워드
    - block-scoped
    - 중복 선언 불가능
    - 변수 선언

3. const 키워드
    - block-scoped
    - 중복 선언 불가능
    - 상수 선언(=final 변수)

*/

var num1 = 10;
let num2 = 20;
const num3 = 30; //불변

num1 = 100;
num2 = 200;
// num3 = 300; //Assignment to constant variable.

console.log(num1, num2, num3);

if(true) {
    var num4 = 10; //전역 변수
    let num5 = 20; //지역 변수(if)
    const num6 = 30; //지역 상수(if)
}

console.log(num4, num5, num6);