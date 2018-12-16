[
  {
    "name": "${container_name}",
    "image": "${container_image}",
    "cpu": 333,
    "memory": 400,
    "essential": true,
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": ${container_port}
      }
    ],
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
        "awslogs-stream-prefix": "rails"
      }
    },
    "volumesFrom": []
  }
]
