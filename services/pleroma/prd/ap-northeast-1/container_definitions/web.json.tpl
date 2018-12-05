[
  {
    "name": "phoenix",
    "image": "${phoenix_container_image}",
    "cpu": 0,
    "memory": null,
    "memoryReservation": 200,
    "essential": true,
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
    }
  },
  {
    "name": "${container_name}",
    "image": "${container_image}",
    "cpu": 0,
    "memory": null,
    "memoryReservation": 50,
    "essential": true,
    "entryPoint": null,
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": ${container_port}
      }
    ],
    "command": null,
    "environment": [],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${service}/${role}/${env}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "nginx"
      }
    },
    "links": [
      "phoenix:phoenix"
    ]
  }
]
