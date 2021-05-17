vim ~/.bash_profile

echo -n "GRADLE_HOME=/Users/luna_mac/gradle/gradle-7.0.2" >> ~/bash_profile 
GRADLE_HOME=/Users/luna_mac/gradle/gradle-7.0.2
export GRADLE_HOME
export PATH=$PATH:$GRADLE_HOME/bin
