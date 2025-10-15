// Define a process named 'FailingProcess'
process FailingProcess {
   // maxRetries 3
   // maxErrors     = '-1' // NO LIMIT
   // errorStrategy 'retry'
    time '5s'
    
    script:
    """
    # Pause execution for 5 seconds
    sleep 07
    
    # Print a message to stdout
    echo "This process will fail initially"
    
    # Exit with non-zero status to simulate failure
    # exit 1
    """
}

// Define the workflow
workflow {
    // Run the FailingProcess
    FailingProcess()
}
