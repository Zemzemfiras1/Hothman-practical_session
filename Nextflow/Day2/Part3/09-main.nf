#!/usr/bin/env nextflow

// -------------------------
// Process 1: Create base CV
// -------------------------
process process1 {
    tag "Creating CV file"

    output:
    path "cv.txt" , emit : p1Emitted

    script:
    """
    echo "## Curriculum Vitae" > cv.txt
    """
}

// -------------------------
// Process 2: Add Personal Info
// -------------------------
process process2 {
    tag "Adding Personal Info"

    input:
    path mycvFile

    output:
    path mycvFile , emit : p2Emitted

    script:
    """
    cat << EOF >> ${mycvFile}
## Personal Information
Name: Mario Maria
Email: Mario.Maria@example.com
EOF
    """
}

// -------------------------
// Process 3: Add Skills
// -------------------------
process process3 {
    tag "Adding Skills"

    input:
    path mycvFile

    output:
    path mycvFile , emit : p3Emitted

    script:
    """
    cat << EOF >> ${mycvFile}
## Skills
- Python
- Nextflow
- Bioinformatics
EOF
    """
}

// -------------------------
// Process 4: Add Work Experience
// -------------------------
process process4 {
    tag "Adding Work Experience"

    input:
    path mycvFile 

    output:
    path mycvFile , emit : p4Emitted

    script:
    """
    cat << EOF >> ${mycvFile}
## Work Experience
- Research Assistant at Game Center 
- Bioinformatics Intern at Center Of entertainment
EOF
    """
}

// -------------------------
// Subworkflow: part1 (process1 + process2)
// -------------------------
workflow sbwPart1 {

    main:
    process1()
    process2(process1.out)

    emit:
        sbwPart1OUT = process2.out
}

// -------------------------
// Subworkflow: part2 (process3 + process4)
// -------------------------
workflow sbwPart2 {
    take:
        mycvFile

    main:
        process3(mycvFile)
        process4(process3.out)

    emit:
        finalCv = process4.out
}

// -------------------------
// Main workflow
// -------------------------
workflow {
    // Execute subworkflow part1
    sbwPart1()
    //sbwPart1.out.sbwPart1OUT.view()
    
    // Execute subworkflow part2
    sbwPart2(sbwPart1.out.collect())

}
