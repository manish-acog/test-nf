process HELLO_WORLD {
    label "process_large"
    label "hello_world"
    echo true

    input:
    val input  

    script:
    """
    echo "Processing input: ${input}"
    curl -I https://www.google.com
    echo "Nothing to see here! Bye!!"
    """
}

workflow test_workflow {
    main:
    ch_input = params.input  
    HELLO_WORLD(ch_input) 
}

workflow {
    test_workflow()
}
