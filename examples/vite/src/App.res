%%raw(`import './index.css'`)
open Panda

let className: JsxDOM.domProps = {
  className: "",
}

module App = {
  @react.component
  let make = () => {
    <div {...className}>
      <div className={css({color: #"primary.400", padding: #1 })}> {"ReScript Panda"->React.string} </div>
      <div className={css({color: #"secondary.dark.300"})}> {"Test"->React.string} </div>
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
