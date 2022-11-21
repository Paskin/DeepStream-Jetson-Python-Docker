FROM nvcr.io/nvidia/deepstream-l4t:6.1.1-samples


RUN apt-get update
RUN apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer-1.0 python-gi-dev libcairo2-dev python3-dev 
RUN apt install --reinstall libavcodec58 libavutil56

WORKDIR /opt/nvidia/deepstream/deepstream-6.1/sources/
RUN git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps.git
WORKDIR /opt/nvidia/deepstream/deepstream-6.1/sources/deepstream_python_apps/apps/deepstream-test3/

RUN ln -s /usr/local/bin/pip /usr/bin/pip && ln -s /usr/bin/pip /usr/bin/pip3
RUN pip install https://github.com/NVIDIA-AI-IOT/deepstream_python_apps/releases/download/v1.1.4/pyds-1.1.4-py3-none-linux_aarch64.whl

ENV LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libGLdispatch.so.0:$LD_PRELOAD 
CMD python3 deepstream_test_3.py -i file:///opt/nvidia/deepstream/deepstream-6.1/samples/streams/sample_1080p_h264.mp4

