[
  {
    "name": "${container_name}",
    "image": "${container_image}",
    "cpu": 333,
    "memory": 300,
    "essential": true,
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": ${container_port}
      }
    ],
    "workingDirectory": "/var/opt/app",
    "entryPoint": [
      "./entrypoint.sh"
    ],
    "command": [
      "./rel/seiyu_watch/bin/seiyu_watch",
      "foreground"
    ],
    "environment": [
      {
        "name": "SERVICE_ENV",
        "value": "${env}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${service}/${role}/${env}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "phoenix"
      }
    },
    "volumesFrom": []
  }
]
