%%raw("import './App.css'")

module App = {
  @react.component
  let make = () => {
      <div>
        <p> {React.string("Hello World adze")} </p>
        <Hello.HelloWidget />
      </div>
  }
}

switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<App />, root)
| None => ()
}
