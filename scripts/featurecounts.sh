#!/bin/bash

mkdir -p results/counts

GTF="reference/Homo_sapiens.GRCh38.115.gtf"

featureCounts \
    -T 8 \
    -p \
    -s 0 \
    -a "$GTF" \
    -o results/counts/gene_counts.txt \
    results/alignment/bam/*.sorted.bam
