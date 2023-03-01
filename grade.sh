CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
echo '-----------------------------------'
echo 'Test File Exist:'
cd student-submission
if [[ -f ListExamples.java ]]
then 
echo "ListExamples.java found"
else 
echo "ListExamples.java not found"
exit 1
fi

echo '-----------------------------------'
echo 'Copying files into tester directory...'
cp ../TestListExamples.java ./
cp ../GradeServer.java ./
cp ../Server.java ./
cp -R ../lib ./

echo 'File copy complete'
echo '-----------------------------------'
echo 'Compile Test'

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if [[ $? != 0 ]]
then 
    echo "The files do not compile"
    exit 1
else 
echo "the files compile"
fi

echo '-----------------------------------'
echo 'JUnit Test Results:'

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
