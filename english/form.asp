<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- Demo Asp version 5.1-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" language="javascript">
						function validate2(aform){
							if (document.getElementById("domainName").value.length  < 3){
								alert('Invalid Domainname');
								return false;
							}
							return true;
						}
					</script>
					 <script language=javascript>

function checkDomain2(nname)
{
var arr = new Array(
'.com','.net','.org','.biz','.coop','.info','.museum','.name',
'.pro','.edu','.gov','.int','.mil','.ac','.ad','.ae','.af','.ag',
'.ai','.al','.am','.an','.ao','.aq','.ar','.as','.at','.au','.aw',
'.az','.ba','.bb','.bd','.be','.bf','.bg','.bh','.bi','.bj','.bm',
'.bn','.bo','.br','.bs','.bt','.bv','.bw','.by','.bz','.ca','.cc',
'.cd','.cf','.cg','.ch','.ci','.ck','.cl','.cm','.cn','.co','.cr',
'.cu','.cv','.cx','.cy','.cz','.de','.dj','.dk','.dm','.do','.dz',
'.ec','.ee','.eg','.eh','.er','.es','.et','.fi','.fj','.fk','.fm',
'.fo','.fr','.ga','.gd','.ge','.gf','.gg','.gh','.gi','.gl','.gm',
'.gn','.gp','.gq','.gr','.gs','.gt','.gu','.gv','.gy','.hk','.hm',
'.hn','.hr','.ht','.hu','.id','.ie','.il','.im','.in','.io','.iq',
'.ir','.is','.it','.je','.jm','.jo','.jp','.ke','.kg','.kh','.ki',
'.km','.kn','.kp','.kr','.kw','.ky','.kz','.la','.lb','.lc','.li',
'.lk','.lr','.ls','.lt','.lu','.lv','.ly','.ma','.mc','.md','.mg',
'.mh','.mk','.ml','.mm','.mn','.mo','.mp','.mq','.mr','.ms','.mt',
'.mu','.mv','.mw','.mx','.my','.mz','.na','.nc','.ne','.nf','.ng',
'.ni','.nl','.no','.np','.nr','.nu','.nz','.om','.pa','.pe','.pf',
'.pg','.ph','.pk','.pl','.pm','.pn','.pr','.ps','.pt','.pw','.py',
'.qa','.re','.ro','.rw','.ru','.sa','.sb','.sc','.sd','.se','.sg',
'.sh','.si','.sj','.sk','.sl','.sm','.sn','.so','.sr','.st','.sv',
'.sy','.sz','.tc','.td','.tf','.tg','.th','.tj','.tk','.tm','.tn',
'.to','.tp','.tr','.tt','.tv','.tw','.tz','.ua','.ug','.uk','.um',
'.us','.uy','.uz','.va','.vc','.ve','.vg','.vi','.vn','.vu','.ws',
'.wf','.ye','.yt','.yu','.za','.zm','.zw');

var mai = nname;
var val = true;

//var dot = mai.lastIndexOf(".");
 //alert("Your dot name is "+dot+" correct");
var dname = mai;
// alert("Your domain name is "+dname+" correct");
//var ext = mai.substring(dot,mai.length);
//alert(ext);

if(dname.length>2 && dname.length<57)
{


		for(var j=0; j<dname.length; j++)
		{
		  var dh = dname.charAt(j);
		  var hh = dh.charCodeAt(0);
		   //alert("To hh einai "+hh+" correct");
		  if((hh > 47 && hh<59) || (hh > 64 && hh<91) || (hh > 96 && hh<123)  || (hh > 944 && hh <970) || (hh > 912 && hh < 938) || hh==45 )
		  {
			 if((j==0 || j==dname.length-1) && hh == 45)
		  	 {
		 	  	 alert("Invalid Domainname");
			      return false;
		 	 }
		  }
		else	{
		  	 alert("Invalid Domainname");
			 return false;
		  }
		}

}
else
{
 alert("Invalid Domainname");
 return false;
}

return true;
}
</script>
</head>

<body>
	<form method="post" action="checkdomain.asp" name="MainForm" onSubmit="return checkDomain2(MainForm.domain.value)">
	<table width="491" border="0" cellspacing="0" cellpadding="2">
  	<tr>
    	<td colspan="4" style="padding-left:55px"><div align="left"><strong> Search for available domain names </strong></div></td>
  		</tr>
		<tr>
 		   <td width="91" align="right"><div align="right"><strong>www.</strong></div></td>
			<td width="181" colspan="2"><input type="text" name="domain"></td>
			<td width="203"><input type="submit" name="Submit" value="Go!"></td>
  		</tr>
		 <tr><td colspan="4" style="padding-left:50px">
			<input type="checkbox" name="ext" value=".gr">.gr |
			<input type="checkbox" name="ext" value=".com.gr">.com.gr |
			<input type="checkbox" name="ext" value=".org.gr">.org.gr |
			<input type="checkbox" name="ext" value=".net.gr">.net.gr |
			<input type="checkbox" name="ext" value=".gov.gr">.gov.gr |
			<input type="checkbox" name="ext" value=".eu">.eu |
			<input type="checkbox" name="ext" value=".com">.com |
			<input type="checkbox" name="ext" value=".net">.net |
			<input type="checkbox" name="ext" value=".org">
      .org
	  <input type="checkbox" name="ext" value=".info">
      .info
	  <input type="checkbox" name="ext" value=".mobi">
      .mobi
	  <input type="checkbox" name="ext" value=".name">
      .name
	  <input type="checkbox" name="ext" value=".ac">
      .ac
	  <input type="checkbox" name="ext" value=".cc">
      .cc
	  <input type="checkbox" name="ext" value=".io">
      .io
	  <input type="checkbox" name="ext" value=".sh">
      .sh
	  <input type="checkbox" name="ext" value=".tv">
      .tv
	  <input type="checkbox" name="ext" value=".bz">
      .bz
	  <input type="checkbox" name="ext" value=".ws">
      .ws
	  <input type="checkbox" name="ext" value=".de">
      .de
	   <input type="checkbox" name="ext" value=".ms">
      .ms
	   <input type="checkbox" name="ext" value=".gs">
      .gs
	   <input type="checkbox" name="ext" value=".in">
      .in
	   <input type="checkbox" name="ext" value=".fm">
      .fm
	   <input type="checkbox" name="ext" value=".la">
      .la


     
       <input type="checkbox" name="at" value=".at">
       .at
       <input type="checkbox" name="be" value=".be">
       .be
       <input type="checkbox" name="biz" value=".biz">
       .biz
       <input type="checkbox" name="biz_pl" value=".biz.pl">
       .biz.pl
       <input type="checkbox" name="casa" value=".casa">
       .casa
       <input type="checkbox" name="ch" value=".ch">
       .ch
       <input type="checkbox" name="city" value=".city">
       .city
       <input type="checkbox" name="club" value=".club">
       .club
       <input type="checkbox" name="co" value=".co">
       .co
       <input type="checkbox" name="co_uk" value=".co.uk">
       .co.uk
       <input type="checkbox" name="coffee" value=".coffee">
       .coffee
       <input type="checkbox" name="com_pl" value=".com.pl">
       .com.pl
       <input type="checkbox" name="edu_pl" value=".edu.pl">
       .edu.pl
       <input type="checkbox" name="email" value=".email">
       .email
       <input type="checkbox" name="es" value=".es">
       .es
       <input type="checkbox" name="estate" value=".estate">
       .estate
       <input type="checkbox" name="holiday" value=".holiday">
       .holiday
       <input type="checkbox" name="info_pl" value=".info.pl">
       .info.pl
       <input type="checkbox" name="it" value=".it">
       .it
       <input type="checkbox" name="me" value=".me">
       .me
       <input type="checkbox" name="net_pl" value=".net.pl">
       .net.pl
       <input type="checkbox" name="nl" value=".nl">
       .nl
       <input type="checkbox" name="nom_pl" value=".nom.pl">
       .nom.pl
       <input type="checkbox" name="org_pl" value=".org.pl">
       .org.pl
       <input type="checkbox" name="parts" value=".parts">
       .parts
       <input type="checkbox" name="party" value=".party">
       .party
       <input type="checkbox" name="photography" value=".photography">
       .photography
       <input type="checkbox" name="photos" value=".photos">
       .photos
       <input type="checkbox" name="pl" value=".pl">
       .pl
       <input type="checkbox" name="pro" value=".pro">
       .pro
       <input type="checkbox" name="ru" value=".ru">
       .ru
       <input type="checkbox" name="science" value=".science">
       .science
       <input type="checkbox" name="shop_pl" value=".shop.pl">
       .shop.pl
       <input type="checkbox" name="site" value=".site">
       .site
       <input type="checkbox" name="top" value=".top">
       .top
       <input type="checkbox" name="waw_pl" value=".waw.pl">
       .waw.pl
       <input type="checkbox" name="website" value=".website">
       .website
       <input type="checkbox" name="work" value=".work">
       .work
		</td>
		</tr>
		</table>
	</form>


</body>
</html>
