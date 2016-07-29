# FastCampus iOS School

# The content of lecture

### Week1

Day1 : The organization of the computer

1. the history of the computer

Mathematicians have created a mechanism for rapid calculation = calculator = computer * using binary system for fast operation

1st generation of computers : ENIAC, vacuum tube

2nd generation of computers : Transistor

3rd generation of computers : Integrated circuit(IC)

2. The organization of the computer

Hardware

Input and output devices : all devices connected to the computer that be able to make an input and an output
Data storage : devices from which the computer writes data to be used. Main storage(RAM), Secondary storage(Hard disk)

Operation/control device : CPU

Software

System software loader, devices driver, OS, compiler, assembler, linker etc.

All the programs that run in OS software applications

3. The structure of a computer

Harvard architecture : instruction memory, separated form of the data memory

Advantages : It does not occur bottleneck phenomenon because memory is separated each parts.
Disadvantages : It requires each circutes to excute program

Von Neumann architecture : It shares into one memory.

Advantages : It can be designed without changing the structure with only the internal program.
Disadvantages : It can occur because it shares one memory.
** Today's computers are used as the two structures according to the purpose.

Day2 : The operation of the computer and operating system

The operation of the computer(AND, OR, XOR)

operating system

__Day3 : Data Structures, algorithms, and database __

1. Data Structures

Raw Structure: integers, real numbers , characters
Linear structure

List structure
Stack
Queue
Deque
Nonlinear narrative

Graph
Tree
2. Algorithms

__Day4 : Networks and encryption __

Day5 : Software Engineering

### week2

Day6 : Programming language

Day7 : Review and explain of git basics

Day8 : basic of X-Code and C-language

1. XCode Basic Usage, UI excercise through the calculator example - route : SchoolCode/Lecture/week2/day8/

2. C-language basics

The default variable type declarations, function declarations and a description of CamelCase, camelBackCase

Day9

C-language basics - 2nd

Conditional sentence = if, switch, comparison operators(>, <, <= ...), conditional operator(&&, ||) and practice through the excercise of loop sentence

Creating 369 games : SchoolCode/Lecture/week2/day9/369GameProject/MultiplicationProject/main.m

10일차

Review and practical exercise

The default variable declaration, type, declaration of the function , conditionals , loop sentences and comparison and conditional operators

Exercise : 

swap : change two values
-> SchoolCode/Homework/ToolBox/ToolBox/
Obtaining triangular number of triangular number and specific  multiple numbers
-> SchoolCode/Lecture/week2/day10/TriangleProject/TriangleProject/
D-Day구하기(단, 현재일과 기준일을 입력받는다.)

### week3

11일차

실습 D-Day구하기2 : ios/Homework/Day11/Day11/main.m (강사님 예시)

Objective-C 변수 값타입 : NSInteger, CGFloat, BOOL, NSString

참조형 타입 : id, ClassName * (모든 객체는 참조형타입)

실습 성적총점 및 평균 구하기,구구단 출력하기 ios/Example/Day_Exam/Day_Exam/main.m

기본 데이터 클래스

배열 : NSArray, NSMutableArray ... 같은 타입의 자료가 연속적으로 저장된다. 인덱스를 통하여 데이터를 접근, 관리한다.

NSArray는 id type을 받는 정적배열 객체이다.(Objective-C에서만 사용 가능) @[@1,@2,@3]

NSMutableArray는 동적배열이다. * list자료형 구조를 가진 배열

문자열 : NSString Foundtion Framework에 수록 Objective-C에서 사용하는 문자열 @"[문자열]"을 사용함

숫자형 : NSNumber, NSInteger 등 단, 참조형의 경우에는 실제 연산이 불가능하다. ex)

    NSNumber @3 + @5 = ?   => (Error)
    NSInteger 3 + 5  = ?   => 8
    NSNumber *num1 = @3, *num2 = @5
    num1.integerValue + num2.integerValue = ? => 8

    if(num1 < num2){
      NSLog(@"TRUE");
    }

    //For In 구문 
    for [type *name] in [collection]{

    }
객체지향

OOP(Object-Oriented Programming)? 프로그래밍 패러다임중 현실세계의 모든 사물을 "객체화" 한것을 말한다.
(하나의 독립된 단위, 메세지단위로 데이터를 처리)
\*\* 단점 : 필요한것 외에것을 다 가져와야한다, 설계가 힘들고 속도가 느리다,

클래스 : 같은 종류 집단에 속하는 행위와 속성을 정의한것
변수와 함수(메서드)로 구성되어 있다.

객체 : 클래스가 인스턴스(실제로 메모리에상에 할당된것    )이다.
\* _nil_ 상태는 객체의 실제 주소값이 할당되지 않았을 경우 나타난다.

메서드 : 클래스로 부터 생성된 객체를 사용하는 방법으로 메세지를 통해 객체에 명령이 전달된다.
12일차

Objective-C 기초

1. 클래스와 객체

선언부(Interface) 헤더 파일 내 @interface ~ @end 사이에 기록 메서드, 프로퍼티를 선언한다.

구현부(Implementation) 클래스의 인스턴스 변수 및 메서드의 구현 실제코드가 담긴다. .m 파일에 @implementation @end 사이에 기록을 한다.

    @implementation [ClassName] : NSObject
    {
      NSString *name; //인스턴스 변수
    }
    -([리턴타입]) 식별자:(타입)매개변수명 .... {
      //실행부
    }
    @End
* 실습 : ios/Example/TestScore/TestScore/main.m : ios/Example/TestScore/TestScore/CalculationScore.*

인스턴스화와 초기화

  Car *evoke =[[Car alloc]init];
  Car *evoke = new Car();
* alloc : 객체를 사용하기 위한 메모리 공간을 확보한다.
* init : 객체를 쓰기 위한 초기화를 한다. ex) alloc은 그림을 그리기 위한 캔버스가 만들어지고 초기화는 그 그림을 그리기 위해 준비가 된 상태이다.

상속 : 새로운 클래스가 기존의 클래스의 속성(자료)와 행위(연산)을 이용할수 있게 하는 기능

@Implementation Car : NSObject : NSObject를 상속 받는다

메소드 : 인스턴스가 수행하는 행동 [-,+] ([type])[식별자1]:([type])[매개변수명] [식별자2]:([type])[매개변수명]

실습 : ios/Example/TestScore/TestScore/ToolBox.*

14일차

리뷰 및 자습 과 실습 CardDeck : ios/Homework/CardDeck/CardDeck/

15일차

따라치기 VendingMachine : /ios/Example/VendingMachine/VendingMachine/.

### week4

16일차 어플리케이션 생명주기 메인루프동작모식도에 따른 App의 작동 순서 AppDelegate내부의 작동이 어떻게 되는가? MVC모델로 살펴보는 구조

17일차

1. 리뷰 alloc 과 dealloc 작동 클래스메서드와 인스턴스메서드 안에서의 작동 * Application에서 강제로 종료가 났을경우 ARC에서 정보를 가지고 있다가 그 시점과 동시에 종료 ( Garbage Collection과는 다르다. 비슷한 역활을 한다.)

2. StoryBorad 익히기 StoryBoard를 이용한 클래스컨트롤 연결 및 버튼 액션 추가

3. AutoLayout

18일차 자료구조실습 실습을 통한 Stack구조 이해 * ios/Example/DataStructure/Algorism/main.c

19일차

ARC란? compiler time단에서 자동적으로 메모리를 해제해준다. Property란? 외부에서 객체의 내부변수를 접근하기 위한 부분이다.

5주차

21일차 자료구조 & 알고리즘 두번째 시간

스택을 이용한 프로그래밍 시간 괄호 구하기 (배열을 구할때와 스택을 이용한 방법을 구할때가 다른다.) 큐와 덱 표현하기
* 실습 : ios/Example/DataStructure/DS_Secnon/main.m

22일차

iOS구조파악
SandBox
FrameWork계층구조
Size Resolution
UIComponent

UIView
UILable
UIImageView
* 실습 : ios/Example/UITest/ViewController.m

23일차

Dynamic Programming
피보나치수 구하기
24일차

UIControl
Delegate 와 Protocol
UITextFieldDelegate
25일차

UIScrolView
Block
Animation
* 과제 : ios/Homework/WebViewTest/*.*

6주차

26일차
27일차 UINavagationController UITabbarController

28일차 그래프를 이용한 지하철 구간 구하기

29일차

30일차 Review

Protocol & Delegate
Block
Dictionary

UX/UI

휴리스틱평가법을 이용한 앱평가 방법
7주차

31일차 UITableView 경로 : ios/Example/CustomTable/*.*
32일차 UITableViewController CustomTableCell만들기 경로 : ios/Example/TableViewExample/*.*

33일차

34일차
8주차

35일차
36이라
37일차
38일차
39일차
9주차

40일차
41일차
42일차
43일차
44일차
10주차

45일차
46일차
47일차
48일차
49일차
프로젝트
