#!/bin/bash

# Test named file descriptors (bash 4.1+)
function test_named_fd {
    exec {logfd}>&-
    echo "Done"
}
