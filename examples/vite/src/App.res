%%raw(`import './index.css'`)

let rgb = (r, g, b) => Obj.magic(`rgb(${r}, ${g}, ${b})`)

module App = {
  @react.component
  let make = () => {
    <div className={PandaCSS.css({color: #"primary.300"})}> {"Hello <3"->React.string} </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
