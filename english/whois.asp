<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="JSON.asp"-->
<!--#include file="domainquery.asp" -->
<!--#include file="config.asp"-->

<%
	dim who
	who = Request.Form("domain")
	
	 


	Response.Write(WhoIs(ApiKey,who))
%>