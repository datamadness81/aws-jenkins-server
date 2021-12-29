FROM jenkins/jenkins:latest
WORKDIR /
USER root
EXPOSE 8080

# Install Python
RUN apt-get update -y && apt-get install --no-install-recommends -y\
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN python3 -m pip install ansible --upgrade \
    && pip3 install boto && pip3 install boto3 && pip3 install docker \
    && rm -rf /var/lib/apt/lists/*

# Install Docker
RUN curl -sL https://get.docker.com | sed 's/9)/10)/' | sh
# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose && chmod +x /usr/bin/docker-compose \
    && usermod -aG docker jenkins \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN apt-get update \
	&& apt-get install --no-install-recommends -y gnupg software-properties-common curl -y \
	&& curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
	&& apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
	&& apt-get update && apt-get install --no-install-recommends -y terraform \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf /var/lib/apt/lists/*
    
USER jenkins