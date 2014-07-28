library loading_box;

import 'dart:html';

void main() {
      
}

/**
* Our modal dialog class
*/
class BoxLoading {
  final DivElement _content;
  final DivElement _blackOverlay;

  //Constructor
  BoxLoading(String message) :
    //constructor pre-init
    _content = new Element.tag("div"),
    _blackOverlay = new Element.tag("div")
   
  {
    

    
    _content.nodes.add(getStylesheetContent());
    _blackOverlay.nodes.add(getStylesheetOverlay());
    
    //constructor body
    _content.id = "modalContent";
    _blackOverlay.id = "modalOverlay";

    //Our message will go inside this span
    SpanElement span = new Element.tag("span");
    span.innerHtml = message;
    _content.nodes.add(span);

  }

  //remove the modal dialog div's from the dom.
  hide() {
    document.body.nodes.remove(_content);
    document.body.nodes.remove(_blackOverlay);
  }

  //add the modal dialog div's to the dom
  show() {
    document.body.nodes.add(_content);
    document.body.nodes.add(_blackOverlay);
  }
  
  getStylesheetOverlay() {
    StyleElement style = new StyleElement();
    style.style.display="block";
    style.id=".black_overlay";
    style.style.position="absolute";
    style.style.top="0%";
    style.style.left="0%";
    style.style.width="100%";
    style.style.height="100%";
    style.style.backgroundColor="black";
    style.style.zIndex="1001";
    style.style.opacity=".80";
    style.style.filter="alpha(opacity=80)";
    
    return style;
  }
  
  getStylesheetContent() {
    StyleElement style = new StyleElement();
    style.style.display="block";
    style.id=".white_content";
    style.style.position="absolute";
    style.style.top="50%";
    style.style.left="50%";
    style.style.width="42px";
    style.style.height="42px";
    style.style.border="1px solid black";
    style.style.zIndex="1002";
    style.style.overflow="auto";
    style.style.backgroundImage="url('data:image/gif;base64,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')";  
    return style;
  }

}