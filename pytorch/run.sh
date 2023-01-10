export NAME_NGC=pytorch:22.12-py3
docker pull nvcr.io/nvidia/${NAME_NGC}

docker run --gpus all --shm-size=64g \
--name pytorch_benchmark \
-v ~/data:/data \
-v $(pwd)"/scripts":/scripts \
nvcr.io/nvidia/${NAME_NGC} \
/bin/bash -c "cp -r /scripts/* /workspace; chmod -R 777 /workspace/examples; ./run_prepare.sh"


docker run \ --shm-size=128g \
--gpus all \
-v ~/data:/data \
-v $(pwd)"/scripts":/scripts \
-v $(pwd)"/results":/results \
--name pytorch_benchmark \
/bin/bash -c "cp -r /scripts/* /workspace; ./run_benchmark.sh 3090_v1 all 600"


python scripts/compile_results_pytorch_throughput.py --precision fp32 --system all
python scripts/compile_results_pytorch_throughput.py --precision fp16 --system all

python scripts/compile_results_pytorch_bs.py --precision fp32 --system all
python scripts/compile_results_pytorch_bs.py --precision fp16 --system all