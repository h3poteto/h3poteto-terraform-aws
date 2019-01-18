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
      },
      {
        "containerPort": 4369,
        "hostPort": 0,
        "protocol": "tcp"
      },
      {
        "containerPort": 4369,
        "hostPort": 0,
        "protocol": "udp"
      },
      {
        "containerPort": 4370,
        "hostPort": 0,
        "protocol": "tcp"
      },
      {
        "containerPort": 4370,
        "hostPort": 0,
        "protocol": "udp"
      }
    ],
    "workingDirectory": "/var/opt/app",
    "entryPoint": null,
    "command": null,
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
