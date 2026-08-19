#!/bin/bash

mkdir -p results/qc

for file in data/fastq/*.fastq.gz
do
    fastqc "$file" \
        --outdir results/qc \
        --threads 4
done
