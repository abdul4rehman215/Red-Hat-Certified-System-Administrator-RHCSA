#!/bin/bash
process_count=$(ps aux | wc -l)
echo "Number of running processes: $process_count"
