// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Css from "@styled/css";
import * as Client from "react-dom/client";

import './index.css'
;

var className = {
  className: ""
};

function App$App(props) {
  return React.createElement("div", className, React.createElement("div", {
                  className: Css.css({
                        color: "primary.400",
                        padding: 1
                      })
                }, "ReScript Panda"), React.createElement("div", {
                  className: Css.css({
                        color: "secondary.dark.300"
                      })
                }, "Test"));
}

var App = {
  make: App$App
};

var element = document.querySelector("#root");

if (!(element == null)) {
  Client.createRoot(element).render(React.createElement(App$App, {}));
}

export {
  className ,
  App ,
}
/*  Not a pure module */
