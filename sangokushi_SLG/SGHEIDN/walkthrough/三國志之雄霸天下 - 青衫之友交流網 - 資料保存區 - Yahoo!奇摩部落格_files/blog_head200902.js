String.prototype.trim=function(){return this.replace(/(^\s+)|\s+$/g,"");}
window.onerror =  catchErr;
function catchErr(a,b,c)
{
 if(catchErr.caller != window.renderHotShortcut)
 {
 	//if(location.href.toLowerCase().indexOf("phpweb")>0){}; 
        //alert((catchErr.caller+"").split("(")[0]  +"\n" + a + "\n" +b + "\n" + c);
 }
 return true;
}

function addClass(el,className)
{
 var oldClass = el.className.trim();
 if( oldClass.length > 0){ ; className = oldClass +" " + className; };
 el.className = className;
}

function removeClass(el,className)
{  
	var oldClass = el.className.trim();
	oldClass = oldClass.split(" ");
	for(var i=0;i<oldClass.length;i++){  if(oldClass[i] == className){oldClass[i] = "";};};
	oldClass = oldClass.join(" ");
	el.className = oldClass.trim();
}



/*Dom Detection*/
var BO = new Object();
BO["ie"] =  (document.all!=null)  && (window.opera==null);
BO["ie4"]  =  BO["ie"] && (document.getElementById==null);
BO["ie5"]  =   BO["ie"] && (document.namespaces==null) && (!BO["ie4"]) ;
BO["ie6"]  =  BO["ie"] && (document.implementation!=null) && (document.implementation.hasFeature!=null)
BO["ie55"]  =  BO["ie"] && (document.namespaces!=null) && (!BO["ie6"]);
BO["ns4"]  = !BO["ie"] &&  (window.confirm !=null) && (document.createElement ==null);
BO["opera"] =  (self.opera!=null);
BO["gecko"] =  (document.getBoxObjectFor!=null);


//if(location.href.toLowerCase().split("?")[0].indexOf("yahoo.com") >=0){document.domain="yahoo.com";}



/*Global functions*/
function cTag(tagName){return document.createElement(tagName);}
function gObj(id){return document.getElementById(id);}
function gTags(fromElement,tagName){return fromElement.getElementsByTagName(tagName);}
function gID(el){ if( (el.id==null) || (el.id=="") ){  gID.x++;  el.id = "orz_genericID_" +gID.x ;} ;return el.id;};gID.x = 0;

function addEvent(obj, evType, fn){ 
if (obj.addEventListener){  obj.addEventListener(evType, fn, false); return true; }
else if (obj.attachEvent){   var r = obj.attachEvent("on"+evType, fn); return r; }
else { return false; } 
}

function removeEvent(obj, evType, fn){ 
if (obj.removeEventListener){  obj.removeEventListener(evType, fn, false);  return true; }
else if (obj.detachEvent){   var r = obj.detachEvent("on"+evType, fn);    return r; }
else { return false; } 
}

function stopEvent(ev)
{
	if(ev && BO["ie"])
	{
		ev.cancelBubble = true;
		ev.cancelBubble = false;
	}
	
	if(ev && ev.stopPropagation && ev.preventDefault)
	{
		ev.stopPropagation(); 
		ev.preventDefault(); 
	}
	return false;
}



function dialog(url,name,feature)
{
 if(url==null){return false;}
 if(name==null){name=""}
 if(feature==null){feature=""};
 if(window.showModelessDialog)
 {
  	var WindowFeature = new Object();
	WindowFeature["width"] = 400;
	WindowFeature["height"]  =400;
	WindowFeature["left"]  = "";
	WindowFeature["top"]  =  "";
	WindowFeature["resizable"]  = "";
	if(feature !=null && feature!="")
	{
      feature = ( feature.toLowerCase()).split(",");
      for(var i=0;i< feature.length;i++)
		{
          if( feature[i].isArgument())
			{
               var featureName = feature[i].split("=")[0];
			   var featureValue = feature[i].split("=")[1];
			   if(WindowFeature[featureName]!=null){WindowFeature[featureName] = featureValue; }
			}
		}
	}
  
  if(WindowFeature["resizable"]==1 || WindowFeature["resizable"]=="1" || WindowFeature["resizable"].toString().toLowerCase()=="yes"){WindowFeature["resizable"] = "resizable:1;minimize:1;maximize:1;"}
  if(WindowFeature["left"]!=""){WindowFeature["left"] ="dialogLeft:" +  WindowFeature["left"] +"px;";}
  if(WindowFeature["top"]!=""){WindowFeature["top"] ="dialogTop:" +  WindowFeature["Top"] +"px;"; }
  if(window.ModelessDialog ==null){window.ModelessDialog = new Object() ; };
  if(name!="")
  {
   if(window.ModelessDialog[name]!=null && !window.ModelessDialog[name].closed )
   {
     window.ModelessDialog[name].focus();
	 return false;
   }
  }
  var F = WindowFeature["left"] +WindowFeature["top"] +  "dialogWidth:"+WindowFeature["width"] +" px;dialogHeight:"+WindowFeature["height"]+"px;center:1;help:0;" + WindowFeature["resizable"] +"status:0;unadorned:0;edge: raised; ;border:thick;"
  window.ModelessDialog[name] = window.showModelessDialog(url,self,F);
 }
 else
 {
   if(document.getBoxObjectFor){ window.open(url,name,"modal=1,dialog=1," + feature);}
   else{window.open(url,name,feature);}
 }
 return false;
}



/*Make Internet Explorer more compatible with cSS2.0*/
window.insertAfter = function(el,t,hideFrom)
{
 	hideFrom = hideFrom ||"";
	el.runtimeStyle.behavior ="none";
	hideFrom = hideFrom.split(",");
	for(var i=0;i<hideFrom.length;i++)
	{
	if(BO[hideFrom[i]]){return;};
	}

	el.insertAdjacentHTML("AfterEnd",t);
}

window.fisrtCell= function(el)
{
 el.runtimeStyle.behavior ="none";
 var c = el.parentNode.cells;
 if(c[0] == el) {return true;}
 return false;
}

window.lastCell= function(el)
{
 el.runtimeStyle.behavior ="none";
 var c = el.parentNode.cells;
 if(c[c.length-1] == el) {return true;}
 return false;
}

window.hoverTR = function(el)
{  
	
	el.runtimeStyle.behavior ="none";
	el.onmouseover = function(){this.className="hover";};
	el.onmouseout = function(){this.className="";};
}

window.fixFlckr = function(el)
{   

	el.runtimeStyle.behavior ="none";
	if( !BO["ie6"]){return;}
	if(el.tagName.toLowerCase() == "a"){
    el.url = el.href
	el.removeAttribute("href");
	el.onclick = function(){location.href = this.url;}
	el.onmouseover = function(){window.status = "goto " + this.url;}
	el.onmouseout = function(){window.status ="";}
	}
}

window.IsFirstChild = function(el)
{  
  el.runtimeStyle.behavior ="none";
  var at = el.parentNode.all.tags(el.tagName);
  return (at[0] == el);
}

window.IsLastChild = function(el)
{
 
  el.runtimeStyle.behavior ="none";
  var at = el.parentNode.all.tags(el.tagName);
  return (at[at.length-1] == el);
 
}


window.renderMinWidth = function()
{
	var el = document.getElementById("ctnr_bd");
	var bd = document.body;
	if(bd.mw ==null)
	{
	 bd.mw = document.createElement("div");
	 bd.mw.innerHTML ="&nbsp;";
	 bd.mw.className = "min_width";
	 bd.insertAdjacentElement("AfterBegin",bd.mw);
	 bd.fw = document.createElement("div");
	 bd.fw.className = "full_width";
	 bd.fw.innerHTML ="&nbsp;";
	 bd.insertAdjacentElement("AfterBegin",bd.fw);
	}

	if(   bd.mw.offsetWidth >  bd.fw.offsetWidth ){if( el.style.width.toString().toLowerCase() =="auto"){el.style.width =  bd.mw.offsetWidth + "px";};}
	else{   if( el.style.width.toString().toLowerCase() !="auto"){ el.style.width = "auto";}}
	if(el.style.width==""){el.style.width = bd.mw.offsetWidth + "px";}

}



/* SEO redirect link */
function appendRedirectLink(ev)
{
 ev = ev || window.event;
 var et = ev.target || ev.srcElement;
 if(et.tagName)
 {
	while(et.tagName.toLowerCase() !="a")
	{
		et = et.parentNode;
		if(et.tagName)
		{if(et.tagName.toLowerCase()=="body"){return true;}
		}else{return true;}
	}

	if( et.getAttribute("r")!=null && et.getAttribute("r")!="")
	{	
	   et.target = et.getAttribute("target");
	   et.target = ( et.target =="")?"_self":et.target;
	   window.open((et.getAttribute("r") + et.getAttribute("href")),et.target);
	   return false;
	}
 }
}

/* open new window */
var win=null;
function openwin(mypage,myname,w,h,infocus) 
{
	settings="width=" + w + ",height=" + h + ",top=0,left=0,scrollbars=yes,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no";
	var ext = mypage.split(".");
	ext = (ext[ext.length-1] + "").toLowerCase();
	if(ext=="jpg" || ext =="gif")
	{
		win=window.open("",myname,settings);
		win.focus();
		win.document.write('<html><body><img src="' + mypage + '" /></body></html>');
	}
	else
	{
		win=window.open(mypage,myname,settings);
		win.focus();
	}
}


/* open preview window */
var previewLink=null;
function previewWin(obj)
{
	if(document.all)
	    previewLink = document.getElementById(obj).value;
	else if(document.getElementById)
		previewLink = encodeURI(document.getElementById(obj).value);
		//previewLink = document.getElementById(obj).value;
		//previewLink = 'file://'+document.getElementById(obj).value;
	if(previewLink!=="")
	{
		var oPreview = window.open('./preview_photo.php','Preview','width=500,height=500');
		oPreview.focus();
	}
	else
		alert("您尚未選擇相片。");
}

/* 4.2.3 - Customize color */
function diy_check(fn) {

	if (fn == "bg_img_pc") { document.customize_diy.check_bg_img.checked = true; document.customize_diy.bg_img[0].checked = true;}
	if (fn == "bg_img_album") 
	{
		if (document.customize_diy.ulbgimg[0].selected)
			return;
		document.customize_diy.check_bg_img.checked = true;
		document.customize_diy.bg_img[1].checked = true;
		document.customize_diy.set.value = 1;
		openwin('gallery_upload','blog_theme','800','500','front');
	}

	if (fn == "title_img_pc") { document.customize_diy.check_title_img.checked = true; document.customize_diy.title_img[0].checked = true;}
	if (fn == "title_img_album") 
	{
		if (document.customize_diy.ultitimg[0].selected)
			return;
		document.customize_diy.check_title_img.checked = true;
		document.customize_diy.title_img[1].checked = true;
		document.customize_diy.set.value = 2;
		openwin('gallery_upload','blog_theme','800','500','front');

	}

}
function colorChange(color,fn1, fn2) {
	var obj = eval("document.customize_diy."+fn1);
	var colorbox = eval("document.customize_diy."+fn2);
	colorbox.style.backgroundColor = color;
	obj.value = color;

	if (fn2 == "color_1") { document.customize_diy.check_bg_color.checked = true; divhide("myLayer1"); }
	if (fn2 == "color_2") { document.customize_diy.check_title_color.checked = true; divhide("myLayer2"); }
	if (fn2 == "color_3") { document.customize_diy.check_sec_color.checked = true; divhide("myLayer3"); }
	if (fn2 == "color_4") { document.customize_diy.check_pri_color.checked = true; divhide("myLayer4"); }
	if (fn2 == "color_5") { document.customize_diy.check_title_text.checked = true; divhide("myLayer5"); }
	if (fn2 == "color_6") { document.customize_diy.check_sec_text.checked = true; divhide("myLayer6"); }
	if (fn2 == "color_7") { document.customize_diy.check_pri_text.checked = true; divhide("myLayer7"); }

}

function showHide(name){
	obj = document.getElementById(name).style;
	for(var i=0;i<makeDiv.menus.length;i++)
	{
		var menu = document.getElementById( "myLayer" + makeDiv.menus[i] );
		if( menu != document.getElementById(name))
		{
			 menu.style.display="none";
		}
	}


	var menu = document.getElementById(name);
	var i=0;
	var button = null
	while( menu.previousSibling )
	{
		 menu =  menu.previousSibling;
		 if( (menu.className!=null) &&  (menu.className=="color_picker") )
		{
			button = menu;
			break;
		}
	}
	
	if(button)
	{
		obj.top =button.offsetHeight + button.offsetTop + "px";
	}

	if (obj.display=="none"){
		obj.display = "block" ;
	} else {
		obj.display = "none" ;
	}
}

function divhide(name){
   document.getElementById(name).style.display = "none";
}


makeDiv.menus = [];
function makeDiv(type,num){

	var bgcolor = ["#FF1100","#FF2E0C","#FF4C24","#FF6A3C","#FF875A","#FFA97E","#FFCDA7","#040967","#141873","#2D328D","#393D92","#44499A","#5A61AE","#686EB8","#007B1D","#0B842F","#2F9D4C","#54A961","#71B77A","#8BCDA2","#AEDEC1","","#C90216","#CF242D","#E14244","#E25B58","#E97673","#F88E8D","#FBAEA9","#00064F","#000D57","#04216D","#133478","#2FA8D0","#495B97","#6E87BA","#0B620B","#206D1C","#448332","#4F8A47","#6D9D67","#87AC80","#A6C5A2","","#F01F40","#F33954","#F0586A","#F67383","#F48E9C","#FAAEB8","#F6CDD7","#0049AA","#035AB7","#2771C9","#4687D6","#6A9DE2","#94BAF3","#BAD7FF","#A6DE1F","#ABE02D","#B4E343","#C0E860","#C7EA73","#D5F096","#E2F4B5","","#970015","#981325","#AA2C3D","#A93F4C","#C56E78","#C2878B","#DAB0B3","#002971","#003778","#0D4C8D","#225B95","#577EAC","#7690B7","#A0B7D4","#657000","#737E00","#7A7D14","#787326","#76743F","#8D9D6B","#9AB08A","","#6E0017","#710C2F","#7B243D","#76374E","#834C6B","#9A718B","#987E95","#006BD4","#0071DA","#0087E1","#3AA9F4","#37B7FF","#94DBFF","#A7DEFF","#FFFF00","#FFFF33","#FFFF03","#FFFF39","#FFFF6D","#FFFF9F","#FFFFD0","","#E80049","#F02C73","#F373A2","#F6739A","#F49FBA","#F4D0E8","#F6DEF0","#045B9E","#1666A4","#2D76AD","#4384B6","#6199C3","#89B3D2","#9DC2DA","#A26F08","#CD8E0A","#CF9D2E","#DDA600","#DEB41B","#DBC55B","#EDD692","","#9D0044","#A90044","#AE1870","#BF5797","#CD5A98","#E49CC8","#E1A7CF","#007698","#007DA0","#0092B1","#179AB0","#3AA6B1","#6EC1C2","#92CDD0","#944900","#954700","#A76100","#A76B11","#A97827","#BA9247","#BA9F6A","","#4E003D","#540B4A","#6D2262","#7A3771","#926594","#A280A2","#C2A9C5","#005557","#006161","#03747B","#1B8087","#579D9F","#78A9AC","#A2C6CC","#F45F00","#FA7B1B","#FF9739","#FFA755","#FFB874","#FFCD8A","#FFE2B0","","#4E1587","#682C98","#8746AA","#9761BB","#A380CD","#C9A6E6","#DEC9FB","#009D61","#00A96B","#00B483","#26C59D","#4FD3B0","#7DE1BB","#A0F0DE","#841400","#922600","#A33F0A","#A3551C","#A66432","#B87A51","#B79571","","#1B0B73","#2D1C81","#4C379D","#684FA9","#876EBA","#9790D4","#BBBAEF","#008E37","#009A4C","#26B168","#3CB773","#47BE80","#64C992","#76D3A2","#B31C00","#B0320E","#B03F21","#B04A24","#B05739","#AE623A","#AC6E54","","#FFFFFF","#F4F4F4","#E6E6E6","#DADADA","#CDCDCD","#C0C0C0","#B4B4B4","#A8A8A8","#9A9A9A","#8D8D8D","#818181","#747474","#666666","#595959","#4B4B4B","#3E3E3E","#303030","#212121","#131313","#0A0A0A","#000000"];

	document.write ("<div id=\"myLayer"+num+"\" style=\"position:absolute;right:30px;width:300px;display:none;z-index:1;\" onmouseleave=\"divhide('myLayer"+num+"');\"><iframe style='display:none;_display:block;position:absolute;left:0;top:0;height:115px;z-index:-1;'></iframe>");
	document.write ("<table border=1 cellpadding=0 cellspacing=0 style=\"border:1px solid #000;background-color:#000;\">");
	document.write ("<tr>");
	for (i=0;i<bgcolor.length;i++) {
		if(bgcolor[i] != "") {
			document.write ("<td width=\"10\" height=\"10\" bgcolor=\""+bgcolor[i]+"\" onclick=\"colorChange('"+bgcolor[i]+"','"+type+"', 'color_"+num+"',"+num+");\" style=\"cursor:hand;cursor:pointer;\"></td>");
		} else {
			document.write ("</tr>");
			document.write ("<tr>");
		}
	}
	document.write ("</tr>");
	document.write ("</table>");
	document.write ("</div>");	
	
	makeDiv.menus[makeDiv.menus.length] = num;
	
}

function changeImage(f) {
  var ele1, ele2,img,imgRoot,imgPath;

  imgRoot = "http://tw.yimg.com/i/tw/blog/";
  ele1 = f.select_skin;
  ele2 = f.select_bg;

  imgPath = imgRoot + ele2.options[ele2.selectedIndex].value + '_' + ele1.options[ele1.selectedIndex].value + '.gif';
  img = document.getElementById('img_bg');
  img.src= imgPath;
}


//pop up registration form
function fSubscribe(e){
	
	var ev = e || window.event;
	var el = ev.target || ev.srcElement;
	
	if (window.event)
	{
		window.event.cancelBubble = true;
		window.event.returnValue = false;
	} else if (e.stopPropagation)
	{
		e.stopPropagation();
		e.preventDefault();
	}
	
	if (!gObj('yblgsubpop'))
	{	
		var OPops = gObj('ypopsub');
		document.body.appendChild(OPops);	
	
		var ODiv = document.createElement('div');		
		
		OPops.appendChild(ODiv);
		ODiv.setAttribute('id','yblgsubpop');

		var OFrame = OPops.getElementsByTagName('iframe')[0];
		//Get domain name and folder path
		var sURL = document.location;
		sURL = sURL.toString();
		var aURL = sURL.split('/');
		OFrame.setAttribute('src',aURL[0]+'//'+aURL[2]+'/'+aURL[3]+'/popSubscribe.html');
		//For local debug use
		//OFrame.setAttribute('src','popSubscribe.html?'+Math.random()+Date.parse(new Date()));
		//alert(OFrame.src);
		OPops.style.left = '200px';
		OPops.style.top='100px';
		OPops.style.visibility='visible';

	}

	var fHideMe = function(e) {
		OPops.style.visibility='hidden';
		OPops.removeChild(ODiv);
	};

	if(gObj('closeme')){addEvent(gObj('closeme'),'click',fHideMe); };
};

function AddSubscribe() {
    return false;
}
function ChangeSet() {
    act=document.getElementById('act');
    act.value='d';
    document.subform.submit();
}

//Added by Alex 2006.06
function insWBR(sStr) {
 return sStr.replace(/([\w|\d|\.]{6})/g, "\$1<wbr>");
}

YAHOO.namespace("Tw.Blog");
var YUE = YAHOO.util.Event;
var YUD = YAHOO.util.Dom;
var YMI = YAHOO.My.Interaction;
var YMD = YAHOO.My.Dom;

YAHOO.Tw.Blog.Module = new function() {
	
	this.folderAssociateList = function(oModule,aMainClass,aSubClass) {
		var dMainCat = YUD.getElementsByClassName("select_main","select",oModule);
		var dSubCat = YUD.getElementsByClassName("select_sub","select",oModule);
		for(i in dMainCat) {
			init_combo(dMainCat[i].id, dSubCat[i].id, aMainClass, aSubClass);
		}
	};
	
	this.dataGridTable = function(oModule,bMultiEdit,iOptionTextMaxLength) {
		var aTROrg = [];
		var aTRNew = [];
		var dTable = YUD.getElementsByClassName("datatable","table",oModule)[0];
		var dRow = YUD.getElementsByClassName("datarow","tr",dTable);
		var dBtnEdit = YUD.getElementsByClassName("btn_edit","input",dTable);
		var dBtnDel = YUD.getElementsByClassName("btn_del","input",dTable);
		var dBtnSave = YUD.getElementsByClassName("btn_save","input",dTable);
		var dBtnCancel = YUD.getElementsByClassName("btn_cancel","input",dTable);
		
		var reserveOriginalTable = function(bShortenOption,iOptionTextMaxLength) {		
			var iRow,jRow,iCell,jCell,i,j,sTemp,sTemp2,sTempShort;
			var aTableCell = [];
			//Shorten  select menu options
			/*
			if(bShortenOption) {
				//iOptionTextMaxLength is max text Length for each select menu option
				var dOption = oModule.getElementsByTagName("option");
				for(i=0,j=dOption.length;i<j;i++) {
					if(dOption[i].text.length > iOptionTextMaxLength) {
						sTemp = dOption[i].text;
						dOption[i].text = sTemp.substr(0,iOptionTextMaxLength-1)+"...";
					}
				}
			}
			*/
			for(iRow=0,jRow=dRow.length;iRow<jRow;iRow++) {
				aTableCell[iRow] = [];
				for(iCell=0,jCell=dRow[iRow].cells.length;iCell<jCell;iCell++) {
					aTableCell[iRow][iCell] = dRow[iRow].cells[iCell].innerHTML;
					//Shorten  select menu options
					var dOption = dRow[iRow].cells[iCell].getElementsByTagName("option");
					for(i=0,j=dOption.length;i<j;i++) {
						if(dOption[i].text.length > iOptionTextMaxLength) {
							sTemp = dOption[i].text;
							sTempShort = sTemp.substr(0,iOptionTextMaxLength-1)+"...";
							sTemp2 = aTableCell[iRow][iCell];
							//alert(sTempShort+","+sTemp2)
							aTableCell[iRow][iCell] = sTemp2.replace(sTemp, sTempShort);
							
						}
					}	
				}
			}
			return aTableCell;
		};
		
		var textToLink = function(dSpan,dRoot) {
		//If there is A has the same class name with SPAN, add link inside SPAN and hide A.
			var dA;
			//Class name was added by DOM method, need to trim for prevent error.
			var sClassName = YAHOO.My.String.trim(dSpan.className);
			if(sClassName) {
				dA = YUD.getElementsByClassName(sClassName,"a",dRoot)[0];
				if(dA) {
					dSpan.innerHTML = '<a href="' + dA.href + '">' + dSpan.innerHTML + '</a>';
					//Hide orignal link text
					YMD.createStyle('a.'+sClassName+'{display:none;}\n');
				}
			}
		};
		
		var FormFieldToText = function(dParent) {
		//check every node in the cell. 
			var iNode,iOption,jOption,sValue,sClass,sURL,dFormField,dSubFormField;
			var iNode=-1;
			while(iNode<dParent.childNodes.length-1) {
				//alert(iNode);
				iNode+=1;
				dPrevFormField = null;
				sValue = "";
				sClass = "";
				dFormField = dParent.childNodes[iNode];
				//alert(dFormField.nodeName);
				
				if(dFormField.nodeName == "INPUT" && dFormField.type == "text") {
				//Text field
					//alert("TEXT");
					sValue = dFormField.value;
					sClass = dFormField.className;
				} else if(dFormField.nodeName == "INPUT" && dFormField.type == "hidden") {
				//Hidden field
					dFormField.disabled = true;
				} else if(dFormField.nodeName == "SELECT") {
				//Select menu
					//alert("SELECT");
					for(iOption=0,jOption=dFormField.childNodes.length;iOption<jOption;iOption++) {
						if(dFormField.childNodes[iOption].selected) {
							sValue = dFormField.childNodes[iOption].firstChild.nodeValue;
							sClass = dFormField.className;
							break;
						}
					}
				} else if(dFormField.nodeName == "LABEL" && YUD.hasClass(dFormField,"radiogruop")) {
				//radio or checkbox
					dSubFormField = dFormField.getElementsByTagName("input")[0];
					if(dSubFormField) {
						if(dSubFormField.type.toUpperCase() == "RADIO") {
							if(dSubFormField.checked){
								sClass = dSubFormField.className;
								dFormField.removeChild(dSubFormField);
								sValue = dFormField.innerHTML;
								
							} else {
								dFormField.parentNode.removeChild(dFormField);
							}
						}
					}
				} else if(dFormField.nodeName == "LABEL" && YUD.hasClass(dFormField,"associatelist")) {
				//Associated list menu
					dSubFormField = dFormField.getElementsByTagName("select")[0];
					//alert(dSubFormField);
					if(dSubFormField) {
								sValue = dSubFormField.title;
								sClass = dSubFormField.className;
								dFormField.removeChild(dSubFormField);
					}
				}
				
				if(sValue) {
					dSpan = document.createElement("span");
					sValue = insWBR(sValue);
					dSpan.innerHTML = sValue;
					if(sClass) {
						YMD.addClass(dSpan,sClass);
					}
					dParent.replaceChild(dSpan,dFormField);
					textToLink(dSpan,dParent);
				}
				//alert("Finished!!");
			}
		};
		
		var convertAllFormFieldToText = function() {
			var iCell,jCell;
			var dCell = YUD.getElementsByClassName("datacell","*",dTable);

			//Show Edit and Del button, hide Save and Cancle button
			YUD.setStyle(dBtnEdit,"display","block");
			YUD.setStyle(dBtnSave,"display","none");
			YUD.setStyle(dBtnDel,"display","block");
			YUD.setStyle(dBtnCancel,"display","none");
			
			//Convert form Field to normal text
			//First, walk around every cell
			for(iCell=0,jCell=dCell.length;iCell<jCell;iCell++) {
				//alert("Cell="+iCell);
				FormFieldToText(dCell[iCell]);
			}
			
		};
		
		var restoreRow = function(dRow,aTableCell) {
		//Restore this row cells to  form fields
			var i,j,k,h,dSelect,dAssList,dTd;
			for(i=0,j=dRow.cells.length;i<j;i++) {
				if(YUD.hasClass(dRow.cells[i],"datacell")) {
					dRow.cells[i].innerHTML = aTableCell[dRow.rowIndex-1][i];
				}
				//Firefox only. For dynamic associate list menu, selecte the default option
				if(document.uniqueID == undefined) {
					dAssList = YUD.getElementsByClassName("associatelist","label",dRow.cells[i]);
					for(k in dAssList) {
						dSelect = dAssList[k].getElementsByTagName("select")[0];
						if(dSelect) {
							for(h in dSelect.options) {
								if(dSelect.options[h].text == dSelect.title) {
									dSelect.options[h].selected = true;
								}
							}
						}
						dTd = YMD.getParentElementByTag(dAssList[k],"td");
						YUD.setStyle(dTd,"whiteSpace","nowrap");
					}
				}
			}
		}
		
		var getSelectedRecordID = function(dTarget,sIDFieldName) {
			var dTR = YMD.getParentElementByTag(dTarget,"tr");
			var dIDField = YUD.getElementsByClassName("primary_key","input",dTR)[0];
			if(sIDFieldName) {
				var dForm = YMD.getParentElementByTag(dTarget,"form");
				var dPKField = document.createElement("input");
				dPKField.setAttribute("type","hidden");
				dPKField.setAttribute("name",sIDFieldName);
				dPKField.setAttribute("value",dIDField.value);
				dForm.appendChild(dPKField);
			}
			return dIDField.value;
		}

		var onCancel = function(e){
			if(e.target.disabled) {
				YUE.stopEvent(e);
				return false;
			}
			var iCell,jCell;
			var dTR = YMD.getParentElementByTag(e.target,"tr");
			var dBtnThisSave = YUD.getElementsByClassName("btn_save","input",dTR)[0];
			var dBtnThisEdit = YUD.getElementsByClassName("btn_edit","input",dTR)[0];
			var dBtnThisCancel = YUD.getElementsByClassName("btn_cancel","input",dTR)[0];
			var dBtnThisDel = YUD.getElementsByClassName("btn_del","input",dTR)[0];
			
			//Show Edit and Del button, hide Save and Cancle button
			YUD.setStyle(dBtnThisEdit,"display","block");
			YUD.setStyle(dBtnThisSave,"display","none");
			YUD.setStyle(dBtnThisDel,"display","block");
			YUD.setStyle(dBtnThisCancel,"display","none");
			
			if(!bMultiEdit) {
				for (i in dBtnEdit) {
					dBtnEdit[i].disabled = false;
				}
				for (i in dBtnDel) {
					dBtnDel[i].disabled = false;
				}
			}
			
			restoreRow(dTR,aTRNew);
									
			YUE.stopEvent(e);
            return false;
			
		};
		
		var onEdit = function(e) {
			if(e.target.disabled) {
				YUE.stopEvent(e);
				return false;
			}
			var i;
			var dTR = YMD.getParentElementByTag(e.target,"tr");
			var dBtnThisSave = YUD.getElementsByClassName("btn_save","input",dTR)[0];
			var dBtnThisEdit = YUD.getElementsByClassName("btn_edit","input",dTR)[0];
			var dBtnThisCancel = YUD.getElementsByClassName("btn_cancel","input",dTR)[0];
			var dBtnThisDel = YUD.getElementsByClassName("btn_del","input",dTR)[0];
						

			//If can't edit multi-row at same time, disable all other EDIT buttons
			if(!bMultiEdit) {
				for (i in dBtnEdit) {
					dBtnEdit[i].disabled = true;
				}
				for (i in dBtnDel) {
					dBtnDel[i].disabled = true;
				}
			}
			
			restoreRow(dTR,aTROrg);

			//hide Edit and Del button, show Save and Cancle button
			YUD.setStyle(dBtnThisEdit,"display","none");
			YUD.setStyle(dBtnThisSave,"display","block");
			YUD.setStyle(dBtnThisDel,"display","none");
			YUD.setStyle(dBtnThisCancel,"display","block");
			
			//Enable hidden fields in this row
			dHidden = dTR.getElementsByTagName("input");
			for ( i in dHidden) {
				if(dHidden[i].type == "hidden") {
					dHidden[i].disabled = false;
				}
			}
			
			YUE.stopEvent(e);
            return false;
			
		};
		
		var onSave = function(e) {
			var dForm;
			//If the button is disabled, do nothing.
			if(e.target.disabled) {
				YUE.stopEvent(e);
				return false;
			}
			
			//Append selected id field to form
			dForm = YMD.getParentElementByTag(e.target,"form");
			getSelectedRecordID(e.target,"selected_id");
			dForm.act.value = 'e';
			dForm.submit();
			//Disable Save button
			e.target.disabled = true;
		};
		
		var onDelete = function(e) {
			var dForm;
			//If the button is disabled, do nothing.
			if(e.target.disabled) {
				YUE.stopEvent(e);
				return false;
			}
			//If delete, give it a warring
			if(confirm("是否確定要刪除？")) {
				//Append selected id field to form
				dForm = YMD.getParentElementByTag(e.target,"form");
				getSelectedRecordID(e.target,"selected_id");
				dForm.act.value = 'd';
				dForm.submit();
				//Disable Save button
				e.target.disabled = true;
			}
		};
		
		YMI.addListener(oModule.id,'click',onEdit,'class','btn_edit',true,1);
		YMI.addListener(oModule.id,'click',onCancel,'class','btn_cancel',true,1);
		YMI.addListener(oModule.id,'click',onSave,'class','btn_save',true,1);
		YMI.addListener(oModule.id,'click',onDelete,'class','btn_del',true,1);
		
		//initial datagrid
		
		//dTable.style.display = "none";
		//aTROrg = reserveOriginalTable();
		aTROrg = reserveOriginalTable(true,iOptionTextMaxLength);
		convertAllFormFieldToText();
		aTRNew = reserveOriginalTable();
		//dTable.style.display = "block";

	};
	
	this.selectAllCheckbox = function(oModule) {
		
		
		var dToggleAll = document.getElementById("checkallbox");
		dToggleAll.onclick = function() {
			var dCHK = YUD.getElementsByClassName("checkbox_id","input","table");
			for(i=0,j=dCHK.length;i<j;i++) {
        		dCHK[i].checked = this.checked;
        	}
		};
		
	};
	
	this.insertSmileCode = function(oModule) {
		var dTextArea = document.getElementById("blast");
		var dSmile = document.getElementById("smiley_insert");
		
		
		var onSmileClick = function(e){
			var sTmp = dTextArea.value;
			sTmp = sTmp + " " + e.target.getAttribute("alt") + " ";
			dTextArea.value = sTmp;
			YUE.stopEvent(e);
            return false;		
		};
		
		YMI.addListener(oModule.id,'click',onSmileClick,'class','smiley',true,1);
		
	};
	
	this.sliderBar = function(oModule,sSliderBg,sSliderHandler,sValueFeild) {
		
		var oSlider;
    	var iMinVlaue = 0;
    	var iMaxValue = 120;
    	var iscaleFactor = 1;
		var ioldValue;
		oSlider = YAHOO.widget.Slider.getHorizSlider(sSliderBg,sSliderHandler, iMinVlaue, iMaxValue);
		//Get default Value from form field
		ioldValue = document.forms[0][sValueFeild].value;
		
		if(ioldValue == '' ){
			ioldValue = iMaxValue/iscaleFactor;
		} else {
			ioldValue = Number(ioldValue);
			if(isNaN(ioldValue) || ioldValue<iMinVlaue || ioldValue>(iMaxValue/iscaleFactor)) {
				ioldValue = iMaxValue/iscaleFactor;
			}
		}
		ioldValue = Math.round(100-ioldValue)*1.2;
		oSlider.setValue(ioldValue,true,true);
		
		oSlider.onChange = function(offsetFromStart) {
			document.forms[0][sValueFeild].value = 100-Math.round(offsetFromStart/1.2);
		};
		oSlider.onSlideStart = function() {
			//alert("onSlideStart");
		};
		
	};
	
	this.customizeCSS = function(oModule) {
		var dTextarea = oModule.getElementsByTagName("textarea");
		var dDiv = document.getElementById("default_css");
		
		String.prototype.Replace = function(from,to){
			var r, re;
			re = eval("/" + from + "/g");
			r = this.replace(re, to);
			return(r);
		}
		
		function formatCSS(objScript) {			
			objScript.innerText = objScript.innerText.Replace('{','{\n    ');			
			objScript.innerText = objScript.innerText.Replace(';',';\n    ');			
			objScript.innerText = objScript.innerText.Replace('    }','}\n');
		}
		
		onEmptyText = function(e) {
			if(confirm("確定清空所有內容？")) {
				dTextarea[0].value = "";
			}
			YUE.stopEvent(e);
            return false;
		};
		
		onDefaultText = function(e) {
			if(confirm("確定要恢復成預設的樣式？\n提醒：您自訂的所有樣式將會遺失。?")) {
				dTextarea[0].value = dDiv.innerHTML;
				
				//If IE, need to take care line break problem for innerHTML. Cause innerHTML doesn't have line break in IE.
				if(dTextarea[0].innerText) {
					formatCSS(dTextarea[0]);
				}
			}
			YUE.stopEvent(e);
            return false;
		};
		
		onCancel = function(e) {
			document.location='http://tw.myblog.yahoo.com';
		};
		
		YMI.addListener(oModule.id,'click',onEmptyText,'class','form_empty',true,1);
		YMI.addListener(oModule.id,'click',onDefaultText,'class','form_reset',true,1);
		YMI.addListener(oModule.id,'click',onCancel,'class','cancelbtn',true,1);
	};
	
	this.confirmCusCSS = function(oModule,sFunctionName) {
		var dForm = oModule.getElementsByTagName("form")[0];
		dForm.onsubmit = function() {
			return(confirm("提醒：更換"+sFunctionName+"後，會重設自訂樣式中的樣式表，確定要繼續？"));
		}
	};
	
	this.validteFormImageCheck = function(oModule) {
		var dForm = oModule.getElementsByTagName("form")[0];
		var dModify =  document.getElementById("modifybtn");
		
		//prevent cache for Firfox
		dForm.reset();
		
		var onFormSubmit = function(e) {
			var dTextField = document.getElementsByName(".secword")[0];
			if(dForm.preview_save.value == 1 && dTextField.value=="") {
				alert("請正確填寫驗證碼。");
				YUE.stopEvent(e);
				return false;
			}
		};
		
		var onModify = function(e) {
			dForm.action = dForm.modifyact.value;
			dForm.preview_save.value = 0;
		};
		
		YUE.addListener(dForm,'submit',onFormSubmit);
		YUE.addListener(dModify,'click',onModify);
	};
	
	this.articleContent = function(oModule) {
		var onToggleDisplay = function(e){
			if (YUD.hasClass(oModule,"visible")) {
				//display:none
				YUD.replaceClass(oModule,"visible","invisible");
			} else {
				//display:block
				YUD.replaceClass(oModule,"invisible","visible");
			}

			YUE.stopEvent(e);
            return false;
        };
        var oLinks = YUD.getElementsByClassName("norgie","a",oModule);
        for(i=0,j=oLinks.length;i<j;i++) {
            YUE.on(oLinks[i],'click',onToggleDisplay);
        }
	};
	
};

(function(){
    var YUE = YAHOO.util.Event;
	var YUD = YAHOO.util.Dom;
	var YBlog = YAHOO.Tw.Blog.Module;
	YUE.onAvailable('titl_img_slider',function(){
        YBlog.sliderBar(this,"titl_img_slider_bg","titl_img_slider_handler","titl_img_opacity_value");
    });
	YUE.onAvailable('sec_slider',function(){
        YBlog.sliderBar(this,"sec_slider_bg","sec_slider_handler","sec_opacity_value");
    });
	YUE.onAvailable('pri_slider',function(){
        YBlog.sliderBar(this,"pri_slider_bg","pri_slider_handler","pri_opacity_value");
    });
	YUE.onAvailable('blast_slider',function(){
        YBlog.sliderBar(this,"blast_slider_bg","blast_slider_handler","blast_opacity_value");
    });
	YUE.onAvailable('setup_blast',function(){
        YBlog.insertSmileCode(this);
    });
	YUE.onAvailable('ycmntlist',function(){
        YBlog.selectAllCheckbox(this);
    });
	YUE.onAvailable('org_all_art',function(){
        YBlog.dataGridTable(this,0,5);
    });
	YUE.onAvailable('man_cus_mod',function(){
        YBlog.dataGridTable(this,0,100);
    });
	YUE.onAvailable('folder_add',function(){
		init_combo('mainCat', 'cat', class1, class2);
    });
	YUE.onAvailable('album_add',function(){
		init_combo('mainCat', 'cat', class1, class2);
    });
	YUE.onAvailable('album_setup',function(){
		var oModule = this;
		setTimeout(function(){YBlog.folderAssociateList(oModule,class1,class2);},0);
		setTimeout(function(){YBlog.dataGridTable(oModule,0,100);},0);
    });
	YUE.onAvailable('folder_setup',function(){
		var oModule = this;
		setTimeout(function(){YBlog.folderAssociateList(oModule,class1,class2);},0);
		setTimeout(function(){YBlog.dataGridTable(oModule,0,100);},0);
    });
	YUE.onAvailable('subs_folder_setup',function(){
        YBlog.dataGridTable(this,0,100);
    });
	YUE.onAvailable('cus_style',function(){
        YBlog.customizeCSS(this);
    });
	YUE.onAvailable('customize_theme',function(){
        YBlog.confirmCusCSS(this,"樣板");
    });
	YUE.onAvailable('customize_package',function(){
        YBlog.confirmCusCSS(this,"組合樣式");
    });
	YUE.onAvailable('ypreviewmsg',function(){
        YBlog.validteFormImageCheck(this);
    });
	YUE.onAvailable('yartcmt',function(){
        YBlog.articleContent(this);
    });
	YUE.onAvailable('upload_borwse',function(){
        YBlog.articleContent(this);
    });
})();