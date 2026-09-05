FROM python:3.13-slim       #(Python तयार असलेली lightweight Linux base image वापरतो.)
WORKDIR /app   #(Container मध्ये /app नावाचे working directory सेट करतो.)
COPY app.py .    #(आपली local app.py container मध्ये copy करतो.)
CMD ["python", "app.py"]   #(Container start झाल्यावर Python application automatically run होते.)
