FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl gnupg apt-transport-https lsb-release

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && \
    chmod 644 /usr/share/keyrings/wazuh.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list && \
    apt-get update && \
    apt-get install -y wazuh-agent=4.9.2-1

COPY ossec.conf /var/ossec/etc/ossec.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
