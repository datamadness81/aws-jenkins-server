# IMPLEMENTAR SERVIDOR JENKINS EN UNA INSTANCIA EC2 EN AWS

![head-image](images/jenkins-lab-banner.png)

### Descripción del laboratorio

<p style="text-align:justify">
Implementar en una instancia EC2 de AWS con sistema operativo Ubuntu, un servidor Jenkins que cuente con las herramientas necesarias para la automatización de infraestructuras cloud por medio de un pipeline Jenkins.
Cabe acotar que la propia implementación del servidor debe estar automatizada y correrá desde nuestro equipo local.

El laboratorio esta propuesto para que pueda ser implementado con la capa gratuita de AWS, es decir, no generaria un costo siempre y cuando se cuente con disponibilidad en los servicios a utilizar.
</p><br>

### Objetivos del laboratorio

* Configurar un jenkinsfile con el pipeline de implementacion del servidor en AWS.
* Crear un modulo en Terraform para construir la infraestructura y la instacia en  AWS.
* Configurar a traves de un playbook de Ansible, las diferentes herramientas de automatizacion necesarias para un pipeline DevOps en la instancia AWS.
* Configurar un agente en el controller de Jenkins (el jenkins instalado en la maquina local) para que acceda a la instancia AWS y pueda ejecutar pipelines con Jenkins.<br><br>

### Herramientas a utilizar

<p style="text-align:justify">
Para la realizacion del laboratorio debemos tener disponibles las siguientes herramientas en nuestro equipo:
</p>

* Jenkins.
* GIT.
* Terraform.
* Ansible.
* Cuenta AWS (capa gratuita).<br><br>

## Diagrama del Pipeline<br><br>

![pipeline-image](images/pipeline-diagram.png)
<br><br>

## Diagrama del Jenkins Server<br><br>

![server-image](images/server-diagram.png)
<br><br>