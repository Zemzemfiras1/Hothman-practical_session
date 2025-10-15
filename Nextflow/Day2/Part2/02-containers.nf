params.reads = "./samples.csv"
params.outdir = "./outdir"
reads_ch = Channel
    .fromPath( params.reads )
    .splitCsv(header:true)
    .map{ row -> tuple(row.id, file(row.read1), file(row.read2))}
     
process checkqc {
    errorStrategy 'retry'
    maxRetries 3
    cpus 11
    publishDir "${params.outdir}/QC-Reports/", mode: 'copy'
    conda "bioconda::fastqc=0.11.9"
    container "${ workflow.containerEngine == 'singularity' ?
                "docker://staphb/fastqc:0.12.f1"  :  // .. check me .. 
                "staphb/fastqc:0.12.1" }"

    input:
	tuple val(id), path(read1), path(read2)

    output:
    path  "*.{html,zip}" , emit: emittedCh
    script:
    """
    fastqc -t ${task.cpus} ${read1} ${read2}
    """
}
// Gathering Qc Reports ;

process checkmultiqc {
    tag "Gathering Multiqc FOR RAW READS"
    publishDir "${params.outdir}/Multi-QC-Reports/" ,  mode:'copy'

    conda "bioconda::multiqc=1.27"

    container "${ workflow.containerEngine == 'singularity' ? 
                "docker://multiqc/multiqc:latest"          : 
                "multiqc/multiqc:latest"    }"
   

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
   // checkmultiqc(checkqc.out.emittedCh.collect())
    
}
