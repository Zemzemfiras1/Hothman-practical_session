params.run_quality_control = false


process conditional_process {
    // Only run when condition is met
    publishDir "./snippet-level3/outputDir/", mode: 'copy'
    when:
    params.run_quality_control == true // true

    /*
    output: 
    path "qc_report.html"
    */
    script:
    """
    echo "Running quality control on input file: !{raw_data}"
    echo "Generating report: qc_report.html"
    # Simulate the quality control process
    echo "<html><body><h1>Quality Control Report</h1><p>Processed: 100% }</p></body></html>" > qc_report.html
    """
}

workflow {
    conditional_process() 
}