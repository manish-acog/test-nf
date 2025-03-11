params.input = "Hello, Nextflow!"

process HELLO_WORLD {
    label "process_large"
    label "hello_world"
    echo true

    input:
    val input  // Takes a single value as input

    script:
    """
    echo "Processing input: ${input}"
    echo "Nothing to see here! Bye!!"
    """
}

workflow test_workflow {
    main:
    val ch_input = params.input  // Directly assign the string to val
    HELLO_WORLD(ch_input)  // Pass the value to the process
}

workflow {
    test_workflow()
}
