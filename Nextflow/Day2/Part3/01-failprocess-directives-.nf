// Define a process named 'FailingProcess'
process FailingProcess {

    script:
    """
    # Pause execution for 5 seconds
    sleep 05
    
    # Print a message to stdout
    echo "This process will fail initially"
    
    # Exit with non-zero status to simulate failure
    exit 1
    """
}

// Define the workflow
workflow {
    // Run the FailingProcess
    FailingProcess()
}
