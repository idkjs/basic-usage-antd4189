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

//   let onSearch = (searchText: string) =>
//     searchText == ""
//       ? {
//           let options = []
//           setOptions(_ => options)
//         }
//       : {
//           let options = [
//             mockVal(~str=searchText, ()),
//             mockVal(~str=searchText, ~repeat=2, ()),
//             mockVal(~str=searchText, ~repeat=3, ()),
//           ]
//           setOptions(_ => options)
//         }
  let onSearch = (searchText: string) =>{
      Js.log2("searchText string", searchText)
      switch (Js.typeof(searchText) == "string"){
          | true =>setOptions(_ => [])
          | false => {
              let options = [
                  mockVal(~str=searchText, ()),
                  mockVal(~str=searchText, ~repeat=2, ()),
                  mockVal(~str=searchText, ~repeat=3, ()),
              ]
              setOptions(_ => options)
          }
      }
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
        }}

  let onSelect = (data, e) => Js.log3("onSelect", data, e.value)
  let onChange = data => {
    Js.log2("onChange data", data)
    setValue(_ => data)
  }

  <>
    <AutoComplete
      options
      style={ReactDOM.Style.make(~width="200px", ())}
      onSelect
      onSearch
      placeholder="input here"
    />
    <br />
    <br />
    <AutoComplete
      value
      options
      style={ReactDOM.Style.make(~width="200px", ())}
      onSelect
      onSearch
      onChange
      placeholder="control mode"
    />
  </>
}
let default = make
