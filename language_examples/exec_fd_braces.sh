#!/bin/bash

# Test case for exec with named file descriptors in braces
# This is valid bash 4.1+ syntax

function test_fd {
    # Open a file descriptor
    exec {logfd}>/tmp/logfile.txt
    
    echo "Writing to log" >&"$logfd"
    
    # Close the file descriptor
    exec {logfd}>&-
    
    echo "Done"
}

# Another test with multiple FD operations
function test_multiple_fd {
    exec {fd1}>/tmp/file1.txt
    exec {fd2}>/tmp/file2.txt
    
    echo "test1" >&"$fd1"
    echo "test2" >&"$fd2"
    
    exec {fd1}>&-
    exec {fd2}>&-
}

test_fd
test_multiple_fd
