// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Css from "@styled/css";
import * as Client from "react-dom/client";

import './index.css'
;

function App$App(props) {
  return React.createElement("div", {
              className: Css.css({
                    color: "primary",
                    backgroundColor: "green"
                  })
            }, "Hello <3");
}

var App = {
  make: App$App
};

var element = document.querySelector("#root");

if (!(element == null)) {
  Client.createRoot(element).render(React.createElement(App$App, {}));
}

export {
  App ,
}
/*  Not a pure module */
