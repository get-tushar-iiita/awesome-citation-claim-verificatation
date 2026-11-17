# CEDAR companion notebook: scientific claim verification on SciFact

`CEDAR_SciFact_Experiment.ipynb` is an **experimental computational case study** that operationalises selected components of the CEDAR paper
(retrieve -> verify -> abstain) on the public SciFact benchmark. It is **not** a validation of the full 12-stage framework, and SciFact is only a
**proxy** for misinterpreted-but-genuine citations (see Sections 4 and 16 of the notebook).

## Requirements
* Python 3.10+; internet access on first run (pip, SciFact download from AI2, Hugging Face models).
* Google Colab recommended (GPU optional). `pip install -r requirements.txt` for local runs.

## Run
1. Open the notebook in Colab -> *Runtime -> Run all* (or `jupyter notebook` locally).
2. Switches live in the `CONFIG` dict (Section 0): `USE_DENSE`, `USE_NLI`, `RUN_FINETUNE`, `K_SENT`, `N_BOOT`, `SEED`.
   Fast sparse-only run: `USE_DENSE=False`, `USE_NLI=False`.
3. If the SciFact download fails, the notebook prints manual instructions (place `corpus.jsonl`, `claims_train.jsonl`, `claims_dev.jsonl` in `data/scifact/`). Nothing is fabricated.
4. Outputs go to `results/` (CSV tables, `figures/*.png`, `config.json`, `environment.json`, auto-generated `results_summary.md`, per-claim predictions).

## Design in brief
* Test = official SciFact dev (test labels are hidden). Official train is split by connected components of cited documents into train/val/calibration; pool claims sharing cited documents with test are dropped; disjointness is asserted.
* Retrieval: TF-IDF, BM25, optional dense; sentence-level inside the cited abstract and abstract-level over the corpus; Recall@K and MRR.
* Verification: majority, retrieval-only similarity, TF-IDF+LR, zero-shot NLI, NLI + gated synthesis, optional fine-tuned NLI.
* Uncertainty: temperature scaling (ECE, Brier, NLL) and split-conformal sets. Statistics: cluster bootstrap, McNemar + Holm.
* Error analysis: heuristic cue proxies for taxonomy T1-T8 on real errors; hand-written illustrative examples kept separate.

## Honest status
The notebook ships **without outputs**; no result is hard-coded. The code was syntax-checked and run end-to-end only on a small *synthetic* fixture with a stubbed NLI model
(to test data handling, retrieval, metrics, statistics, plotting, saving). The real SciFact download and real transformer/sentence-transformer models have **not** been executed by the author of this package
(no network access); expect to fix minor environment issues on first run (e.g. model download names, library versions).
