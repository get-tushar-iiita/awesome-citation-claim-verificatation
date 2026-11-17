# Notebook section -> paper correspondence

| Notebook section | Paper element | Fidelity |
|---|---|---|
| 1-3 Background, mapping, RQs/hypotheses | Sec. I, III-C (RQ1-RQ4) | RQs re-scoped to what is testable (retrieval, verification, uncertainty, errors) |
| 4-5 SciFact acquisition, exploration, leakage-free splits | Sec. VIII-A (benchmarks, citation-graph disjoint splitting) | Connected-component split by cited doc; SciFact is a proxy |
| 6 Claim processing, rule-based decomposition | Stages 2-4, Eqs. 3-6 | Simplified demo; no coreference/LLM; not evaluated |
| 7 TF-IDF / BM25 / dense retrieval, Recall@K, MRR | Stage 7, Eqs. 7-8; Table VI dim. 2 | Sentence-level; no ColBERT, section weights, tables/figures |
| 8 TF-IDF+LR, retrieval-only, NLI, optional fine-tuning | Stage 9; Table I Layer 3 vs 4; Table VI dim. 3 | General-domain NLI; four-way label reduced to three |
| 9 Decision synthesis with gates/abstention | Stages 11-12 routing idea; Eq. 16 not implemented | Simple threshold rule tuned on validation |
| 10-12 Setup, metrics, results | Sec. VIII-B | Macro-F1, confusion matrices, ECE/Brier, conformal sets (Eqs. 14-15) |
| 13 Statistics | Sec. VIII-B (McNemar, bootstrap, Holm) | Cluster bootstrap instead of plain paired bootstrap |
| 14 Error analysis | Taxonomy T1-T8 (Table III); Eq. 13 (crude) | Lexical proxies, not annotation; scenarios A-C from Sec. IV-B are illustrative |
| 15-17 Discussion, limitations, conclusion | Sec. IX | Author interpretation left to be written after execution |
| Not implemented | Eq. 9-12, Stage 5-6, 8, 10 (DeltaE, D_scope, multimodal indexing, reranking), severity score | Listed in Sec. 16 |
