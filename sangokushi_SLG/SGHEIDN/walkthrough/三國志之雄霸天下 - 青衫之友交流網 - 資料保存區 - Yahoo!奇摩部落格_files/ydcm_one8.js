/*Yahoo Nameming Space*/
if(typeof YAHOO=="undefined"){var YAHOO={};}YAHOO.namespace=function(){var A=arguments,E=null,C,B,D;for(C=0;C<A.length;C=C+1){D=A[C].split(".");E=YAHOO;for(B=(D[0]=="YAHOO")?1:0;B<D.length;B=B+1){E[D[B]]=E[D[B]]||{};E=E[D[B]];}}return E;};
YAHOO.namespace("util");

/*yahoo*/
/*dom*/
(function(){
    if(YAHOO.util.Dom){
        return;
    }
    YAHOO.namespace("util.Dom");
    var reClassNameCache = {}
        ,_id_counter =0
        ,OWNER_DOCUMENT='ownerDocument';
    var getClassRegEx = function(className) {
        var re = reClassNameCache[className];
        if (!re) {
            re = new RegExp('(?:^|\\s+)' + className + '(?:\\s+|$)');
            reClassNameCache[className] = re;
        }
        return re;
    };
    YAHOO.util.Dom = {
        getElementsByClassName: function(className, tag, root, apply) {
            tag = tag || '*';
            root = root || document; 
            var nodes = [],
                elements = root.getElementsByTagName(tag),
                re = getClassRegEx(className);
            for (var i = 0, len = elements.length; i < len; ++i) {
                if ( re.test(elements[i].className) ) {
                    nodes[nodes.length] = elements[i];
                    if (apply) {
                        apply.call(elements[i], elements[i]);
                    }
                }
            }
            return nodes;
        }
        ,generateId: function(el, prefix) {
            prefix = prefix || 'yui-gen';
            var f = function(el) {
                if (el && el.id) { // do not override existing ID
                    return el.id;
                }
                var id = prefix + _id_counter++;
                if (el) {
                    if (el[OWNER_DOCUMENT].getElementById(id)) { // in case one already exists
                        return Y.Dom.generateId(el, id + prefix);
                    }
                    el.id = id;
                }
                return id;
            };
            return f.apply(YAHOO.util.Dom, arguments);
        }
    };
}());

/*library*/
/*createl.js*/
YAHOO.createEl = {
    get : function(sTag, oAttr, sHtml, sAppendType) {
          var el = document.createElement(sTag);
          for (var i in oAttr) { // necessary for each all item
              el[i] = oAttr[i];
          }
          if (sHtml) {
              el.innerHTML = sHtml;
          }
          if(sAppendType){
              this.append(el,sAppendType);
          }
          if(!el.id){
              YAHOO.namespace("util.Dom");
              if(YAHOO.util.Dom.generateId){
                  YAHOO.util.Dom.generateId(el);
              }
          }
          return el;
      }
      ,getHead : function(){
          var p =  document.getElementsByTagName("head")[0] || document.getElementsByTagName("html")[0];
          if('head'===p.nodeName.toLowerCase()){
            return p;
          }
          var dNode = this.get('head');
          p.insertBefore(dNode,p.firstChild);
          return dNode;
      }
      ,append : function(dNode,sType){
          switch(sType){
              default :
              case 'head':
                  this.getHead().appendChild(dNode);
                  break;
              case 'headStart':
                  var p = this.getHead();
                  if(p.firstChild){
                      p.insertBefore(dNode,p.firstChild);
                  }else{
                      p.appendChild(dNode);
                  }
                  break;
              case 'bodyAbsolute':
                  dNode.style.position = 'absolute';
                  dNode.style.display = 'none';
              case 'bodyStart':
                  if(document.body.firstChild){
                      document.body.insertBefore(dNode,document.body.firstChild);
                      break;
                  }
              case 'bodyEnd':
                  document.body.appendChild(dNode);
                  break;
          }
      }
      ,insertAfter : function(dNode,dBefore){
          dBefore.parentNode.insertBefore(dNode,dBefore.nextSibling);
      }
      ,remove : function(dNode){
          if(dNode){
              try{
                  dNode.parentNode.removeChild(dNode);
                  dNode = null;
                  delete dNode;
              }catch(e){
              }
          }
      }
      ,js : function(sUrl,sCharset){
          var dNode = this.get("script",{src:sUrl,type:'text/javascript'},null,'head');
          if(sCharset){
              dNode.setAttribute('charset',sCharset);
          }
          return dNode;
      }
      ,css : function(sUrl,sMedia){
          if(!sMedia){sMedia = 'all';}
          return this.get('link',{"href":sUrl,"rel":"stylesheet","type":"text/css","media":sMedia},null,'head');
      }
};

/*JsConnect.js*/
(function(){
YAHOO.namespace('util');
YAHOO.util.JsConnect = {
    seqNo : 0,
    scriptNodeMap : {},
    asyncRequest : function(url, oCallback, sCallbackName, isNotAppendUrl) {
        var sResponseID;
        if(!isNotAppendUrl){
            sResponseID = "response" + this.seqNo;
            this.seqNo++;
            sCallbackName = sCallbackName || "callback";
            if(this.isLive(sResponseID)){
                this.remove(sResponseID);
            }
            // The URL must support a "callback" parameter
            if (url.indexOf('?') === -1) {
                url += "?" + sCallbackName + "=YAHOO.util.JsConnect." + sResponseID;
            } else {
                url += "&" + sCallbackName + "=YAHOO.util.JsConnect." + sResponseID;
            }
        }else{
            sResponseID = "response0";
        }

        // Create response object
        var responseObj = { tId : sResponseID };
        if (oCallback.argument) {
            responseObj.argument = oCallback.argument;
        }

        // Bind the response function
        var timeoutId = null;
        this[sResponseID] = function(str) {
            this.remove(sResponseID);
            if (timeoutId) {
                clearTimeout(timeoutId);
            }
            responseObj.status = 200;
            responseObj.responseText = str;
            if(oCallback.success){
                if (oCallback.scope) {
                    oCallback.success.call(oCallback.scope, responseObj);
                } else {
                    oCallback.success(responseObj);
                }
            }
        };

        // Setup timeout function
        if (oCallback.timeout) {
            var that = this;
            var timeoutFunc = function() {
                that.abort(sResponseID, oCallback);
            };
            // Set the timeout
            timeoutId = setTimeout(timeoutFunc, oCallback.timeout);
        }

        this.scriptNodeMap[sResponseID] = YAHOO.createEl.js(url);
        return sResponseID;
    },

    isLive : function(sID) {
        return ('undefined'!=typeof(this.scriptNodeMap[sID]));
    },

    remove : function(sID){
        if(this[sID]){
            YAHOO.createEl.remove(this.scriptNodeMap[sID]);
            delete this[sID];
            delete this.scriptNodeMap[sID];
        }
    },

    removeAll : function(){
        for(var i in this.scriptNodeMap){ // necessary for each all item
            this.remove(i);
        }
    },

    abort : function(sID, oCallback) {
        if (this[sID]) {
            this.remove(sID);
            if (oCallback) {
                var responseObj = { tId:sID,status:-1,statusText:"transaction aborted" };
                if (oCallback.argument) {
                    responseObj.argument = oCallback.argument;
                }
                if(oCallback.failure){
                    if (oCallback.scope) {
                        oCallback.failure.call(calback.scope, responseObj);
                    } else {
                        oCallback.failure(responseObj);
                    }
                }
            }
            return true;
        }
        return false;
    }
};
})();


(function(){
/*conf*/
var YDcm = YAHOO.namespace('DCM')
    ,YUD = YAHOO.util.Dom
    ,YUrlEncode = encodeURIComponent || escape
    ,YUrlDecode = decodeURIComponent || unescape;


(function(){
if(YDcm.conf){ return; }

YDcm.conf = {
    dom:null
    ,hotspot:null 
    ,ov:null
    ,ovStart:0
    ,dcm:null
};

YDcm.manage = {
    queue : []
    ,run : null
    ,register : function(o){
        this.queue.push(o);
        this.execute();
    }
    ,execute : function(){
        if( (this.run && this.run.stop) || !this.run ){
            if(!this.queue.length){
                this.run = null;
                return false;
            }
            this.run = this.queue.shift();
        }else{
            return;
        }
        var myrun = this.run;
        setTimeout(function(){
            myrun.modules.overture();
            if(myrun.user.hotspot){
                myrun.modules.hotspot();
            }
        },5);
    }
};

/*util*/
YDcm.util = {
    getUrlArgument: function(name, url) {
        name = name.replace(/[\[]/,'\\\[').replace(/[\]]/,'\\\]');
        var regEx = new RegExp('[\\?&]' + name + '=([^&#]*)');
        return (!regEx.exec(url)) ? '' : regEx.exec(url)[1];
    }
    ,log:function( sUrl, aPool ){
	return false;
        if (document.images) {
            var sLogReferUrl=('in'==MyConf.yahoo_iframe)?'ctxtUrl='+ YUrlEncode(MyConf.sCtxtUrl) : '';
            (new Image()).src = sUrl+[
                ,''//for always insert &
                ,'label='+ YUrlEncode(aPool.sLabel)
				,'ctxtKeywords='+ aPool.sKeyword
                ,MyConf.sCtxtCat
                ,'source='+ YUrlEncode(aPool.sPartner)
                ,'intl='+MyConf.param_mkt
                ,'eo='+ YUrlEncode(MyConf.param_charset)
                ,sLogReferUrl
            ].join('&');
        }
    }
    ,debug:function(s){
        if(window.console && window.console.firebug){
            console.log(s);
        }
    }
    ,JsConnect : YAHOO.util.JsConnect
};
}());


var MyConf = {
    dom : null
    ,pool : null
    ,user: {}
    ,stop:false
    ,sRand : Math.ceil(Math.random()*(new Date().getTime()))
    ,dcmServer:'http://tw.dcm.search.yahoo.com/' //dcmw1.search.corp.tpc.yahoo.com //tw.dcm.search.yahoo.com
    ,sponsorText:'\u520a\u767b\u8d0a\u52a9\u7db2\u7ad9'
};

MyConf.servers = {
    css:'http://l.yimg.com/f/i/tw/ysm/dcm/'
    ,iframe:MyConf.dcmServer+'rw.php'
    ,dcmKw:MyConf.dcmServer+'?'
    ,clickLog:MyConf.dcmServer+'click'
    ,viewLog:MyConf.dcmServer+'view'
    ,sponsor:'http://tw.rd.yahoo.com/referurl/search/evt=30238/*http://tw.emarketing.yahoo.com/ysm/contactus/index.html?o=TW0145&cmp=TW0145'
};

if('undefined'!=typeof(ydcm_test_enable)){
    //MyConf.servers.dcmKw = 'http://dcmw1.search.corp.tpc.yahoo.com/?referer_debug=on&referer_url='+YUrlEncode('http://tw.knowledge.yahoo.com/question/question?qid=1508120807138')+'&';
    MyConf.servers.dcmKw = 'getkw.php?'
}

/*style*/
MyConf.style = {
    cssWidth : '',
    cssHeight : '',
    cssBorder:'',
    cssTitle:'',
    cssText:'',
    cssBackground:'',
    cssLinkColor:'',
    width:'auto',
    height:null,
    genCss : function(){
        return {
            '.ysm':'zoom:1;word-break:break-all;border:1px solid #97abbc;font-size:13px;position:relative;line-height:1.4;margin:5px;'
            ,'.ysm:after':"content:'.';display:block;visibility:hidden;height:0;clear:both;"
            ,'.ysm .ysmlabel':'position:absolute;top:2px;right:5px;'
            ,'.ysm .ysmlabel a':'text-decoration:none;font-size:12px;'
            ,'.ysm dl':'zoom:1;text-align:left;margin:0;padding:0 0 6px;*padding:0 0 9px;'
            ,'.ysm dl.last':'padding-bottom:0;'
            ,'.ysm dl address':'margin-left:5px;font:normal 12px/1 Arial;'
            ,'.ysm dt address':'display:inline;'
            ,'.ysm dd':'font-size:12px;margin:0;'
            ,'.ysm dd address':'display:none;'
            ,'.ysm ul':'padding:0;margin:0;list-style-image:none;list-style-position:outside;list-style-type:none;'
            ,'.ysm .dcm-hd,.ysm .dcm-ft':'display:none'
            ,'.ysm .dcm-bd':'overflow:hidden;_overflow:visible;padding:1px 5px;'
            ,'.ysm .dcm-bd *':'cursor:pointer;'
            ,'.ysm-vertical':'*padding-top:5px;'
            ,'.ysm-vertical .ysmlabel':'position:static;display:block;margin:0 auto;text-align:center;'
            ,'.ysm-vertical dt address':'display:none;'
            ,'.ysm-vertical dd address':'display:inline;'
            ,'.hotspot-l .dcm-hd':'display:block;float:left;width:15%;padding-left:5px;border-right:1px solid #97abbc;'
            ,'.hotspot-l .dcm-bd':'float:left;padding-left:5px;margin-left:-1px;width:82%;border-left:1px solid #97abbc;'
            ,'.hotspot-t .dcm-hd':'display:block;padding:2px 0;border-bottom:1px solid #97abbc;'
            ,'.hotspot-b .dcm-ft':'display:block;margin-top:5px;padding:2px 0;border-top:1px solid #97abbc;'
            ,'.hotspot-t .dcm-hd li, .hotspot-b .dcm-ft li':'display:inline;padding:0 5px;'
        };
    },
    genCustomCss: function(){
        return {
            '.ysm':this.cssWidth+this.cssHeight+this.cssBackground
            ,'.ysm .ysmlabel a':this.cssText
            ,'.ysm dl address':this.cssLinkColor
            ,'.ysm dt a':this.cssTitle
            ,'.ysm dd':this.cssText
            ,'.ysm, .hotspot-l .dcm-hd, .hotspot-l .dcm-bd, .hotspot-t .dcm-hd, .hotspot-b .dcm-ft':this.cssBorder
        };
    },
    css : null,
    setCss:function(sPosition){
        var aStyle = this.css
            ,i
            ,ai
            ,j
            ,dCss = YAHOO.createEl.get("style",{type:"text/css",media:"screen"},null,sPosition);
        if ( document.uniqueID ) {
            var dStyle;
            for(var i in document.styleSheets){
                if(document.styleSheets[i].id==dCss.id){
                    dStyle = document.styleSheets[i];
                    break;
                }
            }
            for (i in aStyle){
                if(aStyle[i]){
                    if(-1!=i.indexOf(',')){
                        ai = i.split(',');
                        for(j=ai.length-1;j>=0;j--){
                            dStyle.addRule(ai[j], aStyle[i]);
                        }
                    }else{
                        dStyle.addRule(i, aStyle[i]);
                    }
                }
            }
        } else {
            var s = '';
            for (i in aStyle){s += i + ' {' + aStyle[i] + '}\n';} // necessary for each all item
            dCss.appendChild(document.createTextNode(s));
        }
        return dCss;
    },
    init:function(){
        if(MyConf.user.width&&parseInt(MyConf.user.width,10)>0){
            this.width = MyConf.user.width;
            this.cssWidth = 'width:'+this.width+'px;';
        }
        if(MyConf.user.height){
            this.height = MyConf.user.height;
            this.cssHeight = '_height:'+this.height+'px;min-height:'+this.height+'px;';
            if('in'==MyConf.yahoo_iframe){
                this.height -=4;
                this.cssHeight = '_height:'+this.height+'px;max-height:'+this.height+'px;';
            }
        }
        if(MyConf.user.border){
            this.cssBorder = 'border-color:'+MyConf.user.border+';';
        }
        if(MyConf.user.title){
            this.cssTitle = 'color:'+MyConf.user.title+';';
        }
        if(MyConf.user.text){
            this.cssText = 'color:'+MyConf.user.text+';';
        }
        if(MyConf.user.background){
            this.cssBackground = 'background-color:'+MyConf.user.background+';';
        }
        if(MyConf.user.linkColor){
            this.cssLinkColor = 'color:'+MyConf.user.linkColor+';';
        }

        this.css = this.genCss();

        if('in'==MyConf.yahoo_iframe){
            this.css['body']='margin:0;padding:0;';
            this.css['.iframe']='margin:0;';
            this.css['div.ysm'] = 'overflow:hidden;';
        }
        if(MyConf.user.strong){
            this.css['.ysm strong'] = 'color:'+MyConf.user.strong+';';
        }
        if(MyConf.user.width){
            this.css['dl.first']='margin-top:8px;';
        }
        if(MyConf.user.hotspot){
            MyConf.dom.className = [MyConf.dom.className, 'hotspot hotspot-'+MyConf.user.hotspot].join(' ');
        }

        if (MyConf.user.className){
            MyConf.dom.className = [MyConf.dom.className, MyConf.user.className].join(' ');
        }
        if(!MyConf.user.target){
            MyConf.user.target = '_top';
       }

    }
};

/*module*/
MyConf.modules = {
    initAffilData: function(){
        var REMOTE_ADDR=''
            ,HTTP_X_FORWARDED_FOR=false
            ,HTTP_USER_AGENT='';
        if('undefined'!=typeof(param_REMOTE_ADDR)){
            REMOTE_ADDR=param_REMOTE_ADDR;
        }
        if('undefined'!=typeof(param_HTTP_X_FORWARDED_FOR)){
            HTTP_X_FORWARDED_FOR=param_HTTP_X_FORWARDED_FOR;
        }
        if('undefined'!=typeof(param_HTTP_USER_AGENT)){
            HTTP_USER_AGENT=param_HTTP_USER_AGENT;
        }
        var aValue = 'ip='+REMOTE_ADDR;
        if(HTTP_X_FORWARDED_FOR){
            aValue+='&xfip='+HTTP_X_FORWARDED_FOR;
        }
        aValue+="&ua="+HTTP_USER_AGENT;
        return aValue;
    }
    ,initServeUrl: function(){
        var loc=window.location;
        return loc.protocol + '//' + loc.host + loc.pathname;
    }
    ,initPmArgument: function(aPool){
        var sKw='';
        //keyword
        if('undefined'!=typeof(param_keyword)){
            sKw = YUrlEncode(param_keyword);
        }else{
            var r = document.referrer;
            sKw = YDcm.util.getUrlArgument('p',r);
            if(!sKw.length){
                sKw = YDcm.util.getUrlArgument('q',r);
            }
        }
        if(!sKw.length){
            return false;
        }else{
            MyConf.param_keyword = sKw;
        }
        aPool.sKeyword = MyConf.param_keyword;
        return  [
             'Partner='+YUrlEncode(aPool.sPartner)
            ,'Keywords='+MyConf.param_keyword
            ,'serveUrl='+YUrlEncode(MyConf.modules.initServeUrl())
            ,'affilData='+YUrlEncode(MyConf.modules.initAffilData())
        ].join('&');
    }
    ,initBcmArgument: function(aPool){
        var sKw='';
        if('undefined'!=typeof(param_bcm_keyword)){
            sKw = param_bcm_keyword;
        }
        if(!sKw.length){
            return false;
        }
        aPool.sKeyword = YUrlEncode(sKw);
        return  [
            'Partner='+YUrlEncode(aPool.sPartner)
            ,'Keywords='+YUrlEncode(sKw)
            ,'serveUrl='+YUrlEncode(MyConf.modules.initServeUrl())
            ,'affilData='+YUrlEncode(MyConf.modules.initAffilData())
        ].join('&');
    }
    ,initCmArgument: function(aPool){
        var sCtxtCat = ('dcm'==aPool.sLabel) ? MyConf.sCtxtCat : '&ctxtId='+YUrlEncode(MyConf.param_ctxtID);
        return [
            'source='+YUrlEncode(aPool.sPartner)
            ,sCtxtCat
             ,'&ctxtUrl='+YUrlEncode(MyConf.sCtxtUrl).substr(0,500)
			 ].join('');
    }
    ,initDcmArgument: function(aPool){
        MyConf.sDcmUrlArg = [
            ,'intl='+MyConf.param_mkt
        ].join('&');
        return MyConf.modules.initCmArgument(aPool);
    }
    ,initHotSpot: function(){
        if( !MyConf.user.hotspotClickUrl
            || !(/^.*\.yahoo.com\//.test(MyConf.user.hotspotClickUrl))
        ){
            MyConf.user.hotspotClickUrl = 'http://tw.linkspot.search.yahoo.com/sales/ysmlist.php';
        }
        if( !MyConf.user.hotspotRequestUrl
            || !(/^.*\.yahoo.com\//.test(MyConf.user.hotspotRequestUrl))
        ){
            MyConf.user.hotspotRequestUrl = 'http://tw.linkspot.search.yahoo.com/';
        }
    }
    ,createDom: function(sType,att,sHtml){
        var d;
        switch(sType){
            default:
            case 'write':
                document.write('<div id='+att.id+'></div>');
                setTimeout(function(){
                    d = document.getElementById(att.id);
                    d.style.display = 'none';
                    if(att.className){d.className=att.className;}
                    if(sHtml){
                        d.innerHTML=sHtml;
                    }
                    YDcm.conf.dom = MyConf.dom = d;
                    YDcm.manage.register(MyConf);
                },100);
                break;
            case 'dom':
                d = YAHOO.createEl.get('div',att,sHtml);
                d.style.display = 'none';
                YDcm.conf.dom = MyConf.dom = d;
                YDcm.manage.register(MyConf);
                break;
        }
    }
    ,initDom: function(){
        this.createDom(MyConf.yahoo_write,{
                'className':'ysm dcm'
                ,id:'ydcm-'+MyConf.sRand
            }
            ,[
                '<span class="ysmlabel" id="hc-ysmlabel"></span>'
                ,'<div class="dcm-hd" id="hc-dcm-hd">'
                  ,'<div class="title">'
                    ,'\u71b1\u9580\u95dc\u9375\u5b57'
                  ,'</div>'
                ,'</div>'
                ,'<div class="dcm-bd" id="hc-dcm-bd">'
                ,'</div>'
                ,'<div class="dcm-ft" id="hc-dcm-ft">'
                  ,'<div class="title">'
                    ,'\u71b1\u9580\u95dc\u9375\u5b57'
                  ,'</div>'
                ,'</div>'
        ].join(''));
    }
    ,echoIframe: function(){
        var dIframe = YAHOO.createEl.get('iframe',{frameborder:'no',frameBorder:'no',marginWidth:0,marginHeight:0,border:0,scrolling:'no'});
        var aParam = [
            'param_ctxtID'
            ,'param_type'
            ,'param_maxCount'
            ,'param_mkt'
        ];
        var i
            ,sQuery='';
        for(i=0,j=aParam.length;i<j;i++){
            if('undefined'!=typeof(window[aParam[i]])){
                sQuery += '&js['+aParam[i]+']='+ YUrlEncode(window[aParam[i]]);
            }
        }
        for(i in yahoo_ad_style){ //necessary for each all item
            sQuery += '&js[yahoo_ad_style]['+i+']='+ YUrlEncode(yahoo_ad_style[i]);
        }
        if('undefined'!=typeof(yahoo_ad_pool)){
            for(i=0,j=yahoo_ad_pool.length;i<j;i++){
                if(yahoo_ad_pool[i].hasOwnProperty('sArgument')){
                    yahoo_ad_pool[i].sArgument = '';
                }
                sQuery +=[
                    'js[yahoo_ad_pool]['+i+'][sUrl]='+YUrlEncode(yahoo_ad_pool[i].sUrl)
                    ,'js[yahoo_ad_pool]['+i+'][sArgument]='+YUrlEncode(yahoo_ad_pool[i].sArgument)
                    ,'js[yahoo_ad_pool]['+i+'][bDcm]='+YUrlEncode(yahoo_ad_pool[i].bDcm)
                ].join('&');
            }
        }
        dIframe.src = MyConf.servers.iframe+'?'+ MyConf.sDcmUrlArg+ sQuery;
        MyConf.style.init();
        dIframe.style.width = '100%';
        dIframe.style.height = MyConf.style.height+'px';
        MyConf.dom.style.width = MyConf.style.width; //'px' will execute in other line
        MyConf.dom.style.height = MyConf.style.height+'px';
        MyConf.dom.appendChild(dIframe);
        MyConf.modules.finish(); 
    }
    ,echo: function(){
        if('undefined'==typeof(yahoo_write)){
            MyConf.yahoo_write = 'write';
        }else{
            MyConf.yahoo_write = yahoo_write;
        }

        if('undefined'==typeof(yahoo_iframe) || !yahoo_iframe){
            MyConf.yahoo_iframe = false;
        }else{
            MyConf.yahoo_iframe = yahoo_iframe;
        }
        MyConf.sCtxtUrl = ('in'==MyConf.yahoo_iframe) ? document.referrer : document.URL;
        switch(MyConf.yahoo_iframe){
            case true:
                this.createDom(MyConf.yahoo_write,{id:'ydcm-'+MyConf.sRand});
                setTimeout(function(){
                    MyConf.modules.echoIframe();
                },1);
                return false;
            case 'in':
            default:
                return true;
        }
    
   }
   ,overture: function(){
        var iMaxCount;
        if('undefined'!=typeof(param_maxCount) && !isNaN(param_maxCount) && param_maxCount ){
            iMaxCount=param_maxCount;
        }else{
            iMaxCount=3;
        }
        var pool
            ,oQueryYsm
            ,dYsmJs
            ,iOvertureCount
            ,sUrl
            ,sType;
        var requestOverture = function(){
            if(MyConf.user.showCount 
                && YDcm.conf.ov
                && MyConf.user.showCount+YDcm.conf.ovStart<=YDcm.conf.ov.length
              ){
                genHtml();
                return;
            }
            YDcm.conf.ovStart=0;
            if(pool.sArgument){
                pool.sArgument='&'+pool.sArgument;
            }
            if(pool.sType){
                sType='&type='+YUrlEncode(pool.sType);
            }else{
                sType='';
            }

            sUrl = [
                pool.sUrl
                ,'?'
                ,[
                    'mkt='+YUrlEncode(MyConf.param_mkt)
                    ,'maxCount='+YUrlEncode(iMaxCount)
                    ,'outputCharEnc='+YUrlEncode(MyConf.param_charset)
                    ,'cb='+MyConf.sRand
                ].join('&')
                ,pool.sArgument
                ,sType
            ].join('');

            dYsmJs = YAHOO.createEl.js(sUrl);
            zSr = undefined;
            oQueryYsm = setInterval(function() {
                if('undefined'!=typeof(zSr)){
                    clearInterval(oQueryYsm);
                    aOverture = arrange(zSr);
                    if(aOverture.length){
                        YDcm.conf.ov = aOverture;
                        genHtml();
                        YDcm.util.debug(pool.sLabel);
                        YDcm.util.log( MyConf.servers.viewLog+'?', pool );
                    }else{
                        parsePool();
                    }
                    YAHOO.createEl.remove(dYsmJs);
                }
            },50);
        };
        var arrange = function(a){
            var aNew = [];
            for(var i=6,j=a.length;i<j;i+=6){
                var aCol = {'desc':a[i],'tmp':a[i+1],'link':a[i+2],'title':a[i+3],'url':a[i+4]};
                aNew.push(aCol);
            }
            return aNew;
        };
        var genHtml = function(){
            var a = YDcm.conf.ov;
            var dAd = MyConf.dom;
            var dBody = YUD.getElementsByClassName('dcm-bd','div',dAd)[0];
            var sHtml='',
                aAtt;

            if(!MyConf.user.query){
                if(MyConf.param_keyword){
                    MyConf.user.query = YUrlDecode(MyConf.param_keyword);
                }else{
                    MyConf.user.query = '';
                }
            }
            if(MyConf.user.query){ 
                var saveReg = function(s) {
                    s=s.replace(/\\/g, '\\\\');
                    s=s.replace(/\//g, '\\\/');
                    s=s.replace(/\[/g, '\\\[');
                    s=s.replace(/\]/g, '\\\]');
                    s=s.replace(/\(/g, '\\\(');
                    s=s.replace(/\)/g, '\\\)');
                    s=s.replace(/\{/g, '\\\{');
                    s=s.replace(/\}/g, '\\\}');
                    s=s.replace(/\</g, '\\\<');
                    s=s.replace(/\>/g, '\\\>');
                    s=s.replace(/\|/g, '\\\|');
                    s=s.replace(/\*/g, '\\\*');
                    s=s.replace(/\?/g, '\\\?');
                    s=s.replace(/\+/g, '\\\+');
                    s=s.replace(/\^/g, '\\\^');
                    s=s.replace(/\$/g, '\\\$');
                    return s;
                };
                var oReg = new RegExp(saveReg(MyConf.user.query),'ig');
                var replace = function(s){
                    s = s.replace(oReg,function(sReturn){return '<strong>'+sReturn+'</strong>';});
                    return s;
                };
            }else{
                var replace = function(s){
                    return s;
                };
            }
            var j=MyConf.user.showCount+YDcm.conf.ovStart;
            if(j>a.length || isNaN(MyConf.user.showCount)){
               j = a.length; 
            }
            for(var i=YDcm.conf.ovStart;i<j;i++){
                sHtml = [
                    '<dt>'
                        ,'<a target="'+MyConf.user.target+'" href="'+a[i].link+'">'
                        ,replace(a[i].title)
                        ,'</a>'
                        ,'<address>'+a[i].url+'</address>'
                    ,'</dt>'
                    ,'<dd>'
                        ,replace(a[i].desc)
                        ,'<address>'+a[i].url+'</address>'
                    ,'</dd>'
                ].join('');
                if(0===i){
                    aAtt = {'className':'first'};
                }else if(j-1==i){
                    aAtt = {'className':'last'};
                }else{
                    aAtt = null;
                }
                var dDl = YAHOO.createEl.get('dl',aAtt,sHtml);
                dBody.appendChild(dDl);
                dDl.onmousedown = function(){
                    var dLink = this.getElementsByTagName('a')[0];
                    var dAddress = this.getElementsByTagName('address')[0];
                    var sClickLogUrl = MyConf.servers.clickLog+'?'+[
                        'displayUrl='+ YUrlEncode(dAddress.innerHTML)
                        ,'displayTitle='+ YUrlEncode(dLink.innerHTML)
                    ].join('&');
                    YDcm.util.log( sClickLogUrl, pool );
                };
                dDl.onclick = function(){
                    var dLink = this.getElementsByTagName('a')[0];
                    if ('_blank'==dLink.target) {
                        if(document.uniqueID){
                            dLink.click();
                        }else{
                            window.open(dLink.href);
                        }
                    }else{
                        top.location.href = dLink.href;
                    }
                    if(!document.uniqueID){
                        return false;
                    }
                };
            }
            if(j){
                YDcm.conf.ovStart = j;
                /*all finish*/
                MyConf.style.init();
                MyConf.modules.finish();
            }
            MyConf.modules.stop();
        };
         var parsePool = function(){
            pool = MyConf.pool.shift();
            if('undefined'==typeof(pool)){
                if(MyConf.pool.length){
                    parsePool();
                }else{
                    MyConf.modules.stop();
                }
                return;
            }
            requestOverture();
        };
        parsePool();
    }
    ,hotspot:function(){
        var dAd = MyConf.dom
            ,dHead = YUD.getElementsByClassName('dcm-hd','div',dAd)[0]
            ,dFoot = YUD.getElementsByClassName('dcm-ft','div',dAd)[0];
        var randomArray= function(aArray) {
            var randomOrder = function(a,b){
                return (Math.round(Math.random())-0.5);
            };
            return aArray.sort(randomOrder);
        };
        var genHtml= function(a){
            var sHtml,dLi;
            var dUl = YAHOO.createEl.get('ul'),
                iNum = MyConf.user.hotspotNum;
            if(iNum>a.length){
                iNum=a.length;
            }
            randomArray(a);
            var sUrl = [
                MyConf.user.hotspotClickUrl,'?'
                ,'Partner=', MyConf.user.hotspotPartner
                ].join('');
            for(var i=0;i<iNum;i++){
                sHtml = '<a target="_blank" href="'+sUrl+YUrlEncode(a[i].title)+'">'+a[i].title+'</a>';
                dLi = YAHOO.createEl.get('li',null,sHtml);
                dUl.appendChild(dLi);
            }
            dHead.appendChild(dUl);
            dFoot.appendChild(dUl.cloneNode(true));
        };
        var request= function(){
            if(!MyConf.param_ctxtID || !MyConf.param_charset){
                return;
            }
            var charset = {
                'utf8':'utf-8'
            };
            var sCharset = ('undefined'!==typeof(charset[MyConf.param_charset]))? charset[MyConf.param_charset] : MyConf.param_charset;
            ovtw = undefined;
            var sUrl = MyConf.user.hotspotRequestUrl+ MyConf.param_ctxtID+ '/'+ sCharset+ '/?rnd='+ MyConf.sRand;
            var dLinkspotJs = YAHOO.createEl.js(sUrl);
            var oQueryLinkspot = setInterval(function() {
                if('undefined'!=typeof(ovtw)){
                    clearInterval(oQueryLinkspot);
                    YDcm.conf.hotspot = ovtw[0].ads;
                    genHtml(ovtw[0].ads);
                    YAHOO.createEl.remove(dLinkspotJs);
                }
            },50);
        }();
    }
    ,sponsorHtml: function(){
        return [
            '<a target="_blank" href="', MyConf.servers.sponsor, '">'
                ,MyConf.sponsorText
            ,'</a>'
        ].join('');
    }
    ,finish:function(){
        var dAd = MyConf.dom
            ,dBody =  YUD.getElementsByClassName('dcm-bd','div',dAd)[0]
            ,dHead = dAd.getElementsByTagName('span')[0]; 
        if(MyConf.user.header){
            dHead.innerHTML = MyConf.user.header;
        }else if(true===MyConf.user.hiddenYLabel){
            dHead.innerHTML = '';
        }else{
            var aSponsorText = {
                adsbyyahoo : 'Ads by Yahoo!'
            };
            if(aSponsorText[MyConf.user.sponsorText]){
                MyConf.sponsorText = aSponsorText[MyConf.user.sponsorText];
            }
            if(MyConf.user.sponsorUrl && /^.*\.yahoo.com\//.test(MyConf.user.sponsorUrl)){
               
                MyConf.servers.sponsor = MyConf.user.sponsorUrl;
            }
            dHead.innerHTML = MyConf.modules.sponsorHtml();
        }
        if(MyConf.user.footer){
            dBody.appendChild(YAHOO.createEl.get('div',null,MyConf.user.footer));
        }
        
        MyConf.style.setCss('headStart');
        if(MyConf.user.css){
            YAHOO.createEl.css(MyConf.servers.css+"dcm_"+MyConf.user.css+".css","screen");
        }
        MyConf.style.css = MyConf.style.genCustomCss();
        MyConf.style.setCss('head');
        dAd.style.display='block';
        if(document.uniqueID){
            setTimeout(function(){ 
                dHead.style.zoom = 1 
            },1);
        }
        
        /*set callback*/
        if(typeof(yahoo_dcm_done_callback)=='function'){
            yahoo_dcm_done_callback();
        }
    }
    ,stop:function(){
        MyConf.stop = true;
        YDcm.manage.execute();
    }
};


/*run*/
(function(){
    if('undefined'==typeof(param_mkt) || !param_mkt){
        MyConf.param_mkt = 'tw';
    }else{
        MyConf.param_mkt = param_mkt;
    }
    if('undefined'!=typeof(param_charset) && param_charset){
        MyConf.param_charset = param_charset;    
    }else{
        MyConf.param_charset = 'utf8';
    }
    if('undefined'!=typeof(param_ctxtID) && param_ctxtID){
        MyConf.param_ctxtID = param_ctxtID;
        MyConf.sCtxtCat = '&ctxtCat='+YUrlEncode(MyConf.param_ctxtID);
    }
    if(!MyConf.modules.echo()){
        return false;
    }
   /*init pool*/ 
    if('undefined'==typeof(yahoo_ad_pool) || !yahoo_ad_pool){
        return false;
    }else{
        var aArgu
            ,pool=yahoo_ad_pool.concat([]);
        for(var i=0,j=pool.length;i<j;i++){
            aArgu = '';
            if( !(/^.*\.yahoo.overture.com\//.test(pool[i].sUrl)) ){
                delete pool[i];
                continue;
            }
            switch(pool[i].sLabel){
                case 'pm':
                    aArgu = MyConf.modules.initPmArgument(pool[i]);
                    break;
                case 'bcm':
                    aArgu = MyConf.modules.initBcmArgument(pool[i]);
                    break;
                case 'dcm':
                    aArgu =  MyConf.modules.initDcmArgument(pool[i]);
                    break;
                case 'cm':
                    aArgu = MyConf.modules.initCmArgument(pool[i]);
                    break;
            }
            if(false===aArgu){
                delete pool[i];
                continue;
            }
            if(aArgu){
                pool[i].sArgument = ( 'undefined'!=typeof(pool[i].sArgument) && pool[i].sArgument ) ? [pool[i].sArgument,aArgu].join('&') : aArgu;
            }
        }
    }

    MyConf.pool = pool;
    if('undefined'!=typeof(yahoo_ad_style)){
        MyConf.user = yahoo_ad_style;
    }else{
        MyConf.user = {};
    }
    MyConf.modules.initHotSpot();
    MyConf.modules.initDom();
}());


}());