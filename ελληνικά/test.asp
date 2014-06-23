<!--#include file="JSON.asp"-->
<%

 

dim Info : set Info = JSON.parse(join(array( _
    "{""response"": {""message"": ""Command completed successfully"", ""code"": ""1000"", ""notAvailableDomains"": {""domain"": [""papaki.gr"", ""papaki.com""]}}}" _
)))

 

Response.write(Info.response.message & vbNewline)  
Response.write(Info.response.code & vbNewline)  
Response.write(Info.response.notAvailableDomains.domain.Length & vbNewline)  
Response.write(Info.response.notAvailableDomains.domain.get(0) & vbNewline)  
Response.write(Info.response.notAvailableDomains.domain.get(1) & vbNewline)  
'Response.write(Info.alive & vbNewline) ' prints True
'Response.write(Info.age & vbNewline) ' prints 27
'Response.write(Info.fruits.get(0) & vbNewline) ' prints banana
'Response.write(Info.fruits.get(1) & vbNewline) ' prints orange
'Response.write(Info.complex.real & vbNewline) ' prints 1
'Response.write(Info.complex.imaginary & vbNewline) ' prints 2
		
		
		
		
' RecordsetToJSON.Flush

'member2("request") = member

'member2.Flush
%>