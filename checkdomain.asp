<%@LANGUAGE="VBSCRIPT" LCID="1032" CODEPAGE="65001"%>
<!--#include file="JSON.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<table width="250px"  border="0" cellspacing="0" cellpadding="0">
<!--#include file="domainquery.asp"-->
<!--#include file="config.asp"-->
<%	
	
	
	
	Session.LCID = 1032
	Response.Charset = "utf-8"
	'First create a new Domain Query with your username and password.
	
	 
	a=Split(Request.form("ext"),",")
	k=0
	Extstr=""".gr"""
	grsel=false
for each x in a
     
	 if trim(x)=".gr" then
	 	grsel=true
	 end if
		Extstr=Extstr&","&""""&trim(x)&"""" 
	 
	
	k=k+1
next
 
	 
	set qry = NewDomainQuery(ApiKey,Request.form("domain"),Extstr,grsel)
	
	 
	set reply = qry.SendQuery
	
	'Now let's list the contents of the reply (You don't need to display this, it's for your own use)
	'Response.Write(reply.code & " - " & reply.Message)
	
	'if code = 1000 then the query was successful
	'if the reply code is something different then 
	'an error occured that is described in the message property
	 
	if reply.code = 1000 then
	 
	response.Write("<strong>Available Domains:</strong><br>")
	
	response.Write(reply.AvailableDomains)
	response.Write("<br><br><strong>Not Available Domains:</strong><br>")
	 
	response.Write(reply.NotAvailableDomains)
		else
		response.Write( reply.code&" "&reply.message)
		 	
	end if
%>
</table>
</body>
</html>
