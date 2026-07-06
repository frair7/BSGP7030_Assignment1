# BSGP7030 Assignment 1 — Git Repo + First Software Environment

**Course:** BSGP 7030  
**Assignment:** Create a git repo for your first software environment and code  
**Author:** frair7  
**GitHub:** [https://github.com/frair7/BSGP7030_Assignment1](https://github.com/frair7/BSGP7030_Assignment1)

This repository satisfies Assignment 1 for BSGP 7030. It contains a hand-built (Part A) and an AI-assisted (Part B) version of the same minimal Python + R + Bash Hello World project, plus a written reflection (Part C).

---

## Assignment structure

Every graded assignment in this course has three parts:

| Part | Points | Location | How it was built |
|------|--------|----------|------------------|
| **A — Manual** | 5 | `Part_A_Manual/` | Typed by hand; no AI tools |
| **B — AI-assisted** | 3 | `ai/` | Generated and iterated with Cursor |
| **C — Reflection** | 2 | `REFLECTION.md` | Written by the author |

Supporting files at the repo root:

| File | Purpose |
|------|---------|
| `REFLECTION.md` | Part C answers (manual vs AI comparison, prompts, timing) |
| `AI_PROMPTS.md` | Log of AI prompts and what broke on first run |
| `.gitignore` | Ignores `.ipynb_checkpoints` and other common artifacts |

---

## Repository layout

```
bash_tutorial/
├── README.md                 ← you are here
├── REFLECTION.md             ← Part C (written by author)
├── AI_PROMPTS.md             ← AI prompt log for Part B
├── .gitignore
│
├── Part_A_Manual/            ← Part A: hand-built
│   ├── hello.sh              ← Hello World in Bash
│   ├── hello.py              ← Hello World in Python
│   ├── hello.R               ← Hello World in R
│   ├── hello_bash.ipynb      ← Bash notebook (%%bash magic)
│   ├── hello_python.ipynb    ← Python notebook
│   ├── hello_r.ipynb         ← R notebook
│   ├── environment.yml       ← Conda environment (7030_class_1)
│   ├── requirements.txt      ← Pip mirror of conda stack
│   └── setup_env.sh          ← Rebuilds env + launches JupyterLab
│
└── ai/                       ← Part B: AI-assisted
    ├── hello.sh
    ├── hello.py
    ├── hello.R
    ├── hello_bash.ipynb
    ├── hello_python.ipynb
    ├── hello_r.ipynb
    ├── environment.yml       ← Conda environment (hello_world_ai)
    ├── requirements.txt
    ├── setup_env.sh          ← Fixed OSC-aware setup script
    └── setup_env.initial.sh  ← First AI draft (kept for reflection)
```

---

## Prerequisites

This project was developed and tested on **OSC Ascend** (Ohio Supercomputer Center).

Before running either setup script:

```bash
module load miniconda3/24.1.2-py310
```

You need network access for `conda` and `pip` to resolve packages. Jupyter kernels are installed to your user directory (`~/.local/share/jupyter/kernels/`).

---

## Part A — Manual (`Part_A_Manual/`)

Built entirely by hand following the course tutorial. No AI tools were used.

### Environment

- **Conda env name:** `7030_class_1`
- **Scope:** Full course stack (numpy, pandas, scipy, sklearn, ggplot2, caret, etc.) for Assignments 2–5
- **Channels:** conda-forge, bioconda, defaults

### Setup (first time)

```bash
cd ~/bash_tutorial/Part_A_Manual
bash setup_env.sh
```

This script:

1. Loads the OSC Miniconda module
2. Creates the `7030_class_1` conda environment from `environment.yml`
3. Registers Python and R Jupyter kernels
4. Starts JupyterLab on port 2000 (`jupyter lab --no-browser --port=2000`)

### Quick test (scripts)

```bash
cd ~/bash_tutorial/Part_A_Manual
bash hello.sh
python hello.py
Rscript hello.R
```

Expected output for all three: `Hello, World!`

### Notebooks

Open in JupyterLab and select the matching kernel:

| Notebook | Kernel |
|----------|--------|
| `hello_bash.ipynb` | Python (7030_class_1) — uses `%%bash` cell magic |
| `hello_python.ipynb` | Python (7030_class_1) |
| `hello_r.ipynb` | R (7030_class_1) |

---

## Part B — AI-assisted (`ai/`)

Built with **Cursor** using a one-paragraph scaffold prompt, then iterated after testing `setup_env.sh` on OSC.

See `AI_PROMPTS.md` for the full prompt log and `ai/setup_env.initial.sh` for the unfixed first AI draft.

### Environment

- **Conda env name:** `hello_world_ai`
- **Scope:** Minimal Hello World stack (Python, JupyterLab, R, IRkernel, numpy/pandas via pip)
- **Channels:** conda-forge, defaults

### Setup

```bash
cd ~/bash_tutorial/ai
bash setup_env.sh
conda activate hello_world_ai
```

The fixed `setup_env.sh`:

- Loads `module load miniconda3/24.1.2-py310`
- Sources `conda.sh` so `conda activate` works in a bash script
- Updates an existing env or creates a new one from `environment.yml`
- Installs pip packages from `requirements.txt`
- Registers `hello_world_ai` (Python) and `ir_hello_world_ai` (R) Jupyter kernels

### Quick test (scripts)

```bash
cd ~/bash_tutorial/ai
bash hello.sh
python hello.py
Rscript hello.R
```

### Notebooks

| Notebook | Kernel |
|----------|--------|
| `hello_bash.ipynb` | Python (hello_world_ai) |
| `hello_python.ipynb` | Python (hello_world_ai) |
| `hello_r.ipynb` | R (hello_world_ai) |

Run `bash setup_env.sh` before opening notebooks so the kernels exist.

---

## Manual vs AI comparison (summary)

| | Part A (`Part_A_Manual/`) | Part B (`ai/`) |
|--|---------------------------|----------------|
| Env name | `7030_class_1` | `hello_world_ai` |
| Package scope | Full course data-science stack | Minimal hello-world only |
| Version pinning | Flexible (no strict pins) | Strict `==` pins in `requirements.txt` |
| `setup_env.sh` | OSC-aware from the start; starts JupyterLab | Initially generic; fixed after OSC testing |
| First-run issues | None observed | `conda activate` failed without sourcing `conda.sh`; re-run failed with "prefix already exists" |
| Notebooks | Hand-created in Jupyter | AI-generated to match Part A structure |

Full analysis belongs in `REFLECTION.md` (Part C).

---

## How to clone this repo

```bash
git clone https://github.com/frair7/BSGP7030_Assignment1.git
cd BSGP7030_Assignment1
```

If cloning with HTTPS, use a [GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) as your password when prompted.

---

## Submission

Submit a single GitHub repo URL on Canvas:

**https://github.com/frair7/BSGP7030_Assignment1**

The repo must contain:

- `Part_A_Manual/` — all manual files
- `ai/` — all AI-assisted files (including `setup_env.initial.sh` as evidence of the first draft)
- `REFLECTION.md` — completed by the author (Part C)

---

## License

Course assignment work for BSGP 7030. Not licensed for redistribution.
