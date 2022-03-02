module DefaultOptionTypeValue: {
  type t
  let number: int => t
  let string: string => t
} = {
  @unboxed
  type rec t = Any('a): t
  let number = (v: int) => Any(v)
  let string = (v: string) => Any(v)
}
type defaultOptionTypeValue = Js.Nullable.t<DefaultOptionTypeValue.t>
type rec defaultOptionType = {
  disabled: option<bool>,
  name: string,
  label: React.element,
  value: option<defaultOptionTypeValue>,
  children: option<array<React.element>>,
}
type dataSourceItemObject = {
  value: string,
  text: string,
}
module DataSourceItemType: {
  type t
  let dataSourceItemObject: dataSourceItemObject => t
  let reactNode: React.element => t
} = {
  @unboxed
  type rec t = Any('a): t
  let dataSourceItemObject = (v: dataSourceItemObject) => Any(v)
  let reactNode = (v: React.element) => Any(v)
}
type dataSourceItemType = DataSourceItemType.t
type rec autoCompleteProps<'ValueType, 'OptionType> = {
  dataSource: option<array<dataSourceItemType>>,
}
// and default = refAutoComplete
