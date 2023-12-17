FROM eclipse-temurin:8-jre


MAINTAINER "DeaSTL (https://github.com/DeaSTL)"

VOLUME ["/minecraft"]


# Install dependencies
RUN apt-get update && \
  apt-get install apt-utils --yes && \
  apt-get upgrade --yes --allow-remove-essential && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


# Create the new minecraft user
RUN useradd -m -U minecraft

# Work dir to minecraft
WORKDIR /home/minecraft


# Writes the start script
COPY start.sh /home/minecraft/start.sh

RUN chmod +x /home/minecraft/start.sh


# Switch to the minecraft user
USER minecraft

RUN pwd
RUN ls -la

# Downloads the minecraft server installer
RUN curl https://api.modpacks.ch/public/modpack/35/2129/server/linux -o serverinstall_35_2129
RUN ls -la
RUN chmod +x serverinstall_*
RUN ./serverinstall_*
RUN rm serverinstall_*


RUN echo "eula=true" > eula.txt







# Expose minecraft port
EXPOSE ${PORT}



# Start the minecraft server
ENTRYPOINT /home/minecraft/start.sh




