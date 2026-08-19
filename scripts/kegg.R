library(clusterProfiler)
library(org.Hs.eg.db)

deg <- read.csv(
    "results/differential_expression/significant_DEGs.csv",
    row.names = 1
)

genes <- rownames(deg)

gene_ids <- bitr(
    genes,
    fromType = "SYMBOL",
    toType = "ENTREZID",
    OrgDb = org.Hs.eg.db
)

# GO enrichment

GO <- enrichGO(
    gene = gene_ids$ENTREZID,
    OrgDb = org.Hs.eg.db,
    ont = "BP",
    pAdjustMethod = "BH",
    pvalueCutoff = 0.05,
    readable = TRUE
)

dir.create(
    "results/pathway_analysis",
    showWarnings = FALSE
)

write.csv(
    as.data.frame(GO),
    "results/pathway_analysis/GO_results.csv"
)

png(
    "figures/GO.png",
    width = 1000,
    height = 800
)

dotplot(GO)

dev.off()

# KEGG

KEGG <- enrichKEGG(
    gene = gene_ids$ENTREZID,
    organism = "hsa",
    pvalueCutoff = 0.05
)

write.csv(
    as.data.frame(KEGG),
    "results/pathway_analysis/KEGG_results.csv"
)

png(
    "figures/KEGG.png",
    width = 1000,
    height = 800
)

dotplot(KEGG)

dev.off()
