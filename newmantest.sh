#!/bin/sh
echo "What makes you think I’m lookin’ for trouble?" 
newman run Picard01.postman_collection.json || echo "Test failed - stopping container"; docker container stop node-app1; exit 1

