params.reads = "./samples.csv"
params.outdir = "./outdir"
reads_ch = Channel
    .fromPath( params.reads )
    .splitCsv(header:true)
    .map{ row -> tuple(row.id, file(row.read1), file(row.read2))}
    
process checkqc {
    tag "READS QUALITY CONTROL"
    label "medium"
    executor "local"
    cpus 4
    time '1h'
    disk '2 GB'
    // resourceLimits = [ cpus: 24, memory: 768.GB, time: 72.h ]
    //module 'ncbi-blast/2.2.27'
    errorStrategy "retry"
    maxRetries 3
    // more & more 
    publishDir "${params.outdir}/QC-Reports/", mode: 'copy'
     

    input:
	    tuple val(id), path(read1), path(read2)

    output:
        path  "*.{html,zip}" , emit: emittedCh
    script:
    """
    fastqc -t ${task.cpus} ${read1} ${read2}
    """
} 
workflow{
    checkqc(reads_ch)  
} 