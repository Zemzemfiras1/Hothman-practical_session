params.reads = "./samples.csv"
params.outdir = "./outdir"
reads_ch = Channel
    .fromPath( params.reads )
    .splitCsv(header:true)
    .map{ row -> tuple(row.id, file(row.read1), file(row.read2))}
     
process fastqc {
    publishDir "${params.outdir}/quality/", mode: 'copy'
     conda "bioconda::fastqc=0.12.1"
    container "${ workflow.containerEngine == 'singularity' ?
                "https://community-cr-prod.seqera.io/docker/registry/v2/blobs/sha256/e0/e0c976cb2eca5fee72618a581537a4f8ea42fcae24c9b201e2e0f764fd28648a/data" :
                "staphb/fastqc:0.12.1" }"

    input:
	tuple val(id), path(read1), path(read2)

    output:
    path  "*.{html,zip}" , emit: emittedCh
    script:
    """
    fastqc ${read1} ${read2}
    """
}
// Gathering Qc Reports ;

process multiqc {
    tag "Gathering Multiqc FOR RAW READS"
    publishDir "${params.outdir}/QualityControl/RAW/multiqc/" ,  mode:'copy'

    conda "bioconda::multiqc=1.27"

    container "${ workflow.containerEngine == 'singularity' ? 
                "https://community-cr-prod.seqera.io/docker/registry/v2/blobs/sha256/48/4817a8a888dac348852d040c9ae14869bacb628cb3d7f91400e68eed2a9fd701/data"          : 
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
    fastqc(reads_ch)
    multiqc(fastqc.out.emittedCh.collect())
    
}
