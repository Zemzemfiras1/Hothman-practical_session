// Parameter
params.reads = "../snippet-level2/samples.csv"
params.outdir = "./outdir"

/// Channels ///

reads_ch = Channel.fromPath( params.reads )
                  .splitCsv(header:true)
                  .map{ row -> tuple(row.id, file(row.read1), file(row.read2))}


include {fastqcMultiqc} from "./subworkflows/"


workflow {
    fastqcMultiqc(reads_ch)
}