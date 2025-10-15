#!/usr/bin/env nextflow

// -------------------------
// Process 1: Create base CV
// -------------------------
process process1 {
    tag "Creating CV file"

    output:
    path "cv.txt"

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
    path mycvFile

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
    path mycvFile

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
    path mycvFile

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
// Workflow: chain processes
// -------------------------
workflow {
    // Chain all processes
    process1() 
    process2(process1.out) 
    process3(process2.out)
    process4(process3.out)

    // View the final CV
    process4.out.view()
}
