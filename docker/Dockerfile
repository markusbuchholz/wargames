# Dockerfile

FROM python:3.13-bookworm

LABEL maintainer="projectmesa maintainers@projectmesa.dev"

ENV PYTHONUNBUFFERED=1
ENV MODEL_DIR=/opt/mesa-main/mesa/examples/basic/schelling

WORKDIR /opt


RUN git clone https://github.com/projectmesa/mesa.git mesa-main \
 && git clone https://github.com/projectmesa/mesa-examples.git mesa-examples \
 && pip install -e mesa-main[rec]

# Expose Solara’s default port
EXPOSE 8765

# Run the Solara app in the chosen MODEL_DIR
CMD ["sh", "-c", "cd \"$MODEL_DIR\" && solara run app.py --host=0.0.0.0"]
