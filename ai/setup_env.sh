#!/usr/bin/env bash
# OSC Ascend setup for the AI-generated hello-world environment.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

module load miniconda3/24.1.2-py310

# shellcheck disable=SC1091
source "$(conda info --base)/etc/profile.d/conda.sh"

ENV_NAME="hello_world_ai"

if conda env list | awk '{print $1}' | grep -qx "$ENV_NAME"; then
  echo "Environment $ENV_NAME already exists; updating from environment.yml"
  conda env update -f environment.yml --prune
else
  conda env create -f environment.yml
fi

conda activate "$ENV_NAME"
pip install -r requirements.txt

python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python ($ENV_NAME)"
Rscript -e "IRkernel::installspec(name='ir_${ENV_NAME}', displayname='R ($ENV_NAME)')"

echo "Environment ready. Activate with: conda activate $ENV_NAME"
