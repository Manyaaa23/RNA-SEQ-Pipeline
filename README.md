RNA Seq Analysis
Transcriptomic Analysis of Preeclampsia

RNA-seq analysis of preeclampsia and control samples to identify differentially expressed genes and biological pathways associated with disease.

Pipeline

FASTQ → FastQC → Trimming → HISAT2 → SAMtools → featureCounts → DESeq2 → GO/KEGG

Data

Publicly available RNA-seq data were used.

Raw FASTQ files and reference genome files are not included due to file size.

Analysis

- Quality control
- Read trimming
- Genome alignment
- BAM processing
- Gene-level quantification
- Differential expression analysis
- PCA
- Volcano plot
- Heatmap
- GO enrichment
- KEGG pathway analysis

Tools

FastQC | Trim Galore | HISAT2 | SAMtools | featureCounts | DESeq2 | clusterProfiler | R

Author

Manya Taneja
