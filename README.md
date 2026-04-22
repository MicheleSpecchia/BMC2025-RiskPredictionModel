# BMC2025

R project for depression-risk modeling (`euro_d`) with:
- cross-validation (`cv.R`)
- feature selection (forward/backward/genetic)
- threshold analysis
- notebook and Quarto exploratory workflows

## Goal: usable by anyone

To make this repository runnable by other people with minimal friction:
- use the same folder structure (keep `data/` in place)
- run setup script once
- open notebook or render Quarto report

## Quick start (local)

Prerequisites:
- R (>= 4.2 recommended)
- Python 3 + JupyterLab
- Quarto CLI (only if you want `.qmd` rendering)

From project root:

```powershell
Rscript scripts/setup_environment.R --register-kernel
```

Run environment checks:

```powershell
Rscript scripts/check_environment.R
```

Open notebook:

```powershell
python -m jupyter lab
```

Then open:
- `notebooks/analisi_base.ipynb` (kernel: `R`)

Render Quarto report:

```powershell
quarto render notebooks/analisi_base.qmd
```

Output:
- `notebooks/analisi_base.html`

## Quick start (online)

Most practical options:
- Posit Cloud: upload this project folder, open `notebooks/analisi_base.qmd`, click Render.
- GitHub + Codespaces: clone and run the same commands above.

## Notes

- `install.R` is now idempotent: it installs only missing packages and loads required libraries.
- Main pipeline is in `pipeline.R`.
- Notebook/Quarto versions are aligned with pipeline helper scripts.
