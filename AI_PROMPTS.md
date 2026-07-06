# AI Prompt Log — Assignment 1 Part B

Use excerpts from this file in `REFLECTION.md` (Part C must be written in your own words).

## Prompt 1 (initial scaffold)

> I need a minimal Python+R+Bash project that prints Hello World from each language. Generate hello.sh, hello.py, hello.R, an environment.yml, a requirements.txt, and a setup_env.sh that builds the env. Pin reasonable versions.

**AI output:** Created `ai/hello.sh`, `ai/hello.py`, `ai/hello.R`, `ai/environment.yml`, `ai/requirements.txt`, and `ai/setup_env.sh`.

**Saved first-pass setup script:** `ai/setup_env.initial.sh` (unchanged from the first AI draft).

## Prompt 2 (fix setup failures on OSC Ascend)

> setup_env.sh fails on OSC: `conda activate` errors with "Run 'conda init' before 'conda activate'" in a non-interactive bash script, and re-running the script fails with "prefix already exists". Fix setup_env.sh for OSC Ascend using `module load miniconda3/24.1.2-py310`, source conda.sh, handle existing envs, and cd to the script directory before using relative paths.

**AI changes:** Updated `ai/setup_env.sh` and relaxed pins in `ai/environment.yml` (`python=3.10`, wildcard minor versions).

## Prompt 3 (add Hello World notebooks)

> Add the three Hello World Jupyter notebooks to ai/ (hello_bash.ipynb, hello_python.ipynb, hello_r.ipynb) matching Part A structure, using the hello_world_ai kernels from setup_env.sh.

**AI output:** Created `ai/hello_bash.ipynb` (%%bash magic, kernel `hello_world_ai`), `ai/hello_python.ipynb` (kernel `hello_world_ai`), and `ai/hello_r.ipynb` (kernel `ir_hello_world_ai`).

## What broke on first run (before fixes)

| Step | Result |
|------|--------|
| `conda env create -f environment.yml` | Worked (created `hello_world_ai`) |
| `conda activate hello_world_ai` | Failed: `CondaError: Run 'conda init' before 'conda activate'` |
| `pip install -r requirements.txt` | Never reached |
| Kernel registration | Never reached |
| Re-run `setup_env.sh` | Failed: `CondaValueError: prefix already exists` |

## Key differences vs Part A (`Part_A_Manual/`)

| File | Part A (manual) | Part B (AI) |
|------|-----------------|-------------|
| Env name | `7030_class_1` | `hello_world_ai` |
| Python pin | `python=3.10` | Initially `python=3.11.9`, fixed to `3.10` |
| Extra packages | numpy, pandas, scipy, sklearn, ggplot2, caret | Only minimal stack + pip numpy/pandas |
| setup_env.sh | `module load`, kernel install, starts JupyterLab | Initially generic conda only; fixed version adds OSC module load |
| requirements.txt | Unpinned pip mirror of conda stack | Strict `==` pins; duplicates conda packages |
