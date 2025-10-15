process TimeFromConfig {
    label 'too_Short'

    output:
    stdout

    script:
    """
    sleep 03
    # Change sleep to 07
    echo "This process will Never Fail" 
    """
}

workflow {
    TimeFromConfig()
   // TimeFromConfig.out.view()
}
