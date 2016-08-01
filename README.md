# FastCampus iOS School

# The content of lecture

### Week1

- **Day1 : The organization of the computer**

   **1. the history of the computer**

   Mathematicians have created a mechanism for rapid calculation = calculator = computer * using binary system for fast operation

   * 1st generation of computers : ENIAC, vacuum tube

   * 2nd generation of computers : Transistor

   * 3rd generation of computers : Integrated circuit(IC)

   **2. The organization of the computer**

   Hardware

   * Input and output devices : all devices connected to the computer that be able to make an input and an output
   * Data storage : devices from which the computer writes data to be used. Main storage(RAM), Secondary storage(Hard disk)
   * Operation/control device : CPU

   Software
  
   * System software loader, devices driver, OS, compiler, assembler, linker etc.
   * All the programs that run in OS software applications

   **3. The structure of a computer**

   * Harvard architecture : instruction memory, separated form of the data memory

     * Advantages : It does not occur bottleneck phenomenon because memory is separated each parts.
     * Disadvantages : It requires each circutes to excute program

   * Von Neumann architecture : It shares into one memory.

     * Advantages : It can be designed without changing the structure with only the internal program.
     * Disadvantages : It can occur because it shares one memory.

   ** **Today's computers are used as the two structures according to the purpose.**

- **Day2 : The operation of the computer and operating system**

   **The operation of the computer(AND, OR, XOR)**

   **operating system**

- **Day3 : Data Structures, algorithms, and database**

   **1. Data Structures**

   * Raw Structure: integers, real numbers , characters
   * Linear structure

     * List
     * Stack
     * Queue
     * Deque
     * Nonlinear narrative

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

1. (review) alloc and dealloc : Work within the class and instance methods. if the shutdown force wakes up in the application, the ARC gets the information from that point and exits at the same time.( different from garbage collection. but it is simiar )

2. StoryBorad practice : Class connectivity and control button actions added using StoryBoard
(Route : SchoolCode/Lecture/week4/day17/Test17/ )

Day18

practical exercise to understand stack structure : SchoolCode/Lecture/week4/day18/Stack1/

Day19

What is ARC? -> allows you to automatically release the memory compiler time 
What is Property? -> the part for accessing the internal variable from external object
(Route : SchoolCode/Lecture/week4/day19/Example0519_2/ )

Day20

AutoLayout practice : SchoolCode/Lecture/week4/day20/AutoLayout/

### week5

Day21 

Practice data structures and algorithms with c-language 

inital consonant convert : SchoolCode/Lecture/week5/day21/ChosungConvert/
Editor : SchoolCode/Lecture/week5/day21/Editor/
ParenthesisString : ParenthesisString
Queue : SchoolCode/Lecture/week5/day21/Queue/

Day22

understanding iOS structure
SandBox
FrameWork hierarchy
Size Resolution 
UIComponent

UIView
UILable
UIImageView
* exercise : SchoolCode/Lecture/week5/day22/UITest/

Day23

Dynamic Programming 
Obtaining Fibonacci
* exercise : SchoolCode/Lecture/week5/day23/Fibonacci/

Day24

UIControl
Delegate or Protocol
UITextFieldDelegate
* exercise : SchoolCode/Lecture/week5/day24/UIButtonTest/

Day25

UIScrolView
Block
Animation
* exercise : SchoolCode/Lecture/week5/day25/AnimationTest/
* homework(WebView) : SchoolCode/Homework/WebView_Obj/

### week6

Day26

Practice data structures and algorithms with c-language 
*exercise : SchoolCode/Lecture/week6/day26/

Day27 UINavagationController UITabbarController
* exercise : SchoolCode/Lecture/week6/day27/TestVC/

Day28

Signleton : SchoolCode/Lecture/week6/day28/SingletonTest/
NSUserDefault, Propert list : SchoolCode/Lecture/week6/day28/LoadDataProject/

Day 29 

Back tracking

Day30 (Review)

Protocol & Delegate : SchoolCode/Lecture/week6/day30/DelegateTest/
Block
Dictionary

UX/UI : SchoolCode/Lecture/week6/day30/Test0603/

### week7

Day31 

(Mini Project) Login logic : SchoolCode/Lecture/week7/day31/LoginTestProject/
UITableView : SchoolCode/Lecture/week7/day31/TableViewExample/

Day32 UITableViewController CustomTableCell : SchoolCode/Lecture/week7/day32/CustomTable/

Day33 Property&KVO : SchoolCode/Lecture/week7/day33/PropertyAndKVO/

Day34 

Image Picker Controller : SchoolCode/Lecture/week7/day34/MyImagePicker/
Alert Controller : SchoolCode/Lecture/week7/day34/AlertExercise/

### week8

Day35 (UI review and practice)

Navigation controller : SchoolCode/Lecture/week8/day35/Practice1/

Day36 (UI review and practice)

Tabbar controller : SchoolCode/Lecture/week8/day36/TabbarControllerExample/

Day37 (UI review and practice)

Table view controller : SchoolCode/Lecture/week8/day37/

Day38

Delegate & Notification : SchoolCode/Lecture/week8/day38/Notification/
Thread/NSThread : SchoolCode/Lecture/week8/day38/NSThread/
Grand central dispatch : SchoolCode/Lecture/week8/day38/GCD/

Day39

Block / GCD : SchoolCode/Lecture/week8/day39/StopWatchWithGCD/

### week9

Day40 practice with database with MongoDB
Day41 practice with database with MongoDB

Day42

CoreData : SchoolCode/Lecture/week9/day42/Database/
iOS network basic : SchoolCode/Lecture/week9/day42/ImageNetworking/

Day43

(mini project) iOS netnetwork : SchoolCode/Lecture/week9/day43/ImageDownload/

Day44

(mini project) iOS netnetwork

### week10

Day45

AFNetowrking : SchoolCode/Lecture/week10/day45/NetworkMiniProject/

Day46

Xcode project Settings techniques

47일차 : Software engineering
48일차 : Software engineering
49일차 : Software engineering


Final project : SchoolCode/MyProject/MyProject(Jihoon)/
