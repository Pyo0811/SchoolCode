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

Day10

Review and practical exercise

The default variable declaration, type, declaration of the function , conditionals , loop sentences and comparison and conditional operators

Exercise : 

swap : change two values
-> SchoolCode/Homework/ToolBox/ToolBox/
Obtaining triangular number of triangular number and specific  multiple numbers
-> SchoolCode/Lecture/week2/day10/TriangleProject/TriangleProject/

D-Day caculation (but, the current day must be given)

### week3

Day 11

D-Day caculation2 : SchoolCode/Homework/DdayProject/DdayProject/main.m

Objective-C variable types : NSInteger, CGFloat, BOOL, NSString

Reference types : id, ClassName * (all the object type is a reference type)

practice that calcuating average and total score :  SchoolCode/Lecture/week3/day11/ScoreAvgProject/ScoreAvgProject/main.m
multiplication table : SchoolCode/Lecture/week3/day11/GooGooDanProject/GooGooDanProject/main.m

Reference data types

Arrays : NSArray, NSMutableArray ... The same type of data is stored continuously. Access the data through the index.

NSArary : A static array .(only being used in Objective-c ) @[@1,@2,@3]

NSMutableArray : A dynamic array. * array which has a list data type.

String : Contained in NSString foundtion framework. Uses @"[string]" from Objective-c


Number types : NSNumber, NSInteger etc. but, if it is reference type, it can't be operated

    NSNumber @3 + @5 = ?   => (Error)
    NSInteger 3 + 5  = ?   => 8
    NSNumber *num1 = @3, *num2 = @5
    num1.integerValue + num2.integerValue = ? => 8

    if(num1 < num2){
      NSLog(@"TRUE");
    }

    //For In loop
    for [type *name] in [collection]{

    }
objects

OOP(Object-Oriented Programming)? It is said that all things in the real world of programming paradigms " objectified "
(An independent unit , the data processing with the message units)
\*\* Disadvantages: must bring every additional things and the design is a difficult and slow ,

Class : it defines the behavior and properties belonging to the same type of group
It consists of variables and functions (methods).

Object : class is an instant (allocated on a memory actually )
\* _nil_ : this state is represented if the object is not assigned a real address .

Method : Transmission the commands to the object through the messages in a manner of using the generated object from the class

Day12 

Objective-C basics

1. Class and object

Declaration(Interface) :It declares the recorded methods , and properties within the header files between @interface and @end.

Implementation :  actual code being included in the instance types and methods. recored in the .m file between  @implementation and @end 

    @implementation [ClassName] : NSObject
    {
      NSString *name; //instance type
    }
    -([returnType]) identifier:(type)varaibleName .... {
      //execution unit
    }
    @End
* practice : SchoolCode/Lecture/week3/day12/TestScore/

Instantiation and initialization

  Car *evoke =[[Car alloc]init];
  Car *evoke = new Car();
* alloc : procure the memory space to use the object
* init : initialization to use the object. 

Inheritance : A new feature that enables you to use the class attribute (data) and behavior ( operation) of existing class

@Implementation Car : NSObject (Inheritance from NSObject)

Methods : instance behavior performance [-,+] ([type])[identifer1]:([type])[variableName] [identifier2]:([type])[variableName]

practice : ios/Example/TestScore/TestScore/ToolBox.*

Day14

Review and self-study and practice 
CardDeck : SchoolCode/Homework/CardDeck/CardDeck

Day15

(Mini project) VendingMachine : /ios/Example/VendingMachine/VendingMachine/.

### week4

Day16

How does the internal AppDelegate work in terms of Application lifecycle schem? looking into its structre by MVC pattern

Day17

1. (review) alloc 과 dealloc 작동 클래스메서드와 인스턴스메서드 안에서의 작동 * Application에서 강제로 종료가 났을경우 ARC에서 정보를 가지고 있다가 그 시점과 동시에 종료 ( different from garbage collection. but it is simiar )

2. StoryBorad 익히기 StoryBoard를 이용한 클래스컨트롤 연결 및 버튼 액션 추가

3. AutoLayout : SchoolCode/practice/AutoLayoutPractice/

18일차 

자료구조실습 실습을 통한 Stack구조 이해 * ios/Example/DataStructure/Algorism/main.c

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
