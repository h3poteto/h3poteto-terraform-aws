[
  {
    "name": "task",
    "image": "${container_image}",
    "cpu": 0,
    "memory": 300,
    "essential": true,
    "portMappings": [],
    "workingDirectory": "/usr/src/app",
    "entryPoint": [
      "./entrypoint.sh"
    ],
    "command": [
      "bundle",
      "exec",
      "puma",
      "-C",
      "config/puma.rb"
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
