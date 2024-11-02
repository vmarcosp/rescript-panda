%%raw(`import './index.css'`)
open Panda

let cardContainer = css({
  display: #flex,
  flexDirection: #column,
  backgroundColor: #white,
  borderRadius: #lg,
  boxShadow: #md,
  padding: #4,
  gap: #3,
  overflow: #hidden,
})

let cardImage = css({
  width: #full,
  objectFit: #cover,
})

let cardTitle = css({
  fontSize: #xl,
  fontWeight: #bold,
  color: #"gray.900",
})

let cardDescription = css({
  fontSize: #sm,
  color: #"gray.600",
})

module Card = {
  @react.component
  let make = () => {
    <div className={cardContainer}>
      <h3 className={cardTitle}> {React.string("Title")} </h3>
      <p className={cardDescription}> {React.string("Description")} </p>
    </div>
  }
}

module App = {
  @react.component
  let make = () => {
    <div>
      <Card />
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) => ReactDOM.Client.createRoot(element)->ReactDOM.Client.Root.render(<App />)
}
