// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Hello from "./Hello.bs.js";
import * as React from "react";
import * as ReactDom from "react-dom";

import './App.css'
;

function App$App(Props) {
  return React.createElement("div", undefined, React.createElement("p", undefined, "Hello World adze"), React.createElement(Hello.HelloWidget.make, {}));
}

var App = {
  make: App$App
};

var root = document.querySelector("#root");

if (!(root == null)) {
  ReactDom.render(React.createElement(App$App, {}), root);
}

export {
  App ,
  
}
/*  Not a pure module */
