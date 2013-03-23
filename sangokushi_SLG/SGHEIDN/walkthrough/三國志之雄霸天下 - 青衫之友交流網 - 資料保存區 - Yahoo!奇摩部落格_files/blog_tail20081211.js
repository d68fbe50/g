
//return interger (0~infinite)
String.prototype.toInt=function(){;  var r, re;    re = /[^0-9]/g;   r ="0" +  this.replace(re, "");return(parseInt(r)); };


/*form validation*/
validator = 
{
	integer : /^[-\+]?\d+$/,
	email : /^\w+([-+.]\w+)*@\w+([-.]\\w+)*\.\w+([-.]\w+)*$/,
	number : /^\d+$/
}

function invalid_input(el)
{
	el.focus();
	addClass(el,"input_on_error");
	if(el.onkeydown == null){ el.onkeydown = function(){ removeClass(this,"input_on_error");this.onkeydown=null;};}
}

/******************************************************************************************/

function ylib_Browser()
{
	d=document;
	this.agt=navigator.userAgent.toLowerCase();
	this.major = parseInt(navigator.appVersion);
	this.dom=(d.getElementById)?1:0;
	this.ns=(d.layers);
	this.ns4up=(this.ns && this.major >=4);
	this.ns6=(this.dom&&navigator.appName=="Netscape");
	this.op=(window.opera? 1:0);
	this.ie=(d.all);
	this.ie4=(d.all&&!this.dom)?1:0;
	this.ie4up=(this.ie && this.major >= 4);
	this.ie5=(d.all&&this.dom);
	this.win=((this.agt.indexOf("win")!=-1) || (this.agt.indexOf("16bit")!=-1));
	this.mac=(this.agt.indexOf("mac")!=-1);
}

var oBw = new ylib_Browser();

function ylib_getObj(id,d)
{
	var i,x;  if(!d) d=document; 
	if(!(x=d[id])&&d.all) x=d.all[id]; 
	for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][id];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=ylib_getObj(id,d.layers[i].document);
	if(!x && document.getElementById) x=document.getElementById(id); 
	return x;
}

function ylib_getH(o) { return (oBw.ns)?((o.height)?o.height:o.clip.height):((oBw.op&&typeof o.style.pixelHeight!='undefined')?o.style.pixelHeight:o.offsetHeight); };
function ylib_setH(o,h) { if(o.clip) o.clip.height=h; else if(oBw.op && typeof o.style.pixelHeight != 'undefined') o.style.pixelHeight=h; else o.style.height=h; };
function ylib_getW(o) { return (oBw.ns)?((o.width)?o.width:o.clip.width):((oBw.op&&typeof o.style.pixelWidth!='undefined')?w=o.style.pixelWidth:o.offsetWidth); };
function ylib_setW(o,w) { if(o.clip) o.clip.width=w; else if(oBw.op && typeof o.style.pixelWidth != 'undefined') o.style.pixelWidth=w; else o.style.width=w; };
function ylib_getX(o) { return (oBw.ns)?o.left:((o.style.pixelLeft)?o.style.pixelLeft:o.offsetLeft); };
function ylib_setX(o,x) { if(oBw.ns) o.left=x; else if(typeof o.style.pixelLeft != 'undefined') o.style.pixelLeft=x; else o.style.left=x; };
function ylib_getY(o) { return (oBw.ns)?o.top:((o.style.pixelTop)?o.style.pixelTop:o.offsetTop); };
function ylib_setY(o,y) { if(oBw.ns) o.top=y; else if(typeof o.style.pixelTop != 'undefined') o.style.pixelTop=y; else o.style.top=y; };
function ylib_getPageX(o) { var x=0; if(oBw.ns) x=o.pageX; else { while(eval(o)) { x+=o.offsetLeft; o=o.offsetParent; } } return x; };
function ylib_getPageY(o) { var y=0; if(oBw.ns) y=o.pageY; else { while(eval(o)) { y+=o.offsetTop; o=o.offsetParent; } } return y; };
function ylib_getZ(o) { return (oBw.ns)?o.zIndex:o.style.zIndex; };
function ylib_moveTo(o,x,y) { ylib_setX(o,x);ylib_setY(o,y); };
function ylib_moveBy(o,x,y) { ylib_setX(o,ylib_getPageX(o)+x);ylib_setY(o,ylib_getPageY(o)+y); };
function ylib_setZ(o,z) { if(oBw.ns)o.zIndex=z;else o.style.zIndex=z; };
function ylib_show(o,disp) { (oBw.ns)? '':(!disp)? o.style.display="inline":o.style.display=disp; (oBw.ns)? o.visibility='show':o.style.visibility='visible'; };
function ylib_hide(o,disp) { (oBw.ns)? '':(arguments.length!=2)? o.style.display="none":o.style.display=disp; (oBw.ns)? o.visibility='hide':o.style.visibility='hidden'; };
function ylib_setStyle(o,s,v) { if(oBw.ie5||oBw.dom) eval("o.style."+s+" = '" + v +"'"); };
function ylib_getStyle(o,s) { if(oBw.ie5||oBw.dom) return eval("o.style."+s); };
function ylib_addEvt(o,e,f,c){ if(o.addEventListener)o.addEventListener(e,f,c);else if(o.attachEvent)o.attachEvent("on"+e,f);else eval("o.on"+e+"="+f) };
function ylib_writeHTML(o,h) { if(oBw.ns){var doc=o.document;doc.write(h);doc.close();return false;} if(o.innerHTML)o.innerHTML=h; };

function ylib_insertHTML(o,h,w)
{
	if(oBw.op) return;
	if(o.insertAdjacentHTML)
	{ 
		o.insertAdjacentHTML(w,h);
		return;
	}
	if(oBw.ns)
	{
		ylib_writeHTML(o,h);
		return;
	}
	var r = o.ownerDocument.createRange();
	r.setStartBefore(o);
	var frag = r.createContextualFragment(h);
	ylib_insertObj(o,w,frag);
}


/* Buttons */
function ClickButton(p_sButtonId, p_sHiddenFieldId, p_oClickHandler)
{ 

	var oButton = document.getElementById(p_sButtonId);
	
	if(oButton && oButton.form)
	{
		var oHiddenField = document.getElementById(p_sHiddenFieldId);

		if(oHiddenField)
		{
			oButton.HiddenField = oHiddenField;
			oButton.HiddenField.value = "";
			oButton.onclick = function () {
				if(typeof p_oClickHandler != 'undefined' && p_oClickHandler) p_oClickHandler();
				this.HiddenField.value = this.value;
				this.form.submit();
			};
			
			return oButton;
		}
		else return false;
	}
	else return false;
}

function Menu_Click(p_oEvent)
{
	var oEvent = p_oEvent ? p_oEvent : window.event;
	var oSender = p_oEvent ? oEvent.target : oEvent.srcElement;

	if(p_oEvent) oEvent.stopPropagation();
	else oEvent.cancelBubble = true;
	
	this.Sender = oSender;
	this.Event = oEvent;

	if(typeof this.ClickHandler != 'undefined') this.ClickHandler();
}

function Menu_MouseOver(p_oEvent)
{
	var oEvent = p_oEvent ? p_oEvent : window.event;
	var oSender = p_oEvent ? oEvent.target : oEvent.srcElement;
	
	if(oSender.tagName == 'LI') oSender.className = 'hover';
	else if(oSender.tagName == 'A') oSender.parentNode.className = 'hover';
	else return false;
}

function Menu_MouseOut(p_oEvent)
{
	var oEvent = p_oEvent ? p_oEvent : window.event;
	var oSender = p_oEvent ? oEvent.target : oEvent.srcElement;
	
	if(oSender.tagName == 'LI') oSender.className = '';
	else if(oSender.tagName == 'A') oSender.parentNode.className = '';
	else return false;	
}

function Button_Click(p_oEvent)
{
	var oEvent = p_oEvent ? p_oEvent : window.event;
	var oSender = p_oEvent ? oEvent.target : oEvent.srcElement;

	if(p_oEvent) oEvent.stopPropagation();
	else oEvent.cancelBubble = true;

	this.Event = oEvent;
	this.Sender = oSender;

	HideMenu();
	this.Menu.Button = this;
	g_oMenu = this.Menu;

	if(typeof this.ClickHandler != 'undefined') this.ClickHandler();
	else g_oMenu.Show();
	
	document.onclick = Document_Click;
}

function ButtonMenu(p_sMenuId, p_oClickHandler)
{
	var oMenu = document.getElementById(p_sMenuId);

	if(oMenu)
	{
		//If there is more than 10 menu items, show scroll bar in the menu.
		var oMenuItem = oMenu.getElementsByTagName("li");
		if(oMenuItem.length >15) {
			oMenu.style.width = "150px";
			oMenu.style.overflow = "scroll";
			oMenu.style.height = "30em";
		}
		
		//Insert <WBR> if needed
		for(var i=0,j=oMenuItem.length;i<j;i++) {
			oMenuItem[i].innerHTML = insWBR(oMenuItem[i].innerHTML);
		}
		
		if(typeof p_oClickHandler != 'undefined') oMenu.ClickHandler = p_oClickHandler;
			
		oMenu.Show = function () { 
			
			if (gObj('ctnr_bd'))
			{
				if(document.all) this.style.width = this.offsetWidth+'px';
				var nTop = ylib_getPageY(this.Button) + this.Button.offsetHeight;
				var nLeft = ylib_getPageX(this.Button);
			} else {
			
			//var pos = ygPos.getPos(this.Button);
			//ygPos.setPos(this,[pos[0],pos[1]+18]);
			
			var nTop = (this.Button.offsetParent.offsetTop+ this.Button.offsetHeight)+10;
			var nLeft = this.Button.offsetLeft-2;
			
			if(oBw.ie && oBw.mac){nTop -= 4;nLeft -= 10;}
			}
			

			this.style.top = nTop+"px";
			this.style.left = nLeft+"px";
			this.style.visibility = 'visible';			
			
		};
			
		oMenu.onclick = Menu_Click;
		
		if(document.all)
		{
			oMenu.onmouseover = Menu_MouseOver;
			oMenu.onmouseout = Menu_MouseOut;
		}
		return oMenu;
	}
	else return false;
}

function Button(p_sButtonId)
{
	var oButton = document.getElementById(p_sButtonId);

	if(oButton)
	{
		oButton.onclick = Button_Click;
		return oButton;
	}
	else return false;
}

function MenuButton()
{
	var nArguments = arguments.length;

	function __MenuButton_TwoArguments(p_sButtonId, p_sMenuId)
	{
		var oButton = new Button(p_sButtonId);

		if(oButton)
		{
			oButton.Menu = new ButtonMenu(p_sMenuId);
			return oButton;
		}
		else return false;	
	};
	
	function __MenuButton_ThreeArguments(p_sButtonId, p_sMenuId, p_oMenuClickHandler)
	{
		var oButton = new Button(p_sButtonId);

		if(oButton)
		{
			oButton.Menu = new ButtonMenu(p_sMenuId, p_oMenuClickHandler);
			return oButton;
		}
		else return false;
	};
	
	function __MenuButton_FourArguments(p_sButtonId, p_oButtonClickHandler, p_sMenuId, p_oMenuClickHandler)
	{
		var oButton = new Button(p_sButtonId);

		if(oButton && typeof p_oButtonClickHandler != 'undefined')
		{
			oButton.ClickHandler = p_oButtonClickHandler;
			oButton.Menu = new ButtonMenu(p_sMenuId, p_oMenuClickHandler);
			return oButton;
		}
		else return false;
	};

	if(nArguments == 2) return __MenuButton_TwoArguments(arguments[0],arguments[1]);
	else if(nArguments == 3) return __MenuButton_ThreeArguments(arguments[0],arguments[1],arguments[2]);
	else if(nArguments == 4) return __MenuButton_FourArguments(arguments[0],arguments[1],arguments[2],arguments[3]);
	else return false;
}

/* Mail + PIM Tabs */

function Tab_MouseOver()
{
	if(!this.Selected) this.className = "hover";
	return false;
}

function Tab_MouseOut()
{
	if(!this.Selected) this.className = "";
	return false;	
}

function PIMMenu_Click(p_oEvent)
{
	var oEvent = p_oEvent ? p_oEvent : window.event;
	if(p_oEvent) oEvent.stopPropagation();
	else oEvent.cancelBubble = true;
	if(oEvent && oEvent.target && oEvent.target.parentNode && oEvent.target.parentNode.tagName == "A") window.location = oEvent.target.parentNode.href;
}

function Arrow_Click(p_oEvent)
{
	document.Selects = document.getElementsByTagName('select');

	if(document.Selects[0])
	{
		var nSelects = document.Selects.length-1;
		for(var i=nSelects;i>=0;i--) document.Selects[i].style.visibility = 'hidden';
	}
	
	var oEvent = p_oEvent ? p_oEvent : window.event;
	
	if(p_oEvent) oEvent.stopPropagation();
	else oEvent.cancelBubble = true;
	
	HideMenu();
	
	var oTab = this.parentNode.parentNode;
	var nTop = (oTab.offsetTop+oTab.parentNode.offsetHeight);
	var sTop = ((oTab.Selected) ? (nTop+2) : (nTop-1)) + "px";

	g_oMenu = document.getElementById(this.href.split('#')[1]);
	g_oMenu.style.top = sTop;
	g_oMenu.style.left = oTab.offsetLeft+"px";

	g_oMenu.onclick = PIMMenu_Click;
	g_oMenu.style.visibility = "visible";

	document.onclick = Document_Click;	

	return false;
}

function Tabs_Init()
{
	var oMailTab = document.getElementById('mailtab');
	var oAddressBookTab = document.getElementById('addressbooktab');
	var oCalendarTab = document.getElementById('calendartab');
	var oNotepadTab = document.getElementById('notepadtab');		
	
	if(oMailTab)
	{
		oMailTab.getElementsByTagName("a")[1].onclick = Arrow_Click;
		oMailTab.onmouseover = Tab_MouseOver;
		oMailTab.onmouseout = Tab_MouseOut;
		oMailTab.Selected = (oMailTab.className == 'selected' || oMailTab.className == 'first selected') ? true : false;
	}

	if(oAddressBookTab)
	{
		oAddressBookTab.getElementsByTagName("a")[1].onclick = Arrow_Click;
		oAddressBookTab.onmouseover = Tab_MouseOver;
		oAddressBookTab.onmouseout = Tab_MouseOut;
		oAddressBookTab.Selected = (oAddressBookTab.className == 'selected' || oAddressBookTab.className == 'first selected') ? true : false;
	}

	if(oCalendarTab)
	{
		oCalendarTab.getElementsByTagName("a")[1].onclick = Arrow_Click;
		oCalendarTab.onmouseover = Tab_MouseOver;
		oCalendarTab.onmouseout = Tab_MouseOut;
		oCalendarTab.Selected = (oCalendarTab.className == 'selected' || oCalendarTab.className == 'first selected') ? true : false;
	}

	if(oNotepadTab)
	{
		oNotepadTab.getElementsByTagName("a")[1].onclick = Arrow_Click;
		oNotepadTab.onmouseover = Tab_MouseOver;
		oNotepadTab.onmouseout = Tab_MouseOut;
		oNotepadTab.Selected = (oNotepadTab.className == 'selected' || oNotepadTab.className == 'first selected') ? true : false;
	}

	return false;
}

function HideMenu()
{
	if(typeof g_oMenu != 'undefined' && g_oMenu)
	{
		if(g_oMenu.Hide) g_oMenu.Hide();
		else g_oMenu.style.visibility = 'hidden';
		
		g_oMenu = null;
		document.onclick = null;
		window.onresize = null;
	}
	else return;
}

function Document_Click()
{
	if(document.Selects)
	{
		var nSelects = document.Selects.length-1;
		for(var i=nSelects;i>=0;i--) document.Selects[i].style.visibility = 'visible';
	}

	HideMenu();
}

/* M04 profile_highlight */
function prfthumb() {
    
	function initThumbnails(id, rotate, speed)
	{
		var oPhotosMainContainer  = document.getElementById(id);
		var oPhotosFullImg        = document.getElementById(id+'lg');
		var oPhotosThumbContainer = document.getElementById(id+'sm');
		if (oPhotosThumbContainer) {
			var oPhotosThumbImgs = oPhotosThumbContainer.getElementsByTagName('img');
			for (var i=0; i<oPhotosThumbImgs.length; i++)
			{
				oPhotosThumbImgs[i].onclick = rotatePhotosEvent;
				oPhotosThumbImgs[i].contId = id;
			}
			oPhotosMainContainer.oPhotosFullImg = oPhotosFullImg;
			oPhotosMainContainer.oPhotosThumbContainer =oPhotosThumbContainer;
			oPhotosMainContainer.oPhotosThumbImgs = oPhotosThumbImgs;
			if (rotate)
			{
				autoRotator(id, speed, -1);
			}
		}
	}

	function rotatePhotosEvent()
	{
		rotatePhotos(this);
	}

	function rotatePhotos(img)
	{
		var oPhotosMainContainer = document.getElementById(img.contId);
		var curFullImg = oPhotosMainContainer.oPhotosFullImg;
		var newImgSrc = new Array();
		var curThumbFull = img.src;                       
		var curFullImgThumb = curFullImg.src;                               
		curFullImg.src = curThumbFull;
		img.src = curFullImgThumb;
		return false;
	}


	function autoRotator(id, speed, index)
	{
		if (index != -1)
		{
			var oPhotosMainContainer = document.getElementById(id);
			if (index >= oPhotosMainContainer.oPhotosThumbImgs.length) index = 0;
			var curThumb = oPhotosMainContainer.oPhotosThumbImgs[index];
			rotatePhotos(curThumb);
		}
		index++;
		var spd = parseInt(speed);
		window.setTimeout("autoRotator('"+id+"','" + speed + "','" + index + "' )", spd);
	}

	initThumbnails('yprf', false, 500);

}

if(gObj("yprf")){ addEvent(window,"load",prfthumb);};


/*rte*/
function rte_init() {

var RTE_VIEW_FONT = '12px Georgia';
var RTE_HTML_FONT = 'Courier';

if (!tags) {
	var tags = new Array(
		//control regex, desired regex replacement
		[/<b>(.*?)<\/.>/gm, "<strong>$1</strong>"],
		[/<i>(.*?)<\/.>/gm, "<em>$1</em>"],
		[/<P>(.*?)<\/P>/gm, "<p>$1</p>"],
		[/<A (.*?)<\/A>/gm, "<a $1</a>"],
		[/<img (.*?)>/gm, "<img $1 />"],
		[/<span style="font-weight: normal;">(.*?)<\/span>/gm, "$1"],
		[/<span style="font-weight: bold;">(.*?)<\/span>/gm, "<strong>$1</strong>"],
		[/<span style="font-style: italic;">(.*?)<\/span>/gm, "<em>$1</em>"],
		[/<span style="(font-weight: bold; ?|font-style: italic; ?){2}">(.*?)<\/span>/gm, "<strong><em>$2</em></strong>"],
		[/<([a-z]+) style="font-weight: normal;">(.*?)<\/.>/gm, "<$1>$2</$1>"],
		[/<([a-z]+) style="font-weight: bold;">(.*?)<\/.>/gm, "<$1><strong>$2</strong></$1>"],
		[/<([a-z]+) style="font-style: italic;">(.*?)<\/.>/gm, "<$1><em>$2</em></$1>"],
		[/<([a-z]+) style="(font-weight: bold; ?|font-style: italic; ?){2}">(.*?)<\/.>/gm, "<$1><strong><em>$3</em></strong></$1>"],
		// [/<br>[\s]*/g, "<br />\n"],
		[/<\/p>[\s]*/g, "</p>\n"],
		[/alt=(.*?) /gm, "alt=\"$1\" "]
	);
}

function rteBrowserOK() {
	//set browser vars
	var ua = navigator.userAgent.toLowerCase();
	isIE = ((ua.indexOf("msie") != -1) && (ua.indexOf("opera") == -1) && (ua.indexOf("webtv") == -1));
	isGecko = (ua.indexOf("gecko") != -1);
	isSafari = (ua.indexOf("safari") != -1);
	isKonqueror = (ua.indexOf("konqueror") != -1);

	//check to see if designMode mode is available
	if (document.getElementById && document.designMode && !isSafari && !isKonqueror) {
		return true;
	} else {
		return false;
	}
}

function rteSetFont(strHTML, strFontStyle) {
	var frameHtml = "<html>";
	frameHtml += "<head>";
	frameHtml += "<style>";
	frameHtml += "body{background:#fff;font:" +strFontStyle+ ";margin:5px;padding:0;}";
	frameHtml += "</style>";
	frameHtml += "</head>";
	frameHtml += "<body>";
	frameHtml += strHTML;
	frameHtml += "</body>";
	frameHtml += "</html>";
	var oEditWin = document.getElementById("rteEdit").contentWindow;
	oEditWin.document.open();
	oEditWin.document.write(frameHtml);
	oEditWin.document.close();
}

function rteGetTextOfNonRTEView() {
	var oEditWin = document.getElementById("rteEdit").contentWindow;

	if (document.all) {
		var iText = escape(oEditWin.document.body.innerText);
		iText = iText.replace("%3CP%3E%0D%0A%3CHR%3E", "%3CHR%3E");
		iText = iText.replace("%3CHR%3E%0D%0A%3C/P%3E", "%3CHR%3E");
		iText = unescape(iText);
	} else {
		var html = oEditWin.document.body.ownerDocument.createRange();
		html.selectNodeContents(oEditWin.document.body);
	}
	return (document.all) ? iText : html.toString();
}

function rteGetTextOfRTEView() {
	var oEditWin = document.getElementById("rteEdit").contentWindow;
	var html = oEditWin.document.body.innerHTML;
	if (!document.all) {
		html = escape(html);
		while (html.indexOf("%0D%0A") > -1) { html=html.replace("%0D%0A"," ");	}
		while (html.indexOf("%0A") > -1) { html=html.replace("%0A"," "); }
		while (html.indexOf("%0D") > -1) { html=html.replace("%0D"," "); }	
		html = unescape(html);
	}
	html = html.replace(/(?=<)[^> ]*/g, function(match){return match.toLowerCase();});
	for (var i = 0; i < tags.length; i++) {	html = html.replace(tags[i][0], tags[i][1]); }
	return html;
}

function rteViewHTML() {
	var source = document.getElementById("rteHTMLSrc").checked;
	var oEditWin = document.getElementById("rteEdit").contentWindow;
	document.getElementById("rteContainer").style.display = (source) ? "none" : "block" ;
	if (source) {
		var srcText = rteGetTextOfRTEView();
		setTimeout(function(){document.getElementById('rteCnt').value = srcText; return true;}, 100);
		document.getElementById('rteEdit').style.display = 'none';
		document.getElementById('rteCnt').style.display = 'block';
	} else {
		document.getElementById('rteCnt').style.display = 'none';		
		document.getElementById('rteEdit').style.display = 'block';
		rteSetFont(document.getElementById('rteCnt').value, RTE_VIEW_FONT);		
	}
}

function rteRange() {
	//function to store range of current selection
	var oRTE;
	oRTE = document.getElementById("rteEdit").contentWindow;
	if (document.all) {
		var selection = oRTE.document.selection; 
		if (selection != null) rng = selection.createRange();
	} else {
		var selection = oRTE.getSelection();
		rng = selection.getRangeAt(selection.rangeCount - 1).cloneRange();
	}
	return rng;
}

function rteInsertHTML(html) {
//alert(html);
	// thanks to kevinroth.com
	oRTE = document.getElementById("rteEdit").contentWindow;
	oRTE.focus();
	if (document.all) {
		var oRng = oRTE.document.selection.createRange();
		oRng.pasteHTML(html);
		oRng.collapse(false);
		oRng.select();
	} else {
		oRTE.document.execCommand('insertHTML', false, html);
	}
}



function getOffsetTop(elm) {
	var mOffsetTop = elm.offsetTop;
	var mOffsetParent = elm.offsetParent;

	while(mOffsetParent){
		mOffsetTop += mOffsetParent.offsetTop; mOffsetParent = mOffsetParent.offsetParent;
	}

	return mOffsetTop;
}

function getOffsetLeft(elm) {
	var mOffsetLeft = elm.offsetLeft;
	var mOffsetParent = elm.offsetParent;

	while(mOffsetParent){
		mOffsetLeft += mOffsetParent.offsetLeft; mOffsetParent = mOffsetParent.offsetParent;
	}

	return mOffsetLeft;
}

function rteDismissPalette(event) {
	// var oSender = (event.target) ? event.target : event.srcElement;
	document.getElementById("rteClrPlt").style.visibility="hidden";
	document.getElementById("rteSmiley").style.visibility="hidden";
	document.getElementById("rteFlush").style.visibility="hidden";
	document.getElementById("rteList").style.visibility="hidden";
}

function rteBtnDown(event) { this.className = "down";}
function rteBtnOver(event) { this.className = "over";}
function rteBtnOut(event) { this.className = "btn";}

function rteBtnClick(event) {
	var oEditWin = document.getElementById("rteEdit").contentWindow;
	rteDismissPalette();
	if (document.all) { window.event.cancelBubble = true; }	else event.stopPropagation();
	rteAddEvent(oEditWin.document, "mousedown", rteDismissPalette, false);
	rteAddEvent(oEditWin.document, "keypress", rteDismissPalette, true);

	switch (this.id) {
		case "forecolor":
		case "hilitecolor":
			parent.command = this.id;
			buttonElement = document.getElementById(this.id);
			document.getElementById("rteClrPlt").style.left = getOffsetLeft(buttonElement)+"px";
			document.getElementById("rteClrPlt").style.top = getOffsetTop(buttonElement) + buttonElement.offsetHeight+"px";
			document.getElementById("rteClrPlt").style.visibility="visible";
			break;
		case "smiley":
			buttonElement = document.getElementById(this.id);
			document.getElementById("rteSmiley").style.left = getOffsetLeft(buttonElement) +"px";
			document.getElementById("rteSmiley").style.top = getOffsetTop(buttonElement) + buttonElement.offsetHeight + "px";
			document.getElementById("rteSmiley").style.visibility="visible";
			break;
		case "ddalign":
			buttonElement = document.getElementById(this.id);
			document.getElementById("rteFlush").style.left = getOffsetLeft(buttonElement)+"px";
			document.getElementById("rteFlush").style.top = getOffsetTop(buttonElement) + buttonElement.offsetHeight+"px";		
			document.getElementById("rteFlush").style.visibility="visible";

			break;
		case "ddlist":
			buttonElement = document.getElementById(this.id);
			document.getElementById("rteList").style.left = getOffsetLeft(buttonElement)+"px";
			document.getElementById("rteList").style.top = getOffsetTop(buttonElement) + buttonElement.offsetHeight+"px";
			document.getElementById("rteList").style.visibility="visible";

			break;
		case "link":
			rteRange();
			var szSel = (document.all) ? rng.htmlText : rng.toString();
			var szURL = prompt("Enter a URL:", "http://");
			if ((szURL != null) && (szURL != "")) {
				if (szSel == '') { szSel = prompt("Enter text to link:"); }
				if ((szSel != null) && (szSel != "")) {
					var html = '<a href="' + szURL + '">' + szSel + '</a>';
					rteInsertHTML(html);
				}
			}
			break;
		default:
			oEditWin.focus();
			oEditWin.document.execCommand(this.id, false, null);
			oEditWin.focus();
	}
}

// We have to execute this directly for numbered lists and justification buttons
function rteExecDDBtn(obj) {
	var targetId = (obj.target) ? obj.target.id : obj.srcElement.id;
	var oEditWin = document.getElementById("rteEdit").contentWindow;
	rteDismissPalette();
	oEditWin.focus();
	oEditWin.document.execCommand(targetId, false, null);
	oEditWin.focus();
}

function rteCreateIFrame(argStrId, argStrURL){
	var objIFRAME = document.createElement('IFRAME');
	objIFRAME.setAttribute('id', argStrId);
	objIFRAME.frameBorder = 0;
	objIFRAME.scrolling = 'no';
	objIFRAME.src = argStrURL;
	return objIFRAME;
}

function rteCreateDIV(argStrId, argStrHTML) {
	var objDIV = document.createElement('DIV');
	objDIV.setAttribute('id', argStrId);	
	objDIV.innerHTML = argStrHTML;
	return objDIV;
}

function rteInitDDs() {
       /* IFRAMES are dynamically generated to prevent writing in browser history on loadtime */
	document.body.appendChild(rteCreateIFrame('rteClrPlt', '/rte_color.html'));
	document.body.appendChild(rteCreateIFrame('rteSmiley', '/rte_smiley.html'));

	divhtml = "<table width=100% border=0 cellspacing=0 cellpadding=2>";
	divhtml += "<tr><td><a href=# style=\"text-decoration:none;color:black;\"><img id=justifyleft  src=http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_justleft_1.gif style=\"border:1px solid white;\" onmouseover=\'this.style.border=\"1px solid black\";window.status=\"\";return true;\' onmouseout=\'this.style.border=\"1px solid white\";\'></a></td><td>Flush Left</td></tr>";
	divhtml += "<tr><td><a href=# style=\"text-decoration:none;color:black;\"><img id=justifycenter  src=http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_justctr_1.gif style=\"border:1px solid white;\" onmouseover=\'this.style.border=\"1px solid  black\";return true;\' onmouseout=\'this.style.border=\"1px solid white\";\'></td><td>Centered</td></tr>";
	divhtml += "<tr><td><a href=# style=\"text-decoration:none;color:black;\"><img id=justifyright  src=http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_justright_1.gif style=\"border:1px solid white;\" onmouseover=\'this.style.border=\"1px solid black\";window.status=\"\";return true;\' onmouseout=\'this.style.border=\"1px solid white\";\'></td><td>Flush Right</td></tr>";
	divhtml += "</table>";
        document.body.appendChild(rteCreateDIV('rteFlush', divhtml));

	divhtml = "<table width=100% border=0 cellspacing=0 cellpadding=2>";
	divhtml += "<tr><td><a href=# style=\"text-decoration:none;color:black;\"><img id=insertorderedlist src=http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_listnum_1.gif style=\"border:1px solid white;\" onmouseover=\'this.style.border=\"1px solid black\";window.status=\"\";return true;\' onmouseout=\'this.style.border=\"1px solid white\";\'></a><\/td><td>Numbered List<\/td><\/tr>";
	divhtml += "<tr><td><a href=# style=\"text-decoration:none;color:black;\"><img id=insertunorderedlist  src=http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_listblt_1.gif style=\"border:1px solid white;\" onmouseover=\'this.style.border=\"1px solid  black\";return true;\' onmouseout=\'this.style.border=\"1px solid white\";\'><\/td><td>Bulleted List<\/td><\/tr>";
	divhtml += "<\/table>";
	document.body.appendChild(rteCreateDIV('rteList', divhtml));

	html = "<iframe id=\"rteEdit\"></iframe>";
//	html += "<textarea id=\"rteCnt\" name=\"contents\" style=\"display:none\"></textarea>";
	html += "<input name=\"rteHidden\" value=\"1\" type=\"hidden\" />";

	document.getElementById('rte').innerHTML = html;
	document.getElementById('caption').innerHTML = "<span><input id=\"rteHTMLSrc\" type=\"checkbox\" /><label style=\"display:inline;\" for=\"rteHTMLSrc\">觀看HTML 原始碼 (<a href=\"http://tw.help.yahoo.com/blog/other/other-11.html\" target=\"_blank\">說明</a>)</label></span>";
	rteAddEvent(document.getElementById('justifyleft'), "click", rteExecDDBtn, true);
	rteAddEvent(document.getElementById('justifycenter'), "click", rteExecDDBtn, true);
	rteAddEvent(document.getElementById('justifyright'), "click", rteExecDDBtn, true);
	rteAddEvent(document.getElementById('insertorderedlist'), "click", rteExecDDBtn, true);
	rteAddEvent(document.getElementById('insertunorderedlist'), "click", rteExecDDBtn, true);
}

function rteInitToolbar() {
	var oDiv   = document.getElementById("rteToolbar");
	var oSpans = oDiv.getElementsByTagName("SPAN");

	for (var i=0; i < oSpans.length; i++) {
		if (oSpans[i].className != 'sep') {
			oSpans[i].onmouseover = rteBtnOver;
			oSpans[i].onmouseout = rteBtnOut;
			oSpans[i].onmousedown = rteBtnDown;
			oSpans[i].onmouseup = rteBtnOut;
			oSpans[i].onclick =  rteBtnClick;
		}
	}
}

function rteAddEvent(obj, evType, fn, useCapture){
	if (obj.addEventListener){
		obj.addEventListener(evType, fn, useCapture);
		return true;
	} else if (obj.attachEvent){
		var r = obj.attachEvent("on"+evType, fn);
		return r;
	} else {
		alert("Handler could not be attached");
	}
}

function rteGenToolbar() {
	var strHTML  = "<div id=\"rteToolbar\">";
	strHTML += "<span class=\"btn\" id=\"bold\"><img title=\"粗體\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_bold_1.gif\"></span><span class=\"btn\" id=\"italic\"><img title=\"斜體\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_italic_1.gif\"></span><span class=\"sep\"></span><span class=\"btn\" id=\"link\"><img title=\"插入超連結\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_link_1.gif\"></span><span class=\"btn\" id=\"smiley\"><img title=\"插入表情圖示\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_smiley_1.gif\"></span><span class=\"btn\" id=\"forecolor\"><img title=\"文字顏色\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_coltext_1.gif\"></span><span class=\"btn\" id=\"hilitecolor\"><img title=\"文字底色\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_colhilite_1.gif\"></span><span class=\"sep\"></span><span class=\"btn\" id=\"ddalign\"><img title=\"文字對齊\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_justpd_1.gif\"></span><span class=\"btn\" id=\"ddlist\"><img title=\"項目編號\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_listpd_1.gif\"></span><span class=\"sep\"></span><span class=\"btn\" id=\"outdent\"><img title=\"減少縮排\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_ileft_1.gif\"></span><span class=\"btn\" id=\"indent\"><img title=\"增加縮排\" src=\"http://us.i1.yimg.com/us.yimg.com/i/us/pim/el/tb_iright_1.gif\"></span>";
	strHTML += "</div>";
	document.getElementById("rteContainer").innerHTML = strHTML;
}

if (rteBrowserOK()) { 
	
	document.getElementById('rteContainer').className = 'rteContainer';

	/* Attach handler to the form */
   	document.blog_compose.onsubmit = rteSubmit;
	
	strHTML = document.getElementsByTagName('TEXTAREA')[0].value;

        // We want to still add <br> tags for users not using RTEs and pressing
        // the enter key after a line of text.  But we don't want to create <br>
        // tags for people creating HTML tags.  So we check if the character 
        // before the newline is the end of an HTML tag (>) and if not, add it in.
	// strHTML = strHTML.replace(/\n/gi, '<br/>\n');
	// strHTML = strHTML.replace(/([^>])[\s]*\n/gi, '$1<br/>\n');
	// strHTML = strHTML.replace(/([^>])\n/gi, '$1<br/>\n');

	rteGenToolbar();
	rteInitDDs();
	document.getElementById('rteCnt').style.display = 'none';
	document.getElementById('rteHTMLSrc').onclick = rteViewHTML;
	document.getElementById('rteHTMLSrc').doclick = rteViewHTML;

	var oEditWin = document.getElementById("rteEdit").contentWindow;
	oEditWin.document.designMode = "on";
	rteSetFont(strHTML, RTE_VIEW_FONT);

	try {
		oEditWin.document.execCommand("undo", false, null);
		} catch (e) {
		// alert("This demo is not supported on your level of Mozilla.");
	}
	rteInitToolbar();
	rteAddEvent(document, "click", rteDismissPalette, false);
	rteAddEvent(oEditWin.document, "mousedown", rteDismissPalette, false);
	rteAddEvent(document, "keypress", rteDismissPalette, true);
	rteAddEvent(oEditWin.document, "keypress", rteDismissPalette, true);

	// if crumb expires... only seems to be working on FF
	window.onbeforeunload = function(){ 
		isHTMLview = document.getElementById('rteHTMLSrc').checked;
		if (!isHTMLview) { document.blog_compose.contents.value = rteGetTextOfRTEView(); }
	}
	//oEditWin.focus();
}

function rteSubmit(objForm) {
	isHTMLview = document.getElementById('rteHTMLSrc').checked;
	
	if (!isHTMLview) { document.blog_compose.contents.value = rteGetTextOfRTEView(); }
}

}


if(gObj("postrte")){ addEvent(window,"load",rte_init);};

function isCheckedOne(oForm,sElementName) {
	var aBox = document.getElementsByName(sElementName);
	for( var i =0,j=aBox.length;i<j;i++) {
		if(aBox[i].checked) {
			return true;
		}
	}
	return false;
};

/* 2.1.2/3.1.2/3.1.3 - comment list/folder edit/manage folder list - Delete button / Blacklist button */
function Delete_Click(oForm,sFieldName,sItemText) {
	if(typeof(sItemText)=="undefined") {
		sItemText = "相片";
	}
	if(!isCheckedOne(oForm,sFieldName)) {
		alert("請先勾選"+sItemText);
		return false;
	}
    var sMessage = "您確定要刪除嗎？";
    if(!confirm(sMessage)) return false;
	oForm.act.value='d';
    oForm.submit();
    return true;
};


function Blacklist_Click(oForm) {
	if(!isCheckedOne(oForm,'mids[]')) {
		alert("請先勾選回應");
		return false;
	}
    var sMessage = "您確定要刪除嗎？";
    oForm.act.value='b';
    oForm.submit();
    return true;
};


/* 3.1.1 / 3.2.1 */
function delSelectedItemSubmit(oForm, sMessage){
	
	if (window.confirm(sMessage)) {		
		oForm.act.value='d';
		oForm.submit();
		return true;
	}
}


function Dialog_Init()
{
var oMyObject = window.dialogArguments;
var Message = oMyObject.Message;
var ConfirmButtonValue = oMyObject.ConfirmButtonValue;
var CancelButtonValue = oMyObject.CancelButtonValue;

var html = "";

html += "<p>" + Message + "</p>";

html += "<input type=\"submit\" value=\"";
html += ConfirmButtonValue + "\" name=\"confirm\" onclick=\"window.returnValue=true;window.close()\" /> <input type=\"submit\" value=\"";
html += CancelButtonValue + "\" name=\"cancel\" onclick=\"window.close()\" />";

document.write(html);

};
if(gObj("dialog")){Dialog_Init();};



function DataTableCheckBox_Click()
{
	
	var oTR = this.parentNode.parentNode;

	if(this.checked) 
	{
		//if(this.IsNewMessage) oTR.className += ' selected';
		//else
		oTR.className = 'selected';
		g_oDataTable.CheckBoxes.NumberChecked++;
	}
	else 
	{
		//if(this.IsNewMessage) oTR.className = 'msgnew';
		//else oTR.className = 'msgold';
		oTR.className = 'noselected';
		g_oDataTable.CheckBoxes.NumberChecked--;
	}

	if(gObj("selectallrows"))	{
	g_oDataTable.SelectAllRows.checked = (g_oDataTable.CheckBoxes.NumberChecked == g_oDataTable.CheckBoxes.length) ? true : false;
	}	
};
		
function SelectAllRows_Click()
{

	var aCheckBoxes = g_oDataTable.CheckBoxes; // null
	var checkboxlist = g_oDataTable.getElementsByTagName('input');

	var bChecked = "";

	if(this.id == 'clearallTop' || this.id == 'checkallTop' || this.id == 'clearallBtm' || this.id == 'checkallBtm')
	{
		bChecked = (this.id == 'clearallTop' || this.id == 'clearallBtm') ? false : true;
		
		//v1.2 photogallery
		for (var i=0;i<checkboxlist.length;i++ ){checkboxlist[i].checked = bChecked;}
		
		if(gObj('selectallrows')) {
			gObj('selectallrows').checked = (bChecked) ? true : false;
		}

	}else{
		bChecked = g_oDataTable.SelectAllRows.checked;
		g_oDataTable.SelectAllRows.checked = bChecked;
	}


	if(gObj("selectallrows"))	{ // 管理黑名單

		var aRows = g_oDataTable.tBodies[0].rows;
		var nRows = aRows.length;
		var ochecktd = gObj('datatable').getElementsByTagName('input'); // added
		for(var i=nRows;i>0;i--) {	ochecktd[i].checked = (bChecked); }

		/*if(bChecked) 		{ 			for(var i=nRows;i>0;i--) 			{ 				aCheckBoxes[i].checked = bChecked; 				aRows[i].className = 'selected'; 			} 		} 		else 		{ 			for(var i=nRows;i>=0;i--) 			{ 				aCheckBoxes[i].checked = bChecked; 				aRows[i].className = 'noselected'; 			} 		}*/
	}else{

		for (i=0;i<aCheckBoxes.length;i++ )
			aCheckBoxes[i].checked = bChecked;

	}

	g_oDataTable.CheckBoxes.NumberChecked = (bChecked) ? g_oDataTable.CheckBoxes.length : 0;
	
};

function DataTable_Init()
{
	g_oDataTable = gObj("datatable");

	if(g_oDataTable)
	{
		if(gObj("selectallrows"))
		{
			g_oDataTable.SelectAllRows = document.getElementById("selectallrows");
			g_oDataTable.SelectAllRows.onclick = SelectAllRows_Click;		
		}

		if(gObj("checkallTop"))
			document.getElementById("checkallTop").onclick = SelectAllRows_Click;
		if(gObj("clearallTop"))
			document.getElementById("clearallTop").onclick = SelectAllRows_Click;
		if(gObj("checkallBtm"))
			document.getElementById("checkallBtm").onclick = SelectAllRows_Click;
		if(gObj("clearallBtm"))
			document.getElementById("clearallBtm").onclick = SelectAllRows_Click;

		if(gObj("acheckbox")) {

			//var aCheckBoxName = document.getElementById("acheckbox").name;
			var aCheckBoxName = gObj('acheckbox').getElementsByTagName('input')[1].name;
			var aCheckBoxes = document.getElementsByName(aCheckBoxName);

			var aRows = g_oDataTable.tBodies[0].rows;
			var nRows = aRows.length-1;

			for (var i = nRows; i >= 0; i--) {
				aCheckBoxes[i].onclick = DataTableCheckBox_Click;
			}
			g_oDataTable.CheckBoxes = aCheckBoxes;
			g_oDataTable.CheckBoxes.NumberChecked = 0;	
		}
	} 
	else return false; 
};

if(gObj("datatable")){DataTable_Init();}

function createXmlHttpRequest() {	
	var req;
	
	req = false;
	// branch for native XMLHttpRequest object
	if(window.XMLHttpRequest) {
		try {
			req = new XMLHttpRequest();
		} catch(e) {
			req = false;
		}
	// branch for IE/Windows ActiveX version
	} else if(window.ActiveXObject) {
		try {
			req = new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e) {
				req = false;
			}
		}
	}
	return req;
}



/* 3.1.2 - Manage Folder List - Edit buttons / 3.2.2 - Manange Album List - Edit buttons */
function folder_combo() {
    init_combo('mainCat', 'cat', class1, class2);
}
function folder_combo_photo() {
      init_combo('class1', 'class2', class1, class2);
}

if(gObj("folder_add")){ addEvent(window,"load",folder_combo);};
if(gObj("album_add")){ addEvent(window,"load",folder_combo);};
if(gObj("upload_browse")){ addEvent(window,"load",folder_combo);};
if(gObj("browse")){ addEvent(window,"load",folder_combo);};
if(gObj("activex")){ addEvent(window,"load",folder_combo);};
if(gObj("album")){ addEvent(window,"load",folder_combo);};// photo_upload
if(gObj("upload_activex")){ addEvent(window,"load",folder_combo);}; 
if(gObj("ypost")){ addEvent(window,"load",folder_combo);}; //post_html, post_doodle

function stringSplit ( string, delimiter ) { 
    if ( string == null || string == "" ) { 
        return null; 
    } else if ( string.split != null ) { 
        return string.split ( delimiter ); 
    } else { 
        var ar = new Array(); 
        var i = 0; 
        var start = 0; 
        while( start >= 0 && start < string.length ) { 
             var end = string.indexOf ( delimiter, start ) ; 
             if( end >= 0 ) { 
                 ar[i++] = string.substring ( start, end ); 
                 start = end+1; 
             } else { 
                 ar[i++] = string.substring ( start, string.length ); 
                 start = -1; 
             } 
        } 
        return ar; 
    } 
}

function editfolderSubmit(form,rid){
	form.rid.value=rid;
	form.act.value='e';
	form.submit();
}

function editTextbox(elementName, inputName, inputValue){
	var eleObj = document.getElementById(elementName);
	eleObj.innerHTML = "<input type=\"text\" id=\"" + inputName + "\" name=\"" + inputName + "\" value=\"" + inputValue + "\" />";
}

function cancelEditfolder(rid,foldernameValue,foldernameURL,propertyValue){
	var foldername = 'folder_' + rid
	var folderObj = document.getElementById(foldername);
	
	var foldernamehtml = "";
	foldernamehtml += "<a href=\"";
	foldernamehtml += foldernameURL + "\">";
	foldernamehtml += foldernameValue + "</a>";
	folderObj.innerHTML = foldernamehtml;

	var property = 'property_' + rid;
	var propertyObj = document.getElementById(property);
	propertyObj.innerHTML = propertyValue;

		var editbtn = 'edit_' + rid;
		var editbtnObj = document.getElementById(editbtn);

		var savebtnhtml = "";
		savebtnhtml = " <span class='editbtn'><button type='button' name='save' title='編輯' onclick='return editfolder(this,\"";
		savebtnhtml += foldernameValue + "\",\"" + foldernameURL + "\",\"" + propertyValue + "\"," + rid + ")'>編輯</button></span> ";
		editbtnObj.innerHTML = savebtnhtml;

		var cancelbtn = 'cancel_' + rid;
		var cancelbtnObj = document.getElementById(cancelbtn);

		var cancelbtnhtml = "";
		
		var fidHidden = 'fid_' + rid;
		var fidHiddenObj = document.getElementById(fidHidden);
		var fid = fidHiddenObj.value;
		
		cancelbtnhtml = " <span class='delbtn'><button type='button' name='刪除' title='刪除' onclick='delfolderSubmit(this.form, \"您確定要刪除嗎？\", " + fid + ");'>刪除</button></span>";
		cancelbtnObj.innerHTML = cancelbtnhtml;

}

function editfolder(thisObj,foldernameValue,foldernameURL,propertyValue, rid){
	if(document.getElementById){	  
	  
		var foldername = 'folder_' + rid;
		editTextbox(foldername, 'fname_' + rid, foldernameValue);
		
		var savebtnhtml = "";
		savebtnhtml = " <button type='button' name='save' title='儲存' onclick='editfolderSubmit(this.form,";
		savebtnhtml += rid + ")'>儲存</button> ";
		parentObj = thisObj.parentNode;
		parentObj.innerHTML = savebtnhtml;

		var cancelbtn = 'cancel_' + rid;
		var cancelbtnObj = document.getElementById(cancelbtn);

		var cancelbtnhtml = "";
		cancelbtnhtml = " <span class='delbtn'><button type='button' name='取消' title='cancel' onclick='cancelEditfolder(";
		cancelbtnhtml += rid + ",\"" + foldernameValue + "\",\"" + foldernameURL + "\",\"" + propertyValue + "\")'>取消</button></span>";
		cancelbtnObj.innerHTML = cancelbtnhtml;

		var property = 'property_' + rid;
		var propertyObj = document.getElementById(property);

		var html = "";

		var mainCatName = "mainCat_" + rid;
		html="<select id=\"" + mainCatName + "\" name=\"" + mainCatName  + "\" onchange=\"refresh_list(this.selectedIndex, 'cat_" + rid + "', class2)\">";
		html+="</select>";

		var subCatName = "cat_" + rid;
		html+=" <select id=\"" + subCatName + "\" name=\"" + subCatName + "\">";
		html+="</select>";

		propertyObj.innerHTML = html;
		init_combo(mainCatName, subCatName, class1, class2);
	}
	return true;
}


function delfolderSubmit(oForm, sMessage, fid){
	
	if (window.confirm(sMessage)) {
		oForm.dfid.value = fid;
		oForm.act.value='d';
		oForm.submit();
		return true;
	}
}

/* 5.2.3 - photo big */
function editcaptionSubmit(form){
	form.act.value='e';
	form.submit();
}

function cancelEditcaption(captionnameValue){

	var captionObj = document.getElementById('edit_title');
	
	captionObj.innerHTML = captionnameValue;

	var editbtn = 'edit';
	var editbtnObj = document.getElementById(editbtn);
	
	var privacyObj = document.getElementById('edit_privacy');
	privacyObj.innerHTML = "";
	
	var commentObj = document.getElementById('edit_post_comment');
	commentObj.innerHTML = "";
	
	var savebtnhtml = "";
	savebtnhtml = " <span class='editbtn'><button type='button' name='save' title='編輯' onclick='return editcaption(this,\"";
	savebtnhtml += captionnameValue + "\")'>編輯</button></span> ";
	editbtnObj.innerHTML = savebtnhtml;
	editbtn = 'edit_b';
	editbtnObj = document.getElementById(editbtn);
	editbtnObj.innerHTML = savebtnhtml;

	var cancelbtn = 'cancel';
	var cancelbtnObj = document.getElementById(cancelbtn);

	var cancelbtnhtml = "";
			
	cancelbtnhtml = " <span class='delbtn'><button type='button' name='刪除' title='刪除' onclick='delfolderSubmit(this.form, \"您確定要刪除嗎？\");'>刪除</button></span>";
	cancelbtnObj.innerHTML = cancelbtnhtml;
	cancelbtn = 'cancel_b';
	cancelbtnObj = document.getElementById(cancelbtn);
	cancelbtnObj.innerHTML = cancelbtnhtml;
}

function editcaption(thisObj,captionnameValue, privacyValue, commentEnableValue){

	editTextbox('edit_title', 'title', captionnameValue);

	var publicChecked = "checked";
	var privateChecked = "";
	if (privacyValue == "PR") {
		publicChecked = "";
		privateChecked = "checked";
	}
	
	var cmtEnableChecked = "checked";
	var cmtDisableChecked = "";
	if (commentEnableValue == "D") {
		cmtEnableChecked = "";
		cmtDisableChecked = "checked";
	}
	
	var privacyObj = document.getElementById('edit_privacy');
	var privacyHtml = "隱藏設定：";
	privacyHtml += "<input type=\"radio\" name=\"photo_public\" id=\"photo_public\" value=\"PU\" " + publicChecked + " /><label for=\"photo_public\">公開</label>";
	privacyHtml += "<input type=\"radio\" name=\"photo_public\" id=\"photo_hidden\" value=\"PR\" " + privateChecked + " /><label for=\"photo_hidden\">隱藏</label>";
	privacyObj.innerHTML = privacyHtml;
	
	var commentObj = document.getElementById('edit_post_comment');
	var commentHtml = "回應設定：";
	commentHtml += "<input type=\"radio\" name=\"photo_reply\" id=\"reply_yes\" value=1 " + cmtEnableChecked + " /><label for=\"reply_yes\">可回應</label>";
	commentHtml += "<input type=\"radio\" name=\"photo_reply\" id=\"reply_no\" value=0 " + cmtDisableChecked + " /><label for=\"reply_no\">不可回應</label>";
	commentObj.innerHTML = commentHtml;
	
	var savebtnhtml = "";
	savebtnhtml = " <span class='editbtn'><button type='button' name='save' title='儲存' onclick='editcaptionSubmit(this.form)'>儲存</button></span> ";
	//parentObj = thisObj.parentNode;
	//parentObj.innerHTML = savebtnhtml;
	var edtbtn = document.getElementById("edit");
	edtbtn.innerHTML = savebtnhtml;
	var edtbtn_b = document.getElementById("edit_b");
	edtbtn_b.innerHTML = savebtnhtml;

	var cancelbtn = 'cancel';
	var cancelbtnObj = document.getElementById(cancelbtn);

	var cancelbtnhtml = "";
	cancelbtnhtml = "<span class='delbtn'><button type='button' name='取消' title='cancel' onclick='cancelEditcaption(\"" + captionnameValue + "\")'>取消</button></span>";
	cancelbtnObj.innerHTML = cancelbtnhtml;

	cancelbtn = 'cancel_b';
	cancelbtnObj = document.getElementById(cancelbtn);
	cancelbtnObj.innerHTML = cancelbtnhtml;
		
	var editObj = document.getElementById('title');
	editObj.focus();

	return true;
}


function delcaptionSubmit(oForm, sMessage){
	
	if (window.confirm(sMessage)) {
		oForm.act.value='d';
		oForm.submit();
		return true;
	}
}

/* 8.1.1 - manage subscribe list */
function cancelEditSubsfolder(rid,foldernameValue,foldernameURL){
	var foldername = 'folder_' + rid;
	var folderObj = document.getElementById(foldername);
	
	var foldernamehtml = "";
	foldernamehtml += "<a href=\"";
	foldernamehtml += foldernameURL + "\">";
	foldernamehtml += foldernameValue + "</a>";
	folderObj.innerHTML = foldernamehtml;

	var editbtn = 'edit_' + rid;
	var editbtnObj = document.getElementById(editbtn);

	var savebtnhtml = "";
	savebtnhtml = " <span class='editbtn'><button type='button' name='save' title='編輯' onclick='return editSubsfolder(this,\"";
	savebtnhtml += foldernameValue + "\",\"" + foldernameURL + "\"," + rid + ")'>編輯</button></span> ";
	editbtnObj.innerHTML = savebtnhtml;

	var cancelbtn = 'cancel_' + rid;
	var cancelbtnObj = document.getElementById(cancelbtn);

	var fidHidden = 'fid_' + rid;
	var fidHiddenObj = document.getElementById(fidHidden);
	var fid = fidHiddenObj.value;
	
	var cancelbtnhtml = "";
	cancelbtnhtml = "<span class='delbtn'><button type='button' name='刪除' title='刪除所選部落格' onclick='delfolderSubmit(this.form, \"您確定要刪除嗎？\", " + fid + ");'>刪除</button></span>";
		
	cancelbtnObj.innerHTML = cancelbtnhtml;

}

function editSubsfolder(thisObj,foldernameValue,foldernameURL, rid){
	if(document.getElementById){	  
	  
		var foldername = 'folder_' + rid;
		editTextbox(foldername, 'fname_' + rid, foldernameValue);
		
		var savebtnhtml = "";
		savebtnhtml = " <button type='button' name='save' title='儲存' onclick='editfolderSubmit(this.form,";
		savebtnhtml += rid + ")'>儲存</button>";
		parentObj = thisObj.parentNode;
		parentObj.innerHTML = savebtnhtml;

		var cancelbtn = 'cancel_' + rid;
		var cancelbtnObj = document.getElementById(cancelbtn);

		var cancelbtnhtml = "";
		cancelbtnhtml = " <span class='delbtn'><button type='button' name='取消' title='cancel' onclick='cancelEditSubsfolder(";
		cancelbtnhtml += rid + ",\"" + foldernameValue + "\",\"" + foldernameURL + "\")'>取消</button></span>";
		cancelbtnObj.innerHTML = cancelbtnhtml;
	}
	return true;
}

/* 8.1.0 - manage subscribe checklist */
function cancelEditSubsblog(rid, remarkValue){
	var remarkname = 'remark_' + rid;
	var remarkObj = document.getElementById(remarkname);
	remarkObj.innerHTML = remarkValue;

	var editbtn = 'edit_' + rid;
	var editbtnObj = document.getElementById(editbtn);

	var savebtnhtml = "";
	savebtnhtml = " <span class='editbtn'><button type='button' name='save' title='編輯' onclick='return editSubsblog(this,\"";
	savebtnhtml += remarkValue + "\"," + rid + ")'>編輯</button></span> ";
	editbtnObj.innerHTML = savebtnhtml;
	
	var cancelbtn = 'cancel_' + rid;
	var cancelbtnObj = document.getElementById(cancelbtn);
	
	cancelbtnObj.innerHTML = "";
}

function editSubsblog(thisObj,remarkValue,rid){
	if(document.getElementById){	  
		var remarkname = 'remark_' + rid;
		editTextbox(remarkname, 'remark_' + rid, remarkValue);
		
		var savebtnhtml = "";
		savebtnhtml = " <button type='button' name='save' title='儲存' onclick='editSubsblogSubmit(this.form,";
		savebtnhtml += rid + ")'>儲存</button> ";
		parentObj = thisObj.parentNode;
		parentObj.innerHTML = savebtnhtml;

		var cancelbtn = 'cancel_' + rid;
		var cancelbtnObj = document.getElementById(cancelbtn);

		var cancelbtnhtml = "";
		cancelbtnhtml = " <span class='delbtn'><button type='button' name='取消' title='cancel' onclick='cancelEditSubsblog(";
		cancelbtnhtml += rid + ",\"" + remarkValue + "\")'>取消</button></span>";
		cancelbtnObj.innerHTML = cancelbtnhtml;
	}
	return true;
};

function editSubsblogSubmit(oForm, rid){	
	oForm.rid.value = rid;	
	oForm.act.value='e';	
	oForm.submit();
	return true;
};

function delSubsblogSubmit(oForm, sMessage) {	
	if (window.confirm(sMessage)) {
		oForm.act.value='d';
		oForm.submit();
		return true;
	}
};



function Empty_Folder(oForm, sMessage, fid) {

	if (window.confirm(sMessage)) { 
	
		oForm.sf.value = fid;
		oForm.act.value='c';
		oForm.submit();
		return true;
	}
	
	return false;
}


function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}



/* 8.1.1 - subscribe checklist */
var oFolderTop = new MenuButton('foldertop','foldermenu',FolderMenu_Click);
var oFolderBottom = new MenuButton('folderbtm','foldermenu',FolderMenu_Click);

function FolderMenu_Click()
{
	var oLI = this.Sender.tagName == "LI" ? this.Sender : this.Sender.parentNode;
    var oForm = this.Button.form;
    oForm.nfid.value = oLI.value;
    oForm.act.value = 'm';
    oForm.submit();
};

/* 1.2.1 - post_html */

var oMarkTop = new MenuButton('insertphoto','insertmenu',InsertMenu_Click);

function doSubmitCallback() {
    document.blog_compose.submit();
}

function InsertMenu_Click()
{
	var aMarkOptions = new Array('http://tw.uploader.blogs.yahoo.com/tw.blog.yahoo.com/post/photo_upload_pc.php','http://tw.uploader.blogs.yahoo.com/tw.blog.yahoo.com/post/photo_upload_gallery.php');
	var oLI = this.Sender.tagName == "LI" ? this.Sender : this.Sender.parentNode;
	var url = aMarkOptions[oLI.value];
	//document.location.href= url;
	var f = document.blog_compose;
	var source = document.getElementById("rteHTMLSrc").checked = true;
	document.getElementById('rteHTMLSrc').doclick();
	f.action=url;
	setTimeout('doSubmitCallback()', 100);
}

function jumpToFolder(thisObj) {
	var oForm = thisObj.form;
	var selectObj = oForm.cfid;
	
    oForm.act.value='';
	oForm.fid.value = selectObj.options[selectObj.selectedIndex].value;
	oForm.page.value = 1;
	oForm.method = 'GET';
	oForm.submit();
}



/* 4.2.1 - Order Module */
function orderModule(menu, type){
	if (menu=="vMenub")
	{
		var ele = document.customize_layout.elements[menu];
	    var update = document.customize_layout.updateb;
	} else	{
		var ele = document.customize_layout.elements[menu];
	    var update = document.customize_layout.update;
	}

    update.value = 1;

	sl=ele.selectedIndex;
	if(sl==-1){
		alert("請先點選您要移動的項目");
		return;
	}
    else{
		var oText=ele.options[sl].text;
		var oValue=ele.options[sl].value;
        var oStyle=ele.options[sl].style.color;
        var oStyleBC=ele.options[sl].style.background;

		if(sl>0 && type=='up') {
  			ele.options[sl].text=ele.options[sl-1].text;
 	 		ele.options[sl].value=ele.options[sl-1].value;
 	 		ele.options[sl].style.color = ele.options[sl-1].style.color;
 	 		ele.options[sl].style.background= ele.options[sl-1].style.background;
  			ele.options[sl-1].text=oText;
  			ele.options[sl-1].value=oValue;
  			ele.options[sl-1].style.color =oStyle;
  			ele.options[sl-1].style.background=oStyleBC;
  			ele.selectedIndex--;
		}else if(sl<ele.length-1 && type=='down') {
			ele.options[sl].text=ele.options[sl+1].text;
			ele.options[sl].value=ele.options[sl+1].value;
 	 		ele.options[sl].style.color = ele.options[sl+1].style.color;
 	 		ele.options[sl].style.background= ele.options[sl+1].style.background;
			ele.options[sl+1].text=oText;
			ele.options[sl+1].value=oValue;
  			ele.options[sl+1].style.color =oStyle;
  			ele.options[sl+1].style.background=oStyleBC;
			ele.selectedIndex++;
		}
 		return;
    }
}

function hideModule(hmenu,vmenu,show_str) {
	var hbox = document.customize_layout.elements[hmenu];
	var vbox = document.customize_layout.elements[vmenu];

	if (vmenu=="vMenub")
		document.customize_layout.updateb.value = 1;
	else
		document.customize_layout.update.value = 1;

	var sidx = vbox.selectedIndex;

	if(sidx==-1){
		alert("請先選擇要移動的項目");
		return;
	}

	var show = show_str.split("|", -1 );
	for(i=0; i < show.length ; i++){
	  if (vbox.options[sidx].value == show[i]) {
		  if (vmenu=='vMenu' || vmenu=='vMenub') {
			alert("此區塊不可移除");
		 } else if (vmenu=='vMenul') {
			var obox = document.customize_layout.vMenur;
			obox.options[obox.length] = new Option(vbox.options[sidx].text, vbox.options[sidx].value);			
			vbox.options[sidx] = null;
		  } else if (vmenu=='vMenur') {
			var obox = document.customize_layout.vMenul;
			obox.options[obox.length] = new Option(vbox.options[sidx].text, vbox.options[sidx].value);
			vbox.options[sidx] = null;
		}
		return;
	  }
	}
	hbox.options[hbox.length] = new Option(vbox.options[sidx].text, vbox.options[sidx].value);
	vbox.options[sidx] = null;
}

function viewModule(hmenu,vmenu) {
	
	var hbox = document.customize_layout.elements[hmenu];
	var vbox = document.customize_layout.elements[vmenu];

	if (vmenu=="vMenub")
		document.customize_layout.updateb.value = 1;
	else
		document.customize_layout.update.value = 1;

	sidx = hbox.selectedIndex;
	if(sidx==-1){
		alert("請先選擇要移動的項目");
		return;
	}

	vbox.options[vbox.length] = new Option(hbox.options[sidx].text, hbox.options[sidx].value);
	hbox.options[sidx] = null;
}

function submitModuleOrder() {
	//左右欄的值分隔使用 |LRSEP| 來分隔
    var vbox2 = document.customize_layout.elements['vMenub'];
    var vbox1 = document.customize_layout.elements['vMenu'];

	var update2 = document.customize_layout.updateb;
	var menu2 = document.customize_layout.vmenub;
	var update1 = document.customize_layout.update;
	var menu1 = document.customize_layout.vmenu;
	var menu_l ="";
	var menu_r ="";
	var menu1L = document.customize_layout.vMenul;
	var menu1R = document.customize_layout.vMenur;
	var layout = document.customize_layout.layout;
	
	//Reset default value prevent Firefox caching.
	menu1.value = "";
	menu2.value = "";
	menu_l.value = "";
	menu_r.value = "";


    if ( update1.value != "") {
		if(layout[2].checked) {
		//3 cloumns layout
			for( i = 0; i < menu1L.length; i++ ) {
			menu_l += menu1L.options[i].value;
			if ( i < menu1L.length -1 ) 
				menu_l += "|";
			}
			for( i = 0; i < menu1R.length; i++ ) {
			menu_r += menu1R.options[i].value;
			if ( i < menu1R.length -1 ) 
				menu_r += "|";
			}
			menu1.value=menu_l+"|LRSEP|"+menu_r;
		} else {
		//2 cloumns layout
			for( i = 0; i < vbox1.length; i++ ) {
				menu1.value += vbox1.options[i].value;
				if ( i < vbox1.length -1 ) 
					menu1.value += "|";
			}
		}
    }

    if ( update2.value != "") {
		for( i = 0; i < vbox2.length; i++ ) {
			menu2.value += vbox2.options[i].value;
			if ( i < vbox2.length -1 ) 
				menu2.value += "|";
		}
    }
    document.customize_layout.submit();
    return false;
}

function render_col_setup()
{	
	var oRadio = gTags(gObj("col_setup"),"input");
	for (var i=0;i<oRadio.length ;i++){ 
		oRadio[i].onclick = switchDiv ; 
		if(oRadio[i].checked) {
			if (oRadio[i].id == 'thrcol')
			{ 
				gObj('coltwo').style.display = 'none';
				gObj('colthr').style.display = 'block';
			} else {
				gObj('coltwo').style.display = 'block';
				gObj('colthr').style.display = 'none';
			}
		}
	}
	

	function switchDiv(e){
		if (this.id == 'thrcol')
		{ 
			gObj('coltwo').style.display = 'none';
			gObj('colthr').style.display = 'block';
		} else {
			gObj('coltwo').style.display = 'block';
			gObj('colthr').style.display = 'none';
		}
	};

 var vbox = document.customize_layout.elements['vMenu']

 showcoltwo = function()
 {
	 /*for( i = 0; i < vbox.length; i++ ) {
		if ( vbox.options[i].value == "LRSEP" )
			var sidx=i;
	}
	vbox.options[sidx] = null;*/
 }

  showcoltwo = function()
 {	
	for( i = 0; i < vbox.length; i++ ) {
		if ( vbox.options[i].value == "LRSEP" )
			return;
	}

	vbox.options[vbox.length] = new Option("==== 左欄在上/右欄在下 ====", "LRSEP");
	vbox.options[vbox.length-1].className="border";
	}

}


if(gObj("col_setup")){render_col_setup()};





/* 5.2.3 - edit photo title */
function cancelEditPhoto(titleValue){
	var titleName = 'photo_title';
	var titleObj = document.getElementById(titleName);
	titleObj.innerHTML = '<H2>' + titleValue + '</H2>';
	
};
/*
function editPhoto(titleValue){
	if(document.getElementById){	  		
		var titleName = 'photo_title';
		var titleObj = document.getElementById(titleName);
		//editTextbox(titleName, 'title', titleValue);
		
		var myHtml = "<input id=\"title\" type=\"text\" name=\"title\" value=\"" + titleValue + "\" />";
		myHtml += "<button type='button' name='saveTitle' title='儲存' onclick='editPhotoSubmit(this.form);'>儲存</button>";
		myHtml += "<button type='button' name='刪除' title='cancelTitle' onclick='cancelEditPhoto(\"" + titleValue + "\")'>刪除</button>";
		titleObj.innerHTML = myHtml;
				
		titleInputBox = document.getElementById('title');
		titleInputBox.focus();
	}
	return true;
};
*/
function editPhoto(pid,crumb) {
    var url = "http://tw.blog.yahoo.com/photo/edit.php?pid="+pid+"&.crumb="+crumb;
    location.href= url;
};

function editPhotoSubmit(oForm){
	oForm.act.value='e';	
	oForm.submit();
	return true;
};

function delPhotoSubmit(oForm) {	
	if (window.confirm('您確定要刪除嗎？')) {
		oForm.act.value='d';
		oForm.submit();
		return true;
	}
};
function photo_check(folder, number){
	 document.setup_photo.set.value = number;
	
	if (folder == -1) {
		if (number == 1) 
			document.setup_photo.prf_type1[0].checked = true;
		else if (number == 2) 
			document.setup_photo.prf_type2[0].checked = true;
		else if (number == 3) 
			document.setup_photo.prf_type3[0].checked = true;
		else if (number == 4) 
			document.setup_photo.prf_type4[0].checked = true;
 	}
	else
		openwin('/photo/photo_choose.php?folder='+folder,'prf_photo','800','500','front');
}

function diy_check(folder, number) {

	if (folder == "bg_img_pc") { document.customize_diy.check_bg_img.checked = true; document.customize_diy.bg_img[0].checked = true;}
	if (folder == "bg_img_album") 
	{
		document.customize_diy.check_bg_img.checked = true;
		document.customize_diy.bg_img[1].checked = true;
		document.customize_diy.set.value = 1;
		openwin('/photo/photo_choose.php?folder='+folder,'blog_theme','800','500','front');
	}

	if (folder == "title_img_pc") { document.customize_diy.check_title_img.checked = true; document.customize_diy.title_img[0].checked = true;}
	if (folder == "title_img_album") 
	{
		document.customize_diy.check_title_img.checked = true;
		document.customize_diy.title_img[1].checked = true;
		document.customize_diy.set.value = 2;
		openwin('/photo/photo_choose.php?folder='+folder,'blog_theme','800','500','front');
	}

}

function insertPhoto(value){

	if(gObj("photo_setup")){
		var set = document.setup_photo.set.value;

		if(set == 1){
			document.setup_photo.gallery_file1.value = value;
			document.setup_photo.prf_type1[1].checked = true;
		}else if(set == 2){
			 document.setup_photo.gallery_file2.value = value;
				document.setup_photo.prf_type2[1].checked = true;
		}else if(set == 3){
			document.setup_photo.gallery_file3.value = value;
			document.setup_photo.prf_type3[1].checked = true;
		}else if(set == 4){
			document.setup_photo.gallery_file4.value = value;
			document.setup_photo.prf_type4[1].checked = true;
		}				
	};

	if(gObj("diy_setup")){
		
		var set = document.customize_diy.set.value;

		if (document.customize_diy.set.value == 1)
			document.customize_diy.bg_img_gallery.value = value;
		if (document.customize_diy.set.value == 2)
			document.customize_diy.title_img_gallery.value = value;
	};
	
	var gallery = 'gallery_' + set;
	var galleryhtml = "<p>" + value + "</p>";
	var galleryObj = document.getElementById(gallery);
	galleryObj.innerHTML = galleryhtml;

}

function updateOpener()
{
	if (document.gallery_popup.pic.length) {
		for(var i=0;i<document.gallery_popup.pic.length;i++){
			if(document.gallery_popup.pic[i].checked)
				var selected = document.gallery_popup.pic[i].value;	
		}
	} else {
		var selected = document.gallery_popup.pic.value;
	}
	window.opener.insertPhoto(selected);
}

function diy_check_photo(folder, number) {
	if (folder == '') {
		return;
	}
	
	if (number == 1) {
		document.customize_diy.check_bg_img.checked = true;
		if (!document.customize_diy.bg_img_repeat[0].checked && !document.customize_diy.bg_img_repeat[1].checked && !document.customize_diy.bg_img_repeat[2].checked ) {
		    document.customize_diy.bg_img_norepeat.checked = true;
		}
		if (folder == -1) {
			document.customize_diy.bg_img[0].checked = true;
			return;
		} else {
			document.customize_diy.bg_img[1].checked = true;
		}
	} else if (number == 2) {
		document.customize_diy.check_title_img.checked = true;
		if (!document.customize_diy.title_img_repeat[0].checked && !document.customize_diy.title_img_repeat[1].checked && !document.customize_diy.title_img_repeat[2].checked) {
		    document.customize_diy.title_img_norepeat.checked = true;
		}
		if (folder == -1) {
			document.customize_diy.title_img[0].checked = true;
			return;
		} else {
			document.customize_diy.title_img[1].checked = true;
		}
	}
	document.customize_diy.set.value = number;
	openwin('/photo/photo_choose.php?folder='+folder,'prf_photo','800','500','front');
}

function Post_Click(oForm) {
	if(!isCheckedOne(oForm,"mids[]")) {
		alert("請先勾選相片");
		return false;
	}
    oForm.act.value='post';
    oForm.submit();
    return true;
};

function Edit_Click(oForm) {
	if(!isCheckedOne(oForm,"mids[]")) {
		alert("請先勾選相片");
		return false;
	}
    var sYuid = oForm.yuid.value;
	var sUrl = '/'+sYuid+'/photobatchedit'
	oForm.act.value='edit';
	oForm.action = sUrl;
	oForm.submit();
    return true;
};

function t(i) {
	/*var e = document.getElementById(i);*/
	var e = gObj(i);
	var t = e.className;
	
	
	if (t.match('invisible')) { t = t.replace(/invisible/gi, 'visible'); }
	else { t = t.replace(/visible/gi, 'invisible'); }
	e.className = t;
}


function rs(n, u, w, h, x) {
    document.domain = "yahoo.com";
    args="width="+w+",height="+h+",resizable=yes,scrollbars=yes,status=0";
    remote=window.open(u,n,args);
    if ( remote != null ) {
	if ( remote.opener == null )
	    remote.opener = self;
    }
    if (x == 1)
    return remote;
}

/*calendar*/
function loadCalendarXMLDoc(url) {
	var req = createXmlHttpRequest();
	
	if(req) {
		req.onreadystatechange = function() {
			if (req.readyState==4) {
				//alert(req.responseText);
				// Parsing the response to obtain Next Photo ID and Url
				var myDom = req.responseXML.documentElement;
				var markup = myDom.getElementsByTagName('markup')[0].firstChild.data;
				setCalendar(markup);				
			}
		}
		req.open("GET", url, true);		
		req.send("");
	}
}

function setCalendar(markup) {
	var calObj = document.getElementById('ymodcal');
	calObj.innerHTML = markup;
}

function calendarChangeDate(year, month) {
	var baseUrlObj = document.getElementById('baseCalUrl');	
	var url = baseUrlObj.value + 'yy=' + year + '&mm=' + month;
	loadCalendarXMLDoc(url);	
}

function calendarPreviousYear() {
	var yearObj = document.getElementById('cy');
	var year = yearObj.value;
	var monthObj = document.getElementById('cm');
	var month = monthObj.value;
	year--;
	calendarChangeDate(year, month);
}

function calendarNextYear() {
	var yearObj = document.getElementById('cy');
	var year = yearObj.value;
	var monthObj = document.getElementById('cm');
	var month = monthObj.value;
	year++;
	calendarChangeDate(year, month);
}

function calendarPreviousMonth() {
	var yearObj = document.getElementById('cy');
	var year = yearObj.value;
	var monthObj = document.getElementById('cm');
	var month = monthObj.value;
	month--;
	if (month < 1) {
		year--;
		month = 12;
	}
	calendarChangeDate(year, month);
}

function calendarNextMonth() {
	var yearObj = document.getElementById('cy');
	var year = yearObj.value;
	var monthObj = document.getElementById('cm');
	var month = monthObj.value;
	month++;
	if (month > 12) {
		year++;
		month = 1;
	}
	calendarChangeDate(year, month);
}


function deletearticle(blogname,mid,crumb,page,fid) {
        if(!window.confirm('您確定要刪除此篇文章嗎?'))
                exit;
		var url2 = window.location;
		var re = /[\?|&]l=\w/;
		var reS = re.exec(url2);
		if(reS > "") {
			reS = reS.toString();
			reS = reS.replace('?','&');
		} else {
			reS = "";
		}
		var url = "/"+blogname+"/article?mid="+mid+"&_crumb="+crumb+"&page="+page+"&delthis=1"+reS;
		if(fid > "") {
			url=url+"&fid="+fid;
		} 
        location.href= url;
}


function deletecmt(blogname,mid,cmtid,crumb,page) {
	if(!window.confirm('您確定要刪除此篇回應?'))
                exit;
        var url = "/"+blogname+"/article?mid="+mid+"&cmtid="+cmtid+"&_crumb="+crumb+"&page="+page+"&delcmt=1";
        location.href= url;
}

function deletephotocmt(blogname,pid,cid,crumb,page) {
        if(!window.confirm('您確定要刪除此篇留言?'))
                exit;
        var url = "/"+blogname+"/photo?pid="+pid+"&cid="+cid+"&_crumb="+crumb+"&page="+page+"&act=dc";
        location.href= url;
}

function deletetbs(blogname,mid,tbid,crumb,page) {
	if(!window.confirm('您確定要刪除此篇引用?'))
                exit;
        var url = "/"+blogname+"/article?mid="+mid+"&tbid="+tbid+"&_crumb="+crumb+"&t_page="+page+"&deltbs=1";
        location.href= url;
}


function deleteproph(prf_photo) {
	if(!window.confirm('你確定要刪除此張相片嗎?'))
                exit;
	var url = "/setup/profile_photo.php?act=del&prf_photo="+prf_photo;
        location.href= url;
} 

function deletegb(blogname, gid, crumb,page) {
        if(!window.confirm('您確定要刪除此篇留言?'))
                exit;
        var url = "/"+blogname+"/guestbook?act=d&gid="+gid+"&_crumb="+crumb+"&page="+page;
        location.href= url;
}
 

function loadCommentXMLDoc(url) {
	var req = createXmlHttpRequest();
	
	if(req) {
		req.onreadystatechange = function() {
			if (req.readyState==4) {
				//alert(req.responseText);				
				var myDom = req.responseXML.documentElement;
				var markup = myDom.getElementsByTagName('markup')[0].firstChild.data;
				setComment(markup);				
			}
		}
		req.open("GET", url, true);		
		req.send("");
	}
}

function commentChangePage(page) {
	var baseUrlObj = document.getElementById('baseCmtUrl');	
	var url = baseUrlObj.value + page;
	loadCommentXMLDoc(url);	
}

/*pop up subscription form*/
if(gObj('btnsbsrb')){
	
	function doSwitch(el) { 
		//Check if more than 21 categories
		var fid = document.getElementById('fid');
		if(fid.options.length>12) {
			alert('抱歉！您已達到訂閱分類數量上限，無法再建立新分類！');
			return false;
		}
		var el = document.getElementById(el);
		el.className = (el.className=='visible') ? 'invisible' : 'visible' ;
	}
	
	//Hide the Div that include the iFrame
	function hideMe() {
		var oPops = parent.document.getElementById('ypopsub');
		oPops.style.visibility='hidden';
		oPops.removeChild(oPops.lastChild);
	}
	
	
	var vaildateForm = function(dForm) {
		if(dForm.newfid.value > "") {
		//Check if new folder name is duplicated
			for(var i=0,j=dForm.fid.options.length;i<j;i++) {
				if(dForm.newfid.value == dForm.fid.options[i].text) {
					alert("新增的訂閱分類名稱重複。");
					return false;
				}
			}
		} else if(dForm.newf.checked) {
		//Check if new folder name is empty
			alert("請輸入正確的訂閱分類名稱。");
			return false;
		}
		return true;
	}

	function setRadio(el) { gObj(el).checked = 'true'; gObj('ynewsub').className="invisible"; }
};



/*manage message board*/
function mngmsg_init(){

	function fselall(e){ for (var i=0;i<oAll.length ;i++ ) oAll[i].checked = true;	}
	function fdelall(e){ for (var i=0;i<oAll.length ;i++ ) oAll[i].checked = false; }

	var oSel = gObj('selallmsg');
	var oDel = gObj('clearallmsg');
	var oAll = gObj('ymngmsg').getElementsByTagName('input');

	addEvent(oSel,'click',fselall);
	addEvent(oDel,'click',fdelall);
};

if(gObj('ymngmsg')){mngmsg_init();};


/*post rte*/

function fpost_init(){	
	function setRadio(e) {
		gObj('oldf').checked = 'true'; 
		if (gObj('ypost')) gObj('ypost').className = 'invisible'; 
		if (gObj('album')) gObj('album').className = 'invisible';
		}	
	var oSel =  gObj('folder_id');
	addEvent(oSel, 'click', setRadio);
};

if(gObj('ypost') || gObj('album')){fpost_init();};
init_combo("mainCat_1", "cat_1", class1, class2);

/* add kplus badge */
function addBadgeClick(dButton){
	var dForm = dButton.form;
	var dVisibles = (document.getElementById('coltwo').style.display != 'none')?[dForm.elements['vMenu']]:[dForm.elements['vMenul'],dForm.elements['vMenur']];
	for(var x=0,y=dVisibles.length;x<y;x++){
		for(var i=0,j=dVisibles[x].options.length;i<j;i++){
			if(dVisibles[x].options[i].text == '知識+ 名片'){
				alert('知識+ 名片已經在顯示項目中！');
				return;
			};
		};
	};
	if(confirm('您確認要在部落格顯示您的知識+ 名片嗎？')){
		var dHidden = (document.getElementById('coltwo').style.display != 'none')?dForm.elements['hMenu']:dForm.elements['hMenuc'];
		for(var i=0,j=dHidden.options.length;i<j;i++){
			if(dHidden.options[i].text == '知識+ 名片'){
				dVisibles[0].options[dVisibles[0].length] = new Option(dHidden.options[i].text, dHidden.options[i].value);
				dHidden.options[i] = null;
				break;
			};
		};
		document.customize_layout.update.value = 1;
		dForm.elements['save'].click();
	};
};