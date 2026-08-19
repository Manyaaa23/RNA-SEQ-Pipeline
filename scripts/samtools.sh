#!/bin/bash

mkdir -p results/alignment/bam
mkdir -p results/alignment/stats

for SAM in results/alignment/*.sam
do
    SAMPLE=$(basename "$SAM" .sam)

    samtools view -@ 4 -b "$SAM" \
        > "results/alignment/bam/${SAMPLE}.bam"

    samtools sort -@ 4 \
        "results/alignment/bam/${SAMPLE}.bam" \
        -o "results/alignment/bam/${SAMPLE}.sorted.bam"

    samtools index \
        "results/alignment/bam/${SAMPLE}.sorted.bam"

    samtools flagstat \
        "results/alignment/bam/${SAMPLE}.sorted.bam" \
        > "results/alignment/stats/${SAMPLE}.flagstat.txt"
done
