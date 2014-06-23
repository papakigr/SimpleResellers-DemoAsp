<%
	

	function NewDomainQuery(apikey, domainname,extensions,grsel)
		dim res
		set res = New PapakiDomainQuery
		res.ApiKey = ApiKey
		res.domainname = domainname
		res.extensions = extensions
		res.grsel=grsel
		set NewDomainQuery = res
	end function

	function debug(msg)
		Response.Write(msg)
		Response.End()
	end function

	class PapakiDomainQuery
		private xmlDoc
		private Arr_Extentions
		public ApiKey
		public grsel
		public domainname
		public extensions
	 	public DomainQuery
		public Extentions 		'comma delimitted string containing the extentions to search for 
		
		private sub Class_Initialize()
			dim DomainRequestXML				
			
		
		end sub
		
		function SendQuery
	 
			set SendQuery = NewDomainQueryReply(ApiKey,domainname,extensions,grsel)
		end function
	end class
	
	function NewDomainQueryReply(ApiKey,domainname,extensions,grsel)
 
		domainRequestJson="{""request"":{""type"":""domainSearch"",""apiKey"":"""&ApiKey&""",""username"":"""",""password"":"""",""domain"":"""&domainname&""",""lang"":""el"",""test"":""False"",""extensions"":{""ext"":["&extensions&"]}}}"
			
			 ' response.Write(domainRequestJson)	 
			 
			xmlDoc=domainRequestJson 			 
			xmlDoc=ExecXML(xmlDoc)
		 
		 
			
'	response.Write(xmlDoc)	 
			 
dim Info : set Info = JSON.parse(join(array( _
    ""&xmlDoc&"" _
)))

	
		dim result
		set result = New DomainQueryReply
		with result
			.Code = Info.response.code
			.Message = Info.response.message
		   .AvailableDomains=""
		   .notAvailableDomains=""
	  
			 if .Code=1000 then
			 	 on error resume next
				  .notAvailableDomains = Info.response.notAvailableDomains.domain
			   .notAvailableDomains=replace(.notAvailableDomains,domainname&".gr,"&domainname&".gr",domainname&".gr")
			  
			   if grsel=false then
			   	.notAvailableDomains=replace(.notAvailableDomains,domainname&".gr","")
			   end if
			
			  	on error resume next
				 .AvailableDomains = Info.response.availableDomains.domain
				.AvailableDomains=replace(.AvailableDomains,domainname&".gr,"&domainname&".gr",domainname&".gr")
				
				 if grsel=false then
			   	.AvailableDomains=replace(.AvailableDomains,domainname&".gr","")
			   end if
				 
				 
				 
			
			end if
		 
		end with
		set NewDomainQueryReply = Result
	end function

	class DomainQueryReply
		public Code 				'The numeric reply code by the server
		public Message				'A descriptive message explaining the replycode
		public AvailableDomains		'The list of domain names that are availables
		public NotAvailableDomains  'The list of domain names that are not available
	end class
	
	function ExecXML(strXML)
	 
		Set xmlHTTP = server.CreateObject("MSXML2.ServerXMLHTTP")
		xmltext = "message="& strXML
		xmlhttp.open "POST","https://api.papaki.gr/register_url2.aspx", False
		xmlhttp.SetRequestHeader "Content-Type", "application/x-www-form-urlencoded"
		xmlhttp.send xmltext
		 ' response.Write(xmlhttp.ResponseText )
		  ExecXML = xmlhttp.ResponseText 
		 
		 set xmlhttp = nothing
	end function

	 
	function CheckXML(oXml, action)
		Dim pstrXPath
		oXML.setProperty "SelectionLanguage", "XPath"
		on Error Resume Next
		'debug(oXML)		
		pstrXPath = "/response/code"
		code =  oXML.selectSingleNode(pstrXPath).nodeTypedValue

		pstrXPath = "/response/message"
		strMsg = oXML.selectSingleNode(pstrXPath).nodeTypedValue
		
		if Err <> 0 Then
			Response.Write Err.description & " " & oXML.xml
			Response.End()
		end if		
		set CheckXML = oXML
	End function	
	
	function CreateNode(NodeName,NodeValue,xmldoc)
		Set newElem = xmlDoc.createElement(nodename)
		newElem.nodeTypedValue = NodeValue
		set CreateNode = newElem
	end function

	public function StripHTML(htmlString,pattern,rplc)
		Set RE = New RegExp
		RE.pattern = pattern
		RE.IgnoreCase = True
		st = RE.replace(htmlString,"")
		'response.write(st & "-" & htmlString)
		do while st <> htmlString
			htmlString = st
			st = RE.replace(htmlString,rplc)
		loop
		StripHTML = htmlString
	end function
	
	function WhoIs(ApiKey,domainName)
		'dim WhoisRequestXML				
'			DomainRequestXML = "<request><username></username>" & _
'				"<password></password>" & _
'				"<type>whois</type>" & _
'				"<lang>el</lang>" & _
'				"<test>false</test>" & _
'				"<domain></domain>" & _
'			"</request>"
'			set xmlDoc = Server.CreateObject("Microsoft.xmlDom")
'			xmlDoc.LoadXML(DomainRequestXml)
'		
'			with xmlDoc
'				.SelectSingleNode("/request/username").nodeTypedValue = username
'				.SelectSingleNode("/request/password").nodeTypedValue = password
'				.SelectSingleNode("/request/domain").nodeTypedValue = DomainName
'			end with
'			set xmlDoc = ExecXML(xmlDoc.xml)
'			res = xmlDoc.selectSingleNode("/response/whoisReply").nodeTypedValue
			
			
			
			
			
			
			
			
			domainRequestJson="{""request"":{""type"":""whois"",""apiKey"":"""&ApiKey&""",""username"":"""",""password"":"""",""domain"":"""&domainname&""",""lang"":""el"",""test"":""False""}}"
			 
				xmlDoc=domainRequestJson 			 
			xmlDoc=ExecXML(xmlDoc)
		 
		xmlDoc =Replace(xmlDoc,"<![CDATA[","")
			xmlDoc = Replace(xmlDoc,"]]>","")
			xmlDoc =  stripHTML(xmlDoc,"<(.)*?>","")
			xmlDoc = stripHTML(xmlDoc,"(\n)","<br>")
	 
	 
			 
dim Info : set Info = JSON.parse(join(array( _
    ""&xmlDoc&"" _
)))
		
		
	 if Info.response.code = 1000 then
			Whois = Info.response.whoisReply
	end if
	end function
	
%>
