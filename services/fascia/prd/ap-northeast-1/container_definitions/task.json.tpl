[
  {
    "name": "task",
    "image": "${container_image}",
    "cpu": 0,
    "memory": 200,
    "essential": true,
    "portMappings": [],
    "workingDirectory": "/go/src/github.com/h3poteto/fascia",
    "entryPoint": [
      "./entrypoint.sh"
    ],
    "command": [
      "bin/fascia",
      "server"
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
