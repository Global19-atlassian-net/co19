/**
 * after web-platform-tests/html/syntax/parsing/Document.getElementsByTagName-foreign-02.html
 * @assertion
 * <link rel="help" href="https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementsbytagname">
 * <link rel="help" href="http://www.whatwg.org/html/#parsing">
 * @description getElementsByTagName and font 
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<font></font>
<svg><font/></svg>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL);
  
    var HTML = "http://www.w3.org/1999/xhtml", SVG = "http://www.w3.org/2000/svg";
    test(() {
      var fonts=document.getElementsByTagName("FONT");
      assert_equals(fonts.length, 1);
      var font0=fonts[0];
      assert_equals(font0.namespaceUri, HTML);
    }, "Upper-case font");
    
    test(() {
      var fonts=document.getElementsByTagName("font");
      assert_equals(fonts.length, 2);
      var font0=fonts[0];
      assert_equals(font0.namespaceUri, HTML);
      var font1=fonts[1];
      assert_equals(font0.namespaceUri, SVG);
    }, "Lower-case font");

    checkTestFailures();
}
