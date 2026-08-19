library(DESeq2)
library(pheatmap)

dds <- readRDS(
    "results/differential_expression/dds.rds"
)

vsd <- vst(
    dds,
    blind = FALSE
)

deg <- read.csv(
    "results/differential_expression/significant_DEGs.csv",
    row.names = 1
)

genes <- rownames(deg)

genes <- genes[
    genes %in% rownames(assay(vsd))
]

mat <- assay(vsd)[genes,]

annotation <- as.data.frame(
    colData(vsd)[,"condition",drop=FALSE]
)

pheatmap(
    mat,
    scale = "row",
    annotation_col = annotation,
    filename = "figures/heatmap.png"
)
