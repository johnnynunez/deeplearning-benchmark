#!/bin/bash

NUM_GPU=2
NUM_EXP=1

PyTorch_SSD_FP32_PARAMS=(
             "examples/ssd"
             args
             --data                   "/data/object_detection"
             --batch-size             "144"
             --benchmark-warmup       "10"
             --benchmark-iterations   "40"
	     --learning-rate          "0"
           )

PyTorch_SSD_AMP_PARAMS=(
             "examples/ssd"
             args
             --data                   "/data/object_detection"
             --batch-size             "256"
             --benchmark-warmup       "10"
             --benchmark-iterations   "40"
             --amp
	     --learning-rate          "0"
           )

PyTorch_resnet50_FP32_PARAMS=(
             "examples/resnet50v1.5"
             args
                                      "/data/imagenet"
             --arch                   "resnet50"
             --epochs                 "1" 
             --prof                   "50" 
             --batch-size             "496"
             --raport-file            "benchmark.json"
             --print-freq             "1"
             --training-only
	     --data-backend syntetic
           )

PyTorch_resnet50_FP16_PARAMS=(
             "examples/resnet50v1.5"
             args
                                      "/data/imagenet"
             --arch                   "resnet50"
             --fp16
             --static-loss-scale      "256"
             --epochs                 "1" 
             --prof                   "50" 
             --batch-size             "928"
             --raport-file            "benchmark.json"
             --print-freq             "1"
             --training-only  
	     --data-backend syntetic
           )

PyTorch_resnet50_AMP_PARAMS=(
             "examples/resnet50v1.5"
             args
                                      "/data/imagenet"
             --arch                   "resnet50"
             --amp
             --static-loss-scale      "256"
             --epochs                 "1" 
             --prof                   "50" 
             --batch-size             "928"
             --raport-file            "benchmark.json"
             --print-freq             "1"
             --training-only   
	     --data-backend syntetic
           )

PyTorch_maskrcnn_FP32_PARAMS=(
             "examples/maskrcnn/pytorch"
             args
             --config-file            "/workspace/patch/e2e_mask_rcnn_R_50_FPN_1x.yaml"
             SOLVER.IMS_PER_BATCH     "64"
             DTYPE                    "float32"
             SOLVER.MAX_ITER          "40"
             OUTPUT_DIR               "/results"
             PATHS_CATALOG            "/workspace/patch/paths_catalog_ci.py"
           )

PyTorch_maskrcnn_FP16_PARAMS=(
             "examples/maskrcnn/pytorch"
             args      
             --config-file            "/workspace/patch/e2e_mask_rcnn_R_50_FPN_1x.yaml"
             SOLVER.IMS_PER_BATCH     "64"
             DTYPE                    "float16"
             SOLVER.MAX_ITER          "40"
             OUTPUT_DIR               "/results"
             PATHS_CATALOG            "/workspace/patch/paths_catalog_ci.py"
           )

PyTorch_gnmt_FP32_PARAMS=(
            "examples/gnmt"
            args
            --dataset-dir             "/data/gnmt/wmt16_de_en"
            --train-batch-size        "576"
            --val-batch-size          "32"
            --test-batch-size         "32"
            --math                    "fp32"
            --epochs                  "1"
            --seed                    "2"
            --no-eval
           )

PyTorch_gnmt_FP16_PARAMS=(
            "examples/gnmt"
            args
            --dataset-dir             "/data/gnmt/wmt16_de_en"
            --train-batch-size        "968"
            --val-batch-size          "32"
            --test-batch-size         "32"
            --math                    "fp16"
            --epochs                  "1"
            --seed                    "2"
            --no-eval
           )

PyTorch_ncf_FP32_PARAMS=(
            "examples/ncf"
            args
            --data                    "/data/ncf/cache/ml-20m"
            --epochs                  "2"
            --batch_size              "10000000"
            --opt_level               "O0"
           )

PyTorch_ncf_FP16_PARAMS=(
            "examples/ncf"
            args
            --data                    "/data/ncf/cache/ml-20m"
            --epochs                  "2"
            --batch_size              "20000000"
            --opt_level               "O2"
           )

PyTorch_transformerxlbase_FP32_PARAMS=(
            "examples/transformer-xl/pytorch"
            args
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "40"
            --batch_size              "64"
            --dataset                 "wt103" 
            --n_layer                 "16"
            --d_model                 "512"
            --n_head                  "8"
            --d_head                  "64"
            --d_inner                 "2048"
            --dropout                 "0.1"
            --dropatt                 "0.0"
            --optim                   "jitlamb"
            --lr                      "0.0"
            --eta_min                 "0.001"
            --warmup_step             "1000"
            --tgt_len                 "192"
            --mem_len                 "192"
            --eval_tgt_len            "192"
            --log_interval            "10"
            --eval_interval           "5000"
            --roll
            --cuda
           )

PyTorch_transformerxlbase_FP16_PARAMS=(
            "examples/transformer-xl/pytorch"
            args
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "40"
            --batch_size              "128"
            --dataset                 "wt103" 
            --n_layer                 "16"
            --d_model                 "512"
            --n_head                  "8"
            --d_head                  "64"
            --d_inner                 "2048"
            --dropout                 "0.1"
            --dropatt                 "0.0"
            --optim                   "jitlamb"
            --lr                      "0.0"
            --eta_min                 "0.001"
            --warmup_step             "1000"
            --tgt_len                 "192"
            --mem_len                 "192"
            --eval_tgt_len            "192"
            --log_interval            "10"
            --eval_interval           "5000"
            --roll
            --cuda
            --fp16
           )

PyTorch_transformerxllarge_FP32_PARAMS=(
            "examples/transformer-xl/pytorch"
            args
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "40"
            --batch_size              "32"
            --dataset                 "wt103" 
            --n_layer                 "18"
            --d_model                 "1024"
            --n_head                  "16"
            --d_head                  "64"
            --d_inner                 "4096"
            --dropout                 "0.2"
            --dropatt                 "0.2"
            --optim                   "adam"
            --lr                      "0.0"
            --warmup_step             "16000"
            --tgt_len                 "256"
            --mem_len                 "256"
            --eval_tgt_len            "128"
            --eval_interval           "5000"
            --roll
            --cuda
           )

PyTorch_transformerxllarge_FP16_PARAMS=(
            "examples/transformer-xl/pytorch"
            args
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "40"
            --batch_size              "64"
            --dataset                 "wt103" 
            --n_layer                 "18"
            --d_model                 "1024"
            --n_head                  "16"
            --d_head                  "64"
            --d_inner                 "4096"
            --dropout                 "0.2"
            --dropatt                 "0.2"
            --optim                   "adam"
            --lr                      "0.0"
            --warmup_step             "16000"
            --tgt_len                 "256"
            --mem_len                 "256"
            --eval_tgt_len            "128"
            --eval_interval           "5000"
            --cuda
            --fp16
           )

PyTorch_tacotron2_FP32_PARAMS=(
            "examples/tacotron2"
            args
            --model-name              "Tacotron2"
            --output        "./" 
            --learning-rate           "0.0" 
            --epochs                  "1" 
            --batch-size              "136" 
            --weight-decay            "1e-6" 
            --grad-clip-thresh        "1.0"
            --log-file                "nvlog.json"
            --training-files          "filelists/ljs_audio_text_train_subset_625_filelist.txt"
            --dataset-path            "/data/tacotron2/LJSpeech-1.1"
            --cudnn-enabled
           )

PyTorch_tacotron2_FP16_PARAMS=(
            "examples/tacotron2"
            args
            --model-name              "Tacotron2"
            --output        "./" 
            --learning-rate           "0.0" 
            --epochs                  "1" 
            --batch-size              "148" 
            --weight-decay            "1e-6" 
            --grad-clip-thresh        "1.0"
            --log-file                "nvlog.json"
            --training-files          "filelists/ljs_audio_text_train_subset_1250_filelist.txt"
            --dataset-path            "/data/tacotron2/LJSpeech-1.1"
            --cudnn-enabled
            --amp-run
           )


PyTorch_waveglow_FP32_PARAMS=(
            "examples/tacotron2"
            args      
            -o        "./"
            --model-name              "WaveGlow"
	    --learning-rate           "0.0" 
            --epochs                  "1" 
            --segment-length          "8000"
            --batch-size              "26" 
            --weight-decay            "0" 
            --grad-clip-thresh        "65504"
            --log-file                "nvlog.json"
            --training-files          "filelists/ljs_audio_text_train_subset_625_filelist.txt"
            --dataset-path            "/data/tacotron2/LJSpeech-1.1"
            --cudnn-enabled
            --cudnn-benchmark
           )

PyTorch_waveglow_FP16_PARAMS=(
            "examples/tacotron2"
            args      
	    -o        "./"
            --model-name              "WaveGlow"
            --learning-rate           "0.0" 
            --epochs                  "1" 
            --segment-length          "8000"
            --batch-size              "32" 
            --weight-decay            "0" 
            --grad-clip-thresh        "65504"
            --log-file                "nvlog.json"
            --training-files          "filelists/ljs_audio_text_train_subset_625_filelist.txt"
            --dataset-path            "/data/tacotron2/LJSpeech-1.1"
            --cudnn-enabled
            --cudnn-benchmark
            --amp-run            
           )

PyTorch_bert_base_squad_FP32_PARAMS=(
            "examples/bert"
            args
            "/data/bert_base/bert_base_uncased.pt"
            "2.0"
            "56"
            "0.0"
            "fp32"
            "${NUM_GPU}"
            "1"
            "/data/squad/v1.1"
            "/data/bert_base/bert-base-uncased-vocab.txt"
            "/results"
            "train"
            "/data/bert_base/bert_config.json"
            "100"
)

PyTorch_bert_base_squad_FP16_PARAMS=(
            "examples/bert"
            args      
            "/data/bert_base/bert_base_uncased.pt"
            "2.0"
            "108"
            "0.0"
            "fp16"
            "${NUM_GPU}"
            "1"
            "/data/squad/v1.1"
            "/data/bert_base/bert-base-uncased-vocab.txt"
            "."
            "train"
            "/data/bert_base/bert_config.json"
            "100"
)

PyTorch_bert_large_squad_FP32_PARAMS=(
            "examples/bert"
            args      
            "/data/bert_large/bert_large_uncased.pt"
            "2.0"
            "18"
            "0.0"
            "fp32"
            "${NUM_GPU}"
            "1"
            "/data/squad/v1.1"
            "/data/bert_large/bert-large-uncased-vocab.txt"
            "."
            "train"
            "/data/bert_large/bert_config.json"
            "100"
)

PyTorch_bert_large_squad_FP16_PARAMS=(
            "examples/bert"
            args      
            "/data/bert_large/bert_large_uncased.pt"
            "2.0"
            "36"
            "0.0"
            "fp16"
            "${NUM_GPU}"
            "1"
            "/data/squad/v1.1"
            "/data/bert_large/bert-large-uncased-vocab.txt"
            "."
            "train"
            "/data/bert_large/bert_config.json"
            "100"
)
