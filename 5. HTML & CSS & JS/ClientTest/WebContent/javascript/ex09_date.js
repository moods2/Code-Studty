//날짜 시간 자료형
// - new Date()
// - object(자료형)

//현재 시각
var now = new Date(); //Calendar.getInstance()
console.log(now.toLocaleString()); //2020-7-1 2:21:31 ├F10: PM┤

//c.get(Calendar.YEAR)
console.log(now.getYear()); //120
console.log(now.getFullYear()); //2020
console.log(now.getMonth()); //6(0부터시작)
console.log(now.getDate()); //1
console.log(now.getDay()); //3(일(0) ~ 토(6))
console.log(now.getHours()); //14
console.log(now.getMinutes()); //21
console.log(now.getSeconds()); //31
console.log(now.getMilliseconds()); //0.899
console.log(now.getTime()); //1593580891899 틱값

//출력
console.log(now);
console.log(now.toString());
console.log(now.toLocaleString()); //현재 지역 설정

console.log(now.toLocaleDateString()); //년,월,일
console.log(now.toLocaleTimeString()); //시,분,초

//특정 시각 만들기
var christmas = new Date();
christmas.setMonth(11);
christmas.setDate(25);
console.log(christmas.toString());

var birthday = new Date(1995, 7, 23);
var birthday2 = new Date(1995, 7, 23, 12, 20, 30);
console.log(birthday.toString());
console.log(birthday2.toString());

//연산
console.log(christmas - now); //15292800010

//오늘 + 100일
//시각 + 시간
// console.log(now + 1);
//c.add(Calendar.DATE, 100);

var result = new Date();
result.setTime(now.getTime() + (100 * 24 * 60 * 60 * 1000));
console.log(result.toString());