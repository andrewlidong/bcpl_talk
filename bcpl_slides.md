#!./slides.py

# BCPL: C, I am your father

![open](bcpl_title.png)

*by Andrew Dong*

BCPL (Basic Combined Programming Language)

------------------------

# What is BCPL?

- A procedural, imperative, and structured programming language
- Predecessor to B language, which led to C
- Curly braces (but no keyboards for curlies)
- One data type: a word

![open](bcpl_book.jpg)

------------------------

# Hello World

- BCPL is the language in which the original "Hello, World!" program was written

```bcpl
GET "LIBHDR"
LET START() BE WRITES("Hello, World")
```

---

# Key Features of BCPL

1. **Word-oriented language**
   - Single data type: the machine word
   - No type checking
   - Everything is treated as a bit pattern

2. **Syntax influenced C**
   - Curly braces for blocks
   - Function declarations
   - Similar operators

---

# Word-oriented language

    - The language is unusual in having only one data type: a word
    - For many machines of the time, this data type was a 16-bit word. 
    - This choice later proved to be a significant problem 
    when BCPL was used on machines in which the smallest 
    addressable item was not a word but a byte.  

---

# Curly braces

   - BCPL was the first brace programming language.  
   - In practice, on limited keyboards of the day, 
   source programs often used the sequences $( and $) 
   or [ and ] in place of the symbols { and }.

![open](bcpl_keyboard.jpeg)


---

# Multi-User Dungeon

   - The first MUD was also written in BCPL (MUD1)
   - Trubshaw named the game Multi-User Dungeon, 
   in tribute to the Dungeon variant of Zork

![open](bcpl_mud.png)


---

# Relationship to C

   - Programmers at the time debated whether an 
   eventual successor to C would be called "D", 
    the next letter in the alphabet, or "P"

![open](bcpl_daddy.jpg)

---

# Leetcode of the day

```bcpl
GET "LIBHDR"

GLOBAL $(
	COUNT: 200
	ALL: 201
$)

LET TRY(LD, ROW, RD) BE
	TEST ROW = ALL THEN 
		COUNT := COUNT + 1 
	ELSE $(
		LET POSS = ALL & ~(LD | ROW | RD) 
		UNTIL POSS = 0 DO $(
			LET P = POSS & -POSS 
			POSS := POSS - P
			TRY(LD + P << 1, ROW + P, RD + P >> 1)
		$)
	$)

LET START() = VALOF $(
	ALL := 1
	FOR I = 1 TO 12 DO $(
		COUNT := 0
		TRY(0, 0, 0)
		WRITEF("%I2-ANDREWS PROBLEM HAS %I5 SOLUTIONS*N", I, COUNT)
		ALL := 2 * ALL + 1
	$)
	RESULTIS 0
$)
```

---

# N Queens Problem

```bcpl
GET "LIBHDR" 
// kind of like a c directive #include<stdio.h>
//Library header that sets up environment
// defiines basic types and macros
// declares built-in functions like WRITEF, RESULTIS

GLOBAL $( 
	COUNT: 200 // assigns COUNT to slot 200
	ALL: 201 // assigns ALL to slot 201
$)
// notice this uses $( $) instead of { }
// BCPL implements global variables as entries in a global vector (often an array)
// these indices (200, 201) are offsets in that vector

LET TRY(LD, ROW, RD) BE 
	TEST ROW = ALL THEN // checks if all queens have been placed
		COUNT := COUNT + 1 // increments solution counter
	ELSE $(
		LET POSS = ALL & ~(LD | ROW | RD) // calculate possible positions
		// LD | ROW | RD combines all attacked positions
		// ~(...): Inverts this to get non-attacked positions
		// ALL & restricts to valid board positions
		// POS now contains all valid positions where a queen can be placed
		UNTIL POSS = 0 DO $( // loop through all valid positions
			LET P = POSS & -POSS // isolates the least significant set bit
			POSS := POSS - P // remove this position from consideration
			TRY(LD + P << 1, ROW + P, RD + P >> 1) //recursively try placing a queen at position P
			// shift left to propagate the attack diagonally 
			// mark the column as occupied
			// shift right to propagate the attack diagonally
		$)
	$)
// recursive function named TRY with three bitmask arguments
// LD left diagnonal mask: columns under threat from queens on the left diagonal
// ROW: columns that already have queens placed
// RD right diagonal mask: columns under threat from queens on the right diagonals


LET START() = VALOF $(
	ALL := 1 // start with a 1x1 board: 01
	FOR I = 1 TO 12 DO $( // run for board sizes 1 to 12
		COUNT := 0 // reset solution counter

		TRY(0, 0, 0) // call solver with no queens placed yet
		WRITEF("%I2-QUEENS PROBLEM HAS %I5 SOLUTIONS*N", I, COUNT) // output solutions for current board size
		ALL := 2 * ALL + 1 // update mask for next board size (11), (111)...
		// creates a mask with I+1 ones in the least significant bits
	$)
	RESULTIS 0 // return 0 as the program's exit code
$)
```

```demo
open -a "Google Chrome" https://github.com/8l/bcpl/tree/master/bcplprogs
```


---

# BCPL Today


   - Martin Richards maintains a modern version of BCPL 
   on his website, last updated in 2023
   - This can be set up to run on various systems including 
   Linux, FreeBSD, and Mac OS X. 
   - The latest distribution includes graphics and sound 
   libraries, and there is a comprehensive manual. 
   - He continues to program in it, including for his 
   research on musical automated score following.

```demo
open -a "Google Chrome" https://www.cl.cam.ac.uk/~mr10/
```
---

# **The book of BCPL**

*The philosophy of BCPL is not one of the tyrant*
*who thinks he knows best and lays down the law on*
*what is and what is not allowed.*

*Rather, BCPL acts more as a servant*
*offering his services to the best of his ability without complaint*
*even when confronted with apparent nonsense.*

*The programmer is always assumed to know*
*what he is doing and is not hemmed in by petty restrictions.*

---

# **The book of Bruce**

```demo
open -a "Google Chrome" https://github.com/bruce-hill/tomo/
```

---

```demo
open -a Terminal
tomo ../breathe/breathe.tm
```
