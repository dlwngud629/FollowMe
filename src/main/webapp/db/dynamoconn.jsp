<%@ page import="software.amazon.awssdk.services.dynamodb.*" %>
<%@ page import="software.amazon.awssdk.services.dynamodb.model.*" %>
<%@ page import="software.amazon.awssdk.auth.credentials.*" %>
<%@ page import="software.amazon.awssdk.regions.Region" %>
<%
    AwsBasicCredentials awsCreds = AwsBasicCredentials.create(
		"AWS ACCESS KEY", 
     	"AWS SECRET KEY"  
    );

    DynamoDbClient dynamoDbClient = DynamoDbClient.builder()
        .region(Region.US_EAST_1) 
        .credentialsProvider(StaticCredentialsProvider.create(awsCreds))
        .build();

    request.setAttribute("dynamoDbClient", dynamoDbClient);
%>
