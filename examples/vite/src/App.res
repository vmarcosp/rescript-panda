%%raw(`import './index.css'`)
open Panda

module App = {
  @react.component
  let make = () => {
    <div>
      <div className={css({color: %hex("#fafafa"), minHeight: #"8xl", padding: #1})}>
        {"ReScript Panda"->React.string}
      </div>
      <div className={css({color: #"secondary.dark.300"})}> {"Test"->React.string} </div>
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
