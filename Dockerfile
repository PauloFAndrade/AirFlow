FROM apache/airflow:2.9.1

USER root

# Instalar Git
RUN apt-get update && apt-get install -y git

# Configurar o ambiente de Airflow
ENV AIRFLOW_HOME=/opt/airflow

# Clonar o repositório
RUN git clone https://github.com/PauloFAndrade/AirFlow.git $AIRFLOW_HOME/dags

#RUN git config --global --add safe.directory /opt/airflow/dags

# Configurar o entrypoint para atualizar o repositório ao iniciar
#ENTRYPOINT ["sh", "-c", "if [ -d \"$AIRFLOW_HOME/dags/.git\" ]; then cd \"$AIRFLOW_HOME/dags\" && git pull origin main; else echo 'Repositório Git não encontrado'; fi && airflow webserver"]