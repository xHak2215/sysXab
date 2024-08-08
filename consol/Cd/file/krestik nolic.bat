
@echo off && title Crestiki  Noliki && mode con: cols=100 lines=25 && color a
setlocal enabledelayedexpansion
set %kast% =">>"
:menu
cls
echo meny
echo  1 pleyer A 1-Player Game, Enter 1
echo  2 pleyers A 2-Player Game, Enter 2
echo  Exit, Enter 3
set /p menu=%kast%
if not defined menu goto menu
if /i %menu% equ 1 (
set menu=%kast%
cls
goto 1p
)
if /i %menu% equ 2 (
set menu=%kast%
cls
goto 2p
)
if /i %menu% equ 3 (
goto end
)
set menu=%kast%
goto menu
::~ ^^ The menu system, gives all the options, allows the user to input a number using "set /p menu="
:~ If the user didn't enter a value, it 'goto's back to ask again.
::~ Checks the Menu variable, tests to see if it matches 1, 2 or 3, then 'goto's the appropriate place.
:1p
set turns=0
set x1=0
set x2=0
set x3=0
set x4=0
set x5=0

set x6=0

set x7=0

set x8=0

set x9=0

set o1=0

set o2=0

set o3=0

set o4=0

set o5=0

set o6=0

set o7=0

set o8=0

set o9=0

set d1=1

set d2=2

set d3=3

set d4=4

set d5=5

set d6=6

set d7=7

set d8=8

set d9=9




::~ Sets the display characters for game to their appropriate number




set rnumber=%random%

set rnumber2=%rnumber%

set /a rnumber= %rnumber% / 2

set /a rnumber= %rnumber% * 2




::~ Sets a variable "rnumber" to a random number

::~ Sets a variable "rnumber2" to the same number as "rnumber"

::~ Divides "rnumber" by two, then multiplies by two.

::~ If the number was even, it would be equal to "rnumber2", if it was odd it would end up one less than "rnumber2"

::~ This is the method I use to create a 50% chance, as there's a 50% that a random number will be odd or even







if %rnumber%==%rnumber2% (

echo Crosses go first

echo You are noughts

pause>nul

set rnumber=

set rnumber2=

set go=1xgame

goto 1display

) else (

echo Noughts go first

echo You are noughts

pause>nul

set rnumber=

set rnumber2=

set go=1ogame

goto 1display

)




::~ This tests to see if the numbers are equal, then sets the "go" variable to whichever possibility came out and deletes the "rnumber" variables

::~ Then 'Goto's the display




:1display

cls

echo %d1% %d2% %d3%

echo %d4% %d5% %d6%

echo %d7% %d8% %d9%

if /i %turns% equ 9 (goto draw)

echo.

echo Your Turn

echo.

goto %go%




::~ ^^ Displays the current status of each place in the grid. At the start these will all just be numbers.

::~ Checks that the turns hasn't reach nine. If it has, all the spaces on the grid have been used up and nobody has won, so the game is a draw.




:1ogame

echo Choose the number of the space you'd like to choose

set guess=

set /p guess=

if not defined guess goto 1display

set guess=%guess:~0,1%

if /i not %guess% leq 9 goto 1display

if /i not %guess% gtr 0 goto 1display

if /i !d%guess%! neq %guess% goto 1display

goto 1o%guess%




::~ Asks the user to input the number of the space they want to choose and allows them to using "Set /p"

::~ If the user didn't input or entered something that wasn't a number between 1 and 9, it 'goto's back, to ask again

::~ Checks that the number hasn't been already chosen by checking that !d%guess%! is equal to guess. This works becauseif the user guesses 1, d1 should equal 1.

::~ If it has already been chosen, d1 would be a O or a X, so it would not be equal.

::~ 'Goto's the number chosen.




:1o1

set o1=1

set x1=1000

set d1=O

goto 1oprocess

:1o2

set o2=10

set x2=1000

set d2=O

goto 1oprocess

:1o3

set o3=100

set x3=1000

set d3=O

goto 1oprocess

:1o4

set o4=1

set x4=1000

set d4=O

goto 1oprocess

:1o5

set o5=10

set x5=1000

set d5=O

goto 1oprocess

:1o6

set o6=100

set x6=1000

set d6=O

goto 1oprocess

:1o7

set o7=1

set x7=1000

set d7=O

goto 1oprocess

:1o8

set o8=10

set x8=1000

set d8=O

goto 1oprocess

:1o9

set o9=100

set x9=1000

set d9=O

goto 1oprocess




::~ The space of the number chosen on the display grid is changed to the correct letter (X or O) and a number is added to the %x-% grid and the %o-% grid.

::~ These two grids are used to work out whether someone has won, and allows the computer to work out which place to go next.










:1oprocess

set /a line1= %o1% + %o2% + %o3%

if /i %line1% equ 111 (goto owin)




set /a line2= %o4% + %o5% + %o6%

if /i %line2% equ 111 (goto owin)




set /a line3= %o7% + %o8% + %o9%

if /i %line3% equ 111 (goto owin)




set /a line4= %o1% + %o5% + %o9%

if /i %line4% equ 111 (goto owin)




set /a line5= %o3% + %o5% + %o7%

if /i %line5% equ 111 (goto owin)




set /a line6= %o1% + %o4% + %o7%

if /i %line6% equ 3 (goto owin)




set /a line7= %o2% + %o5% + %o8%

if /i %line7% equ 30 (goto owin)




set /a line8= %o3% + %o6% + %o9%

if /i %line8% equ 300 (goto owin)




::~ This section of code adds up all of the possible winning combinations on the %o-% grid i.e. each row, column and diagional, to check if the player has got three Os in a row. If so 'goto's the owin section.




set go=1xgame

set guess=

set /a turns= %turns% + 1

goto 1display




::~ Sets the go to the computer's and adds one to the number of turns taken

::~ 'Goto's the display.



















:1xgame




set /a line1= %x1% + %x2% + %x3%

if /i %line1% equ 11 (

set guess=3

goto 1ac

)




set /a line1= %x1% + %x2% + %x3%

if /i %line1% equ 101 (

set guess=2

goto 1ac

)




set /a line1= %x1% + %x2% + %x3%

if /i %line1% equ 110 (

set guess=1

goto 1ac

)







set /a line1= %x4% + %x5% + %x6%

if /i %line1% equ 11 (

set guess=6

goto 1ac

)




set /a line1= %x4% + %x5% + %x6%

if /i %line1% equ 101 (

set guess=5

goto 1ac

)




set /a line1= %x4% + %x5% + %x6%

if /i %line1% equ 110 (

set guess=4

goto 1ac

)




set /a line1= %x7% + %x8% + %x9%

if /i %line1% equ 11 (

set guess=9

goto 1ac

)




set /a line1= %x7% + %x8% + %x9%

if /i %line1% equ 101 (

set guess=8

goto 1ac

)




set /a line1= %x7% + %x8% + %x9%

if /i %line1% equ 110 (

set guess=7

goto 1ac

)




set /a line1= %x1% + %x5% + %x9%

if /i %line1% equ 11 (

set guess=9

goto 1ac

)




set /a line1= %x1% + %x5% + %x9%

if /i %line1% equ 101 (

set guess=5

goto 1ac

)




set /a line1= %x1% + %x5% + %x9%

if /i %line1% equ 110 (

set guess=1

goto 1ac

)




set /a line1= %x3% + %x5% + %x7%

if /i %line1% equ 11 (

set guess=3

goto 1ac

)




set /a line1= %x3% + %x5% + %x7%

if /i %line1% equ 101 (

set guess=5

goto 1ac

)




set /a line1= %x3% + %x5% + %x7%

if /i %line1% equ 110 (

set guess=7

goto 1ac

)




set /a line1= %x1% + %x4% + %x7%

if /i %line1% equ 2 (

if /i %d1% equ 1 (

set guess=1

goto 1ac

)

if /i %d4% equ 4 (

set guess=4

goto 1ac

)

if /i %d7% equ 7 (

set guess=7

goto 1ac

)

)




set /a line1= %x2% + %x5% + %x8%

if /i %line1% equ 20 (

if /i %d2% equ 2 (

set guess=2

goto 1ac

)

if /i %d5% equ 5 (

set guess=5

goto 1ac

)

if /i %d8% equ 8 (

set guess=8

goto 1ac

)

)




set /a line1= %x3% + %x6% + %x9%

if /i %line1% equ 200 (

if /i %d3% equ 3 (

set guess=3

goto 1ac

)

if /i %d6% equ 6 (

set guess=6

goto 1ac

)

if /i %d9% equ 9 (

set guess=9

goto 1ac

)

)







::~ ^^^ These sections add up all the %x-% grid and checks to see if there is a way the computer can win this turn.

::~  If so, it sets the guess to the correct number and 'goto's the 1ac section.



















set /a line1= %o1% + %o2% + %o3%

if /i %line1% equ 11 (

set guess=3

goto 1ac

)




set /a line1= %o1% + %o2% + %o3%

if /i %line1% equ 101 (

set guess=2

goto 1ac

)




set /a line1= %o1% + %o2% + %o3%

if /i %line1% equ 110 (

set guess=1

goto 1ac

)







set /a line1= %o4% + %o5% + %o6%

if /i %line1% equ 11 (

set guess=6

goto 1ac

)




set /a line1= %o4% + %o5% + %o6%

if /i %line1% equ 101 (

set guess=5

goto 1ac

)




set /a line1= %o4% + %o5% + %o6%

if /i %line1% equ 110 (

set guess=4

goto 1ac

)




set /a line1= %o7% + %o8% + %o9%

if /i %line1% equ 11 (

set guess=9

goto 1ac

)




set /a line1= %o7% + %o8% + %o9%

if /i %line1% equ 101 (

set guess=8

goto 1ac

)




set /a line1= %o7% + %o8% + %o9%

if /i %line1% equ 110 (

set guess=7

goto 1ac

)




set /a line1= %o1% + %o5% + %o9%

if /i %line1% equ 11 (

set guess=9

goto 1ac

)




set /a line1= %o1% + %o5% + %o9%

if /i %line1% equ 101 (

set guess=5

goto 1ac

)




set /a line1= %o1% + %o5% + %o9%

if /i %line1% equ 110 (

set guess=1

goto 1ac

)




set /a line1= %o3% + %o5% + %o7%

if /i %line1% equ 11 (

set guess=3

goto 1ac

)




set /a line1= %o3% + %o5% + %o7%

if /i %line1% equ 101 (

set guess=5

goto 1ac

)




set /a line1= %o3% + %o5% + %o7%

if /i %line1% equ 110 (

set guess=7

goto 1ac

)




set /a line1= %o1% + %o4% + %o7%

if /i %line1% equ 2 (

if /i %d1% equ 1 (

set guess=1

goto 1ac

)

if /i %d4% equ 4 (

set guess=4

goto 1ac

)

if /i %d7% equ 7 (

set guess=7

goto 1ac

)

)




set /a line1= %o2% + %o5% + %o8%

if /i %line1% equ 20 (

if /i %d2% equ 2 (

set guess=2

goto 1ac

)

if /i %d5% equ 5 (

set guess=5

goto 1ac

)

if /i %d8% equ 8 (

set guess=8

goto 1ac

)

)




set /a line1= %o3% + %o6% + %o9%

if /i %line1% equ 200 (

if /i %d3% equ 3 (

set guess=3

goto 1ac

)

if /i %d6% equ 6 (

set guess=6

goto 1ac

)

if /i %d9% equ 9 (

set guess=9

goto 1ac

)

)







::~ This section checks that there is no way the noughts can win next turn by adding up the %o-% grid. If so it sets the guess to the right number and 'goto's 1ac.




set guess=%time:~9,1%




::~ If there is no way that the computer OR the player can win next turn, the computer chooses a random number as its guess. The random number I use is the millisecond digit of the clock.




:1ac

if /i %guess% equ 0 goto 1display

echo !d%guess%!

if /i NOT !d%guess%!==%guess% goto 1display

goto 1x%guess%




::~ Checks that the place hasn't already been taken (as explained above) and 'goto's the corresponding place below.




:1x1

set x1=1

set o1=1000

set d1=X

goto 1xprocess

:1x2

set x2=10

set o2=1000

set d2=X

goto 1xprocess

:1x3

set x3=100

set o3=1000

set d3=X

goto 1xprocess

:1x4

set x4=1

set o4=1000

set d4=X

goto 1xprocess

:1x5

set x5=10

set o5=1000

set d5=X

goto 1xprocess

:1x6

set x6=100

set o6=1000

set d6=X

goto 1xprocess

:1x7

set x7=1

set o7=1000

set d7=X

goto 1xprocess

:1x8

set x8=10

set o8=1000

set d8=X

goto 1xprocess

:1x9

set x9=100

set o9=1000

set d9=X

goto 1xprocess










::~ This section, as for the noughts, changes the display character of the chosen place, and adds numbers to the %x-% grid.




:1xprocess

set /a line1= %x1% + %x2% + %x3%

if /i %line1% equ 111 (goto xwin)




set /a line2= %x4% + %x5% + %x6%

if /i %line2% equ 111 (goto xwin)




set /a line3= %x7% + %x8% + %x9%

if /i %line3% equ 111 (goto xwin)




set /a line4= %x1% + %x5% + %x9%

if /i %line4% equ 111 (goto xwin)




set /a line5= %x3% + %x5% + %x7%

if /i %line5% equ 111 (goto xwin)




set /a line6= %x1% + %x4% + %x7%

if /i %line6% equ 3 (goto xwin)




set /a line7= %x2% + %x5% + %x8%

if /i %line7% equ 30 (goto xwin)




set /a line8= %x3% + %x6% + %x9%

if /i %line8% equ 300 (goto xwin)




set go=1ogame

set /a turns= %turns% + 1

goto 1display




::~  Sets the turn to the player, increases the turns variable by one. 'Goto's the display.


































::#######################################################



















::~ Two player is exactly the same as one player, apart from the computer is replaced by a second player, the code is otherwise identical and does not need explaining again.







:2p
set turns=0
set x1=0
set x2=0
set x3=0
set x4=0
set x5=0
set x6=0
set x7=0
set x8=0
set x9=0
set o1=0
set o2=0
set o3=0
set o4=0
set o5=0
set o6=0
set o7=0
set o8=0
set o9=0
set d1=1
set d2=2
set d3=3
set d4=4
set d5=5
set d6=6
set d7=7
set d8=8
set d9=9
set rnumber=%random%
set rnumber2=rnumber
set /a rnumber= %rnumber% / 2
set /a rnumber= %rnumber% * 2
if %rnumber%==%rnumber2% (

echo Crosses go first

pause>nul

set rnumber=

set rnumber2=

set go=2xgame

goto 2display
) else (
echo Noughts go first
pause>nul
set rnumber=
set rnumber2=
set go=2ogame
goto 2display
)
:2display
cls
echo %d1% %d2% %d3%
echo %d4% %d5% %d6%
echo %d7% %d8% %d9%
if /i %turns% equ 9 (goto draw)
echo.
if /i "%go%"=="2ogame" (
echo Nought's Turn
) ELSE (
echo Cross's Turn
)
echo.

goto %go%




:2ogame

echo Choose the number of the space you'd like to choose

set guess=

set /p guess=

if not defined guess goto 2display

set guess=%guess:~0,1%

if /i not %guess% leq 9 goto 2display

if /i not %guess% gtr 0 goto 2display

if /i !d%guess%! neq %guess% goto 2display

goto 2o%guess%







:2o1

set o1=1

set d1=O

goto 2oprocess

:2o2

set o2=10

set d2=O

goto 2oprocess

:2o3

set o3=100

set d3=O

goto 2oprocess

:2o4
set o4=1
set d4=O
goto 2oprocess
:2o5

set o5=10

set d5=O

goto 2oprocess

:2o6

set o6=100

set d6=O

goto 2oprocess

:2o7

set o7=1

set d7=O

goto 2oprocess

:2o8

set o8=10

set d8=O

goto 2oprocess

:2o9

set o9=100

set d9=O

goto 2oprocess




:2oprocess

set /a line1= %o1% + %o2% + %o3%

if /i %line1% equ 111 (goto owin)




set /a line2= %o4% + %o5% + %o6%

if /i %line2% equ 111 (goto owin)




set /a line3= %o7% + %o8% + %o9%

if /i %line3% equ 111 (goto owin)




set /a line4= %o1% + %o5% + %o9%

if /i %line4% equ 111 (goto owin)




set /a line5= %o3% + %o5% + %o7%

if /i %line5% equ 111 (goto owin)




set /a line6= %o1% + %o4% + %o7%

if /i %line6% equ 3 (goto owin)




set /a line7= %o2% + %o5% + %o8%

if /i %line7% equ 30 (goto owin)




set /a line8= %o3% + %o6% + %o9%

if /i %line8% equ 300 (goto owin)




set go=2xgame

set guess=

set /a turns= %turns% + 1

goto 2display

























:2xgame

echo Choose the number of the space you'd like to choose

set guess=

set /p guess=

if not defined guess goto 2display

set guess=%guess:~0,1%

if /i not %guess% leq 9 goto 2display

if /i not %guess% gtr 0 goto 2display

if /i !d%guess%! neq %guess% goto 2display

goto 2x%guess%
:2x1
set x1=1
set d1=X
goto 2xprocess
:2x2
set x2=10
set d2=X
goto 2xprocess
:2x3
set x3=100
set d3=X
goto 2xprocess
:2x4
set x4=1
set d4=X
goto 2xprocess
:2x5
set x5=10
set d5=X
goto 2xprocess
:2x6
set x6=100
set d6=X
goto 2xprocess
:2x7
set x7=1
set d7=X
goto 2xprocess
:2x8
set x8=10
set d8=X
goto 2xprocess
:2x9
set x9=100
set d9=X
goto 2xprocess
:2xprocess
set /a line1= %x1% + %x2% + %x3%
if /i %line1% equ 111 (goto xwin)
set /a line2= %x4% + %x5% + %x6%
if /i %line2% equ 111 (goto xwin)
set /a line3= %x7% + %x8% + %x9%
if /i %line3% equ 111 (goto xwin)
set /a line4= %x1% + %x5% + %x9%
if /i %line4% equ 111 (goto xwin)
set /a line5= %x3% + %x5% + %x7%
if /i %line5% equ 111 (goto xwin)
set /a line6= %x1% + %x4% + %x7%
if /i %line6% equ 3 (goto xwin)
set /a line7= %x2% + %x5% + %x8%
if /i %line7% equ 30 (goto xwin)
set /a line8= %x3% + %x6% + %x9%
if /i %line8% equ 300 (goto xwin)
set go=2ogame
set /a turns= %turns% + 1
goto 2display
:draw
echo.
Echo It's A Draw!
pause>nul
goto menu
:owin
cls
echo %d1% %d2% %d3%
echo %d4% %d5% %d6%
echo %d7% %d8% %d9%
Echo Noughts Win!
pause>nul
goto menu
:xwin
cls
echo %d1% %d2% %d3%
echo %d4% %d5% %d6%
echo %d7% %d8% %d9%
Echo Crosses Win!
Pause>nul
goto menu
:end
set d1=
set d2=
set d3=
set d4=
set d5=
set d6=
set d7=
set d8=
set d9=
set o1=
set o2=
set o3=
set o4=
set o5=
set o6=
set o7=
set o8=
set o9=
set x1=
set x2=
set x3=
set x4=
set x5=
set x6=
set x7=
set x8=
set x9=
set guess=
set turns=
set line1=
set line2=
set line3=
set line4=
set line5=
set line6=
set line7=
set line8=

