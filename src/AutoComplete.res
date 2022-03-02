@module("antd") @react.component
external make: (
  ~options: 'a=?,
  ~placeholder:string=?,
  ~value: string=?,
  ~onChange: string => unit=?,
  ~onSearch: string => unit=?,
  ~onSelect: ('value, 'option) => unit=?,
  ~className: string=?,
  ~style: ReactDOMStyle.t=?,
  ~children: React.element=?,
) => React.element = "AutoComplete"
