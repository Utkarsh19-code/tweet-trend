FROM openjdk:8
ADD jarstaging/com/valaxy/demo-workshop/2.1.4/demo-workshop-2.1.4.jar twittertrend.jar 
ENTRYPOINT [ "java", "-jar", "twittertrend.jar" ]