FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python3.12 python3-pip python3.12-venv
RUN apt -y install python3-flask
COPY app.py /opt/
#ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
ENV FLASK_APP=/opt/app.py
EXPOSE 8085 
CMD ["flask", "run", "--host=0.0.0.0"]