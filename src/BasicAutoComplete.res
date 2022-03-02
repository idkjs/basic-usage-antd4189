// open Antd;
// open AutoComplete;
module Option = {
  type t = {
    id: option<string>,
    text: option<string>,
    value: option<string>,
  }
}

type value = {value: string}
let mockVal = (~str: string, ~repeat: int=1, ()) => {
  value: Js.String.repeat(repeat, str),
}

@react.component
let make = () => {
  let (value, setValue) = React.useState(_ => "")
  let (options, setOptions) = React.useState(_ => [])

  let onSearch = (searchText: string) =>
    searchText == ""
      ? {
          let options = []
          setOptions(_ => options)
        }
      : {
          let options = [
            mockVal(~str=searchText, ()),
            mockVal(~str=searchText, ~repeat=2, ()),
            mockVal(~str=searchText, ~repeat=3, ()),
          ]
          setOptions(_ => options)
        }
  //   let onSelect = (data, e) => {
  //     Js.log2("onSelect data", data);
  //   };
  let onSelect = (data, e) => Js.log3("onSelect", data, e.value)
  let onChange = data => {
    Js.log2("onChange data", data)
    setValue(_ => data)
  }
  //   let onChange = value => {
  //     Js.log2("onChange value", value);
  //     setValue(_ => ReactEvent.Form.target(value)##value);
  //     //   setSearchValue(_ => ReactEvent.Form.target(v)##value);
  //   };
  <>
    <AutoComplete
      options
      style={ReactDOM.Style.make(~width="200", ())}
      onSelect
      onSearch
      placeholder="input here"
    />
    <br />
    <AutoComplete
      value
      options
      style={ReactDOM.Style.make(~width="200", ())}
      onSelect
      onSearch
      onChange
      placeholder="control mode"
    />
  </>
}
let default = make
