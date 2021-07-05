type action = ChangeName(string) | ChangeProfession

type state = {name: string}

let reducer = (state, action) => {
  switch action {
  | ChangeName(name) => {name: name}
  | ChangeProfession => state
  }
}

module NameInput = {
  @react.component
  let make = (~state: state, ~dispatch) => {
    let onChange = evt => {
      ReactEvent.Form.preventDefault(evt)
      let value = ReactEvent.Form.target(evt)["value"]
      dispatch(ChangeName(value))
    }

    <input onChange value=state.name />
  }
}

module Demo = {
  type schoolPerson = Teacher | Director | Student(string)

  let greeting = person =>
    switch person {
    | Teacher => "Hey Professor!"
    | Director => "Hello Director."
    | Student("Richard") => "Still here Ricky?"
    | Student("") => "Is anyone here ?"
    | Student(anyOtherName) => "Hey, " ++ anyOtherName ++ "."
    }
}

module Greeting = {
  @react.component
  let make = (~name) => {
    <div className={`text-lg font-semibold border-yellow-400 border-8`}>
      {React.string(Demo.greeting(Student(name)))}
    </div>
  }
}

module HelloWidget = {
  @react.component
  let make = () => {
    let (state, dispatch) = React.useReducer(reducer, {name: "Mr Hyde"})

    <div>
      <div> {React.string("What's your name hh?")} </div>
      <NameInput state dispatch />
      <Greeting name=state.name />
    </div>
  }
}
