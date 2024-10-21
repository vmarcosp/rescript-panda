%%raw(`import './index.css'`)

module App = {
  @react.component
  let make = () => {
    <div className={PandaCSS.css({"fontWeight": "bold", "color": "red"})}>
      {"Hello <3"->React.string}
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
