FROM python:3.6-slim

# install git
RUN apt-get update && apt-get install -y git

# clone project and install python dependencies
RUN git clone https://github.com/heartexlabs/label-studio && \
    cd label-studio && \
    pip install -e . && \
    cd label_studio/ml/examples && \
    pip install -r requirements.txt && \
    cd ../../../ && \
    label-studio-ml init text-sentiment --script label_studio/ml/examples/simple_text_classifier.py

# run ml backend on 9090
CMD cd label-studio && label-studio-ml start text-sentiment
