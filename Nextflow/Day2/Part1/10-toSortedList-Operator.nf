// Path to the CSV file containing sample info
params.csv = "./snippet-level3/txtfiles.csv"

// Create an unsorted channel from the CSV file
// - checkIfExists: false allows workflow to run even if file is missing
// - splitCsv(header: true) parses the CSV into rows using the header
// - map each row into a tuple: (id, file path)
unsorted_Ch = Channel.fromPath(params.csv, checkIfExists: false)
                     .splitCsv(header: true)
                     .map { row -> tuple(row.id, file(row.path) ) }

// View each element of the unsorted channel with a custom label
unsorted_Ch.view{ it -> " unsorted_Ch : $it "}

// Create a sorted channel from the same CSV
// Steps are similar to above, but we sort the channel by the first element of the tuple (id)
sorted_Ch = Channel.fromPath(params.csv, checkIfExists: false)
                     .splitCsv(header: true)
                     .map { row -> tuple(row.id, file(row.path) ) }
                     .toSortedList { a, b -> a[0] <=> b[0] }  // Sort tuples by id
                     .flatMap { it }  // Flatten the sorted list back into a channel

// View each element of the sorted channel with a custom label
sorted_Ch.view{ it -> " sorted_Ch : $it " }
