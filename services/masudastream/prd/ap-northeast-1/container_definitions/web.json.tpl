[
  {
    "name": "${container_name}",
    "image": "${container_image}",
    "cpu": 0,
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
      "uwsgi",
      "--ini",
      "uwsgi_prod.ini"
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
        "awslogs-stream-prefix": "uwsgi"
      }
    },
    "volumesFrom": []
  }
]
