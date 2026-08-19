library(DESeq2)

counts <- read.table(
    "results/counts/gene_counts.txt",
    header = TRUE,
    row.names = 1,
    sep = "\t",
    comment.char = "#",
    check.names = FALSE
)

# Remove featureCounts annotation columns
counts <- counts[,6:ncol(counts)]

colnames(counts) <- gsub(".sorted.bam", "", colnames(counts))

metadata <- read.csv(
    "data/metadata/sample_metadata.csv",
    row.names = 1
)

counts <- counts[, rownames(metadata)]

dds <- DESeqDataSetFromMatrix(
    countData = round(counts),
    colData = metadata,
    design = ~ condition
)

# Remove low-count genes
dds <- dds[rowSums(counts(dds) >= 10) >= 2,]

dds <- DESeq(dds)

res <- results(
    dds,
    contrast = c(
        "condition",
        "Preeclampsia",
        "Control"
    )
)

res <- res[order(res$padj),]

dir.create(
    "results/differential_expression",
    showWarnings = FALSE
)

write.csv(
    as.data.frame(res),
    "results/differential_expression/DEGs.csv"
)

# Significant DEGs
sig <- subset(
    as.data.frame(res),
    padj < 0.05 &
    abs(log2FoldChange) >= 1
)

write.csv(
    sig,
    "results/differential_expression/significant_DEGs.csv"
)

# Upregulated
up <- subset(
    sig,
    log2FoldChange >= 1
)

write.csv(
    up,
    "results/differential_expression/upregulated_genes.csv"
)

# Downregulated
down <- subset(
    sig,
    log2FoldChange <= -1
)

write.csv(
    down,
    "results/differential_expression/downregulated_genes.csv"
)

saveRDS(
    dds,
    "results/differential_expression/dds.rds"
)
