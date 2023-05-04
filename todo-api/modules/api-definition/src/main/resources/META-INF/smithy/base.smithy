$version: "2"
namespace io.todo.metadata.definition.application


@pattern("^\\d{4}-\\d{2}-\\d{2}$")
@documentation("ISO Date")
string Date


@pattern("^\\d{4}-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\d(\\.\\d+)?(([+-]\\d\\d:\\d\\d)|Z)?$")
@documentation("ISO Date With Time")
string DateWithTime

@documentation("Duration String in Period Format")
string DurationString


@length(min: 1, max: 50)
string TodoId


@length(min: 0, max: 1000)
string VariableTextString

