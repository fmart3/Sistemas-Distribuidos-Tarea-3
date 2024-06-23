# Tarea 3 Sistemas Distribuidos: Hive and Pig: Big Data

Integrantes: Felipe Martínez y Nicolás Ojeda

Contenedor Docker ocupado: https://github.com/suhothayan/hadoop-spark-pig-hive


## Instrucciones

## 1. Pull del contenedor
```bash
docker pull suhothayan/hadoop-spark-pig-hive:2.9.2
```

## 2. Empezar un contenedor con la imagen Docker
```bash
sudo docker run -it -p 50070:50070 -p 8088:8088 -p 8080:8080 suhothayan/hadoop-spark-pig-hive:2.9.2 bash
```

## 3. Ver ID del contenedor
```bash
docker ps -a
```

## 4. Copiar CSV hacia contenedor
```bash
sudo docker cp /home/felipe/Desktop/branch_traces.csv 1c42e52153cb:/root/
```

## 5. Entrar al contenedor
```bash
sudo docker exec -it 1c42e52153cb /bin/bash
```

## 6. Reiniciar servicios Metastore
```bash
service hadoop-yarn-resourcemanager restart
service hadoop-hdfs-namenode restart
service hive-metastore restart
```

## 7. Pasar el CSV del contenedor hacia HDFS
```bash
hdfs dfs -mkdir -p /user/root/
hdfs dfs -put /root/branch_traces.csv /user/root/
```

## 8. Ocupar Hive
```bash
hive
```

### Crear Tabla y Cargar Datos
```sql
CREATE TABLE IF NOT EXISTS branches (
    branch_addr STRING,
    branch_type STRING,
    taken INT,
    target STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/root/branch_traces.csv' INTO TABLE branches;
```

### Consultas en Hive

1. Contar registros
```sql
SELECT COUNT(*) AS records_count FROM branches;
```

2. Contar frecuencia de cada tipo de branch
```sql
SELECT branch_type, COUNT(*) AS count
FROM branches
GROUP BY branch_type;
```

3. Analizar la relación entre los tipos de branch y el valor de "taken"
```sql
SELECT branch_type, taken, 
COUNT(*) AS count FROM branches 
GROUP BY branch_type, taken;
```

4. Calcular la proporción de registros con "taken" igual a 1 para cada tipo de branch
```sql
SELECT branch_type, 
SUM(CASE WHEN taken = 1 THEN 1 ELSE 0 END) / COUNT(*) AS proportion_taken_1 
FROM branches 
GROUP BY branch_type;
```

## 9. Ocupar Pig
```bash
pig
```

### Crear tabla y cargar datos
```pig
branch_traces = LOAD '/user/root/input/branch_traces.csv' USING PigStorage(',')
 AS (
    branch_addr:chararray, 
    branch_type:chararray, 
    taken:int, 
    target:chararray
);
```

### Consultas en Pig

1. Agrupar todos los registros y contar el total
```pig
grouped_data = GROUP branch_traces ALL;

records_count = FOREACH grouped_data GENERATE COUNT(branch_traces);

DUMP records_count;
```

2. Agrupar por tipo de branch y contar frecuencia
```pig
branch_type_counts = FOREACH (GROUP branch_traces BY branch_type) 
                     GENERATE group AS branch_type, COUNT(branch_traces) AS count;

DUMP branch_type_counts;
```
