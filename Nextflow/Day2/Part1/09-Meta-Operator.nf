// Define input parameters
params.reads  = "./samples.csv"  // Path to the CSV file containing sample info
params.outdir = "./outdir"                     // Path to the output directory


// Create a channel from the CSV file, split it into rows, and include the header
Channel.fromPath(params.reads)
       .splitCsv(header: true)  // Split the CSV file into individual rows as maps with header keys
       .set { initialCh }       // Store the resulting channel in `initialCh`

// View the contents of the channel for debugging
initialCh.view { row -> "initialCh : $row" }  // Print each row with the prefix "initialCh :"


// Create a channel that converts each row into a tuple containing the sample ID and file paths
Channel.fromPath(params.reads)
       .splitCsv(header: true)             // Split CSV file into rows
       .map { row -> tuple(row.id, file(row.read1), file(row.read2)) }  // Map each row to a tuple: (id, read1 file, read2 file)
       .set { tupleCh }                   // Store the resulting channel in `tupleCh`

// View the contents of the tuple channel
tupleCh.view { tupleCh -> "tupleCh : $tupleCh" }  // Print each tuple with the prefix "tupleCh :"


// Create a channel that emits metadata along with files for each row
Channel.fromPath(params.reads)
       .splitCsv(header: true) 
       .map { row ->
            // Create metadata map for the row
            metadata = [
                id: row.id
            ]
            // Emit a list containing metadata and list of files
            [metadata, [file(row.read1), file(row.read2)]]  
        }
       .set { metaCh }  // Store the resulting channel in `metaCh`

// View the contents of the metadata channel
metaCh.view { metaCh -> "metaCh : $metaCh" }  // Print each item with the prefix "metaCh :"


Channel.fromPath(params.reads)
    .splitCsv(header: true) 
    .map { row ->
        def files = [ file(row.read1), file(row.read2) ]

        def metadata = [
            id   : row.id,
            files: files
        ]

        [ metadata, files ]
    }
    .set { metaCh }

metaCh.view()