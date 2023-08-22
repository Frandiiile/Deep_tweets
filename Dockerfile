FROM python:3.11

WORKDIR /deeptweets

COPY ./requirements.txt /deeptweets/requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY deep_tweets_classification.ipynb /deeptweets/notebook.ipynb

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
