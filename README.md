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
1)volcanoplot.png
<img width="553" height="491" alt="3af5a27c-0f26-4b5d-b22b-2468e3d84e04" src="https://github.com/user-attachments/assets/5fcba0ca-d817-4fb2-b2ab-860c60df1b7c" />

2) PCAplot.png

<img width="553" height="491" alt="08a2c05d-7ce5-463d-ad43-a06fd6dd1d39" src="https://github.com/user-attachments/assets/54cc5517-0962-4e55-b7d9-a08d3a7bf3a6" />

3)heatmap.png

<img width="2700" height="3000" alt="Heatmap_Top30_DEGs" src="https://github.com/user-attachments/assets/641251fc-a8bb-4141-85ac-c773922329d2" />
4)dotplot.png 

<img width="3600" height="2700" alt="GO_Biological_Process_Dotplot" src="https://github.com/user-attachments/assets/3edc7a63-3655-480a-8607-ed0823814dfc" />






Author

Manya Taneja
