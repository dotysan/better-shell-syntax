#!/bin/bash

function test_fd {
    exec {logfd}>&-
    echo "Done"
}
