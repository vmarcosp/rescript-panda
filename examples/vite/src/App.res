%%raw(`import './index.css'`)
open Panda

module App = {
  @react.component
  let make = () => {
    <div
      className={css({
        bg: #"blue.50",
        color: #"blue.600",
        px: #1,
        py: #4,
        fontWeight: #bold,
        fontSize: #xs,
      })}>
      {"ReScript Panda"->React.string}
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
