FROM pedregalteam/pyrfc_1.9.5

WORKDIR /app/
COPY ./app /app/
COPY ./requirements.txt /app/

RUN pip install -r requirements.txt
CMD python manage.py collectstatic --no-input;python manage.py migrate; gunicorn app.wsgi -b 0.0.0.0:8000