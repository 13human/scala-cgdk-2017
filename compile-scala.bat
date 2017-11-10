
if not exist src\main\scala\Runner.java (
    echo Unable to find src\main\scala\Runner.java > compilation.log
    exit 1
)

if not exist src\main\scala\MyStrategy.scala (
    echo Unable to find src\main\scala\MyStrategy.scala > compilation.log
    exit 1
)

rd /Q /S classes
md classes

call "scalac" -encoding UTF-8 -sourcepath "src/main/scala" -d classes src/main/scala/*.scala >compilation.log 2>&1
call "javac" -encoding UTF-8 -sourcepath "src/main/scala" -cp "./classes" -d classes src/main/scala/*.java >>compilation.log 2>&1



if not exist classes\Runner.class (
    echo Unable to find classes\Runner.class >> compilation.log
    exit 1
)

if not exist classes\MyStrategy.class (
    echo Unable to find classes\MyStrategy.class >> compilation.log
    exit 1
)

jar cvfe "./java-cgdk.jar" Runner -C "./classes" .
copy /Y /B "%SCALA_HOME%\lib\scala-library.jar" .
copy /Y /B "%SCALA_HOME%\lib\scala-reflect.jar" .