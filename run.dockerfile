FROM hieupth/blueforest:env

COPY resources resources
COPY warmup.py warmup.py

SHELL ["/bin/bash", "-c"]
RUN apt-get update -y && \
    apt-get install -y git wget && \
    cd resources && wget https://huggingface.co/hieupth/blueforest/resolve/main/facedet.onnx
RUN ls -la resources && \
    source /venv/bin/activate && \
    pip install git+https://github.com/hieupth/blueforest && \
    python warmup.py
ENTRYPOINT source /venv/bin/activate && uvicorn blueforest.api:app --host 0.0.0.0 --port 8080