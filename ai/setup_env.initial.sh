#!/usr/bin/env bash
# Recreate the hello-world conda environment from environment.yml.
set -euo pipefail

conda env create -f environment.yml
conda activate hello_world_ai
pip install -r requirements.txt

python -m ipykernel install --user --name hello_world_ai --display-name "Python (hello_world_ai)"
Rscript -e 'IRkernel::installspec(name="ir_hello_world_ai", displayname="R (hello_world_ai)")'

echo "Environment ready. Run: conda activate hello_world_ai"
