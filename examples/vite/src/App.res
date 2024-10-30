%%raw(`import './index.css'`)
open Panda

module App = {
  @react.component
  let make = () => {
    <div className={css({backgroundColor:%hex("fafafa") })}>
      <div className={css({color: #"primary.400"})}> {"ReScript Panda"->React.string} </div>
      <div className={css({color: #"secondary.dark.300"})}> {"Test"->React.string} </div>
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
