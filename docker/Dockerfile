# Dockerfile
FROM python:3.13-bookworm

ENV PYTHONUNBUFFERED=1
# If MODEL_DIR is set at runtime, we'll auto-run that app. Otherwise we drop to a shell.
ENV MODEL_DIR=""
ENV PORT=8765
ENV HOST=0.0.0.0

WORKDIR /opt

# tools to clone
RUN apt-get update && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/*

# sources
RUN git clone https://github.com/projectmesa/mesa.git mesa-main \
 && git clone https://github.com/projectmesa/mesa-examples.git mesa-examples

# install mesa + solara
RUN python -m pip install --upgrade pip \
 && pip install -e mesa-main[rec] \
 && pip install --no-cache-dir solara

# Expose Solara’s default port
EXPOSE 8765

# If MODEL_DIR is provided, run that app. Otherwise, give you a shell.
# No extra scripts; just standard bash.
CMD ["/bin/bash", "-lc", "if [ -n \"$MODEL_DIR\" ]; then cd \"$MODEL_DIR\" && python -m solara run app.py --host=$HOST --port=$PORT; else exec bash; fi"]
