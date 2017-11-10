if [ ! -f src/main/scala/Runner.java ]
then
    echo Unable to find src/main/scala/Runner.java > compilation.log
    exit 1
fi

rm -rf classes
mkdir classes


scalac -encoding UTF-8 -sourcepath "src/main/scala" -d classes "src/main/scala/*.scala" > compilation.log
javac -encoding UTF-8 -sourcepath "src/main/scala" -cp "./classes" -d classes "src/main/scala/*.java" > compilation.log

if [ ! -f classes/Runner.class ]
then
    echo Unable to find classes/Runner.class >> compilation.log
    exit 1
fi

jar cf "./java-cgdk.jar" -C "./classes" .
cp -n $SCALA_HOME/lib/scala-library.jar $SCALA_HOME/lib/scala-reflect.jar .