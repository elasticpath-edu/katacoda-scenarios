# git clone git@github.elasticpath.net:commerce/ep-commerce-classroom-exercises-8.0.x.git
# cd ep-commerce-classroom-exercises-8.0.x/
# git branch --track base origin/base
# git branch --track extend-cm/step1 origin/extend-cm/step1
# mvn clean install -DskipAllTests
# testing
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
npm install newman -g
cd; git clone https://buildadmin:b31b90b707d18f9a407ba4d61f027f6c3573a64b@github.elasticpath.net/ep-source-deploy/ep-commerce-classroom-exercises-8.1
mv ep-commerce-classroom-exercises-8.1 ep-commerce
cd ep-commerce
git pull --all
git checkout base
