[
  {
    "name": "task",
    "image": "${container_image}",
    "cpu": 0,
    "memory": 300,
    "essential": true,
    "portMappings": [],
    "workingDirectory": "/var/opt/app",
    "entryPoint": [
      "./entrypoint.sh"
    ],
    "command": [
      "echo",
      "task"
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
        "awslogs-stream-prefix": "task"
      }
    },
    "volumesFrom": []
  }
]
