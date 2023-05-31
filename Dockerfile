FROM python

WORKDIR /src/app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 6969
CMD ["python", "run.py"]
