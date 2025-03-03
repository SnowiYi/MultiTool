@if (@a==@b) @end /*
@ECHO OFF
cscript /e:jscript "%~f0"
START https://bit.ly/stupidahhlink
:: JScript portion */
var shl = new ActiveXObject("WScript.Shell");
for (var i=0; i<50; i++) {
    shl.SendKeys(String.fromCharCode(0xAF));
}