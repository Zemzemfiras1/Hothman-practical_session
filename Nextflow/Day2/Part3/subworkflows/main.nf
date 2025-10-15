include {fastqc} from "../modules/fastqc"
include {multiqc} from "../modules/multiqc"

workflow fastqcMultiqc {
    take:
        myinputreads
    main:
    if (params.onlyqc){
        fastqc(myinputreads)
    } else {
        fastqc(myinputreads)
        multiqc(fastqc.out.emittedCh.collect())
    }
    
}