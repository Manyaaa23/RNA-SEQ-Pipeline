library(ggplot2)

res <- read.csv(
    "results/differential_expression/DEGs.csv",
    row.names = 1
)

res$group <- "Not significant"

res$group[
    res$padj < 0.05 &
    res$log2FoldChange >= 1
] <- "Upregulated"

res$group[
    res$padj < 0.05 &
    res$log2FoldChange <= -1
] <- "Downregulated"

res$neglog10padj <- -log10(res$padj)

p <- ggplot(
    res,
    aes(
        x = log2FoldChange,
        y = neglog10padj
    )
) +
    geom_point(aes(shape = group)) +
    geom_vline(
        xintercept = c(-1,1),
        linetype = "dashed"
    ) +
    geom_hline(
        yintercept = -log10(0.05),
        linetype = "dashed"
    ) +
    labs(
        title = "Preeclampsia Differential Expression",
        x = "Log2 Fold Change",
        y = "-Log10 Adjusted P-value"
    ) +
    theme_classic()

ggsave(
    "figures/volcano_plot.png",
    p,
    width = 8,
    height = 6,
    dpi = 300
)
