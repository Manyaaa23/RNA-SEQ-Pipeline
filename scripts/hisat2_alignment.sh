#!/bin/bash

mkdir -p results/alignment

INDEX="reference/GRCh38"

for R1 in data/trimmed/*_1_val_1.fq.gz
do
    SAMPLE=$(basename "$R1" _1_val_1.fq.gz)

    R2="data/trimmed/${SAMPLE}_2_val_2.fq.gz"

    hisat2 \
        -x "$INDEX" \
        -1 "$R1" \
        -2 "$R2" \
        -p 8 \
        -S "results/alignment/${SAMPLE}.sam"

done
