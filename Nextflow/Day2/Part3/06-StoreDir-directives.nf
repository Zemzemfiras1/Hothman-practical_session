process SaveWithStoreDir {
    // This ensures outputs are stored in a persistent directory
    storeDir "./snippet-level3/outputDir/"

    output:
    path "qc_report.html"

    script:
    """
    echo "Hello from storeDir at \$(date)" >> qc_report.html
    """
}

workflow {
    SaveWithStoreDir()
}