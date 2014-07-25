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
    
    _content.nodes.add(getStylesheet());
    _blackOverlay.nodes.add(getStylesheet());
    
    //constructor body
    _content.id = "modalContent";
    _content.classes.add("white_content");  //set the class for CSS
    _blackOverlay.id = "modalOverlay";
    _blackOverlay.classes.add("black_overlay"); //set the class for CSS

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
  
  getStylesheet() {
    LinkElement styleSheet = new Element.tag("link");
    styleSheet.rel = "stylesheet";
    styleSheet.type="text/css";
    styleSheet.href="loadingbox.css";
    return styleSheet;
  }

}

