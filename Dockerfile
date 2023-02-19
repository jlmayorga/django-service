FROM registry.access.redhat.com/ubi8/python-39:1-97

USER root
RUN dnf -y update-minimal --security --sec-severity=Important --sec-severity=Critical && \
    dnf clean all

user default

WORKDIR /usr/src/app
COPY --chown=1001:0 requirements.txt ./
RUN pip install -r requirements.txt
COPY --chown=1001:0 . .

#RUN chown -R 1001:0 /usr/src/app && \
#    chmod -R g=u /usr/src/app


#USER 1001

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]