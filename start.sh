
#!/bin/bash

# -XX:+UseConcMarkSweepGC is a concurrent garbage collector to help utilize multiple cores
# -XX:+UseParNewGC is a parallel garbage collector for new generation
# -XX:+CMSIncrementalPacing helps reduce pauses
# -XX:ParallelGCThreads=7 sets the number of threads to use
# -XX:+AggressiveOpts enables the use of aggressive performance optimization features
# -Xms${MIN_MEMORY} sets the minimum memory allocation
# -Xmx${MAX_MEMORY} sets the maximum memory allocation
# -jar server.jar nogui starts the server with the nogui option


# Start minecraft server
java -Xms${MIN_MEMORY} -Xmx${MAX_MEMORY} -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=7 -XX:+AggressiveOpts -jar forge-1.12.2-14.23.5.2858.jar nogui
