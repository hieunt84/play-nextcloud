### Ref
    https://github.com/hieunt84/play-docker.git

### Deploy
    # Tạo volume cho portainer
      docker volume create portainer_data

    # Tạo portainer container
      docker run -d -p 9000:9000 --name=portainer --restart=always \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v portainer_data:/data \
        portainer/portainer   