FROM python:3.11

RUN python -m nltk.downloader wordnet stopwords punkt

WORKDIR /deeptweets

COPY ./requirements.txt /deeptweets/requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY deep_tweets_classification.ipynb /deeptweets/notebook.ipynb

# Set NLTK data path for the Docker container
RUN echo "import nltk\nnltk.data.path.append('/usr/local/lib/python3.11/site-packages/nltk_data')" >> /deeptweets/nltk_setup.py
RUN python /deeptweets/nltk_setup.py

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
