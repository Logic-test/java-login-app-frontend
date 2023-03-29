FROM maven:3.6.3-jdk-8 AS stage1
RUN git clone https://github.com/Logic-test/java-login-app-frontend
WORKDIR  /java-login-app-frontend
RUN mvn package

FROM tomcat:9.0.73
WORKDIR /usr/local/tomcat/webapps/
COPY --from=stage1 /java-login-app-frontend/target/UserLoginApp.war .
