params.reads = "./samples.csv"
params.outdir = "./outdir"
//params.cpus = 16

Channel.fromPath( params.reads )
       .splitCsv(header:true)
       .map{ row -> tuple(row.id, file(row.read1), file(row.read2))}
       .set{reads_ch}


// QULITY CONTROL 

process checkqc { 
    tag " QULITY CONTROL "
   // cpus 10
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
// MULTIQC process

process checkmultiqc {
    tag "GENERATE MULTIQC" 
    publishDir "${params.outdir}/Multi-QC-Reports/" ,  mode:'copy'

    input:
        path (fastqc)
            
    output:
        path "{multiqc_data,multiqc_report.html}"
           
    script:
    """
    multiqc . --ai 
    """
}
 

workflow {
    checkqc(reads_ch)
    checkmultiqc(checkqc.out.emittedCh.collect())

}
