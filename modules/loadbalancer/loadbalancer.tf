# Módulo de Load Balancer
resource "aws_lb" "eks_nlb" {
  name                       = var.name
  internal                   = var.internal                             # true si es privado
  load_balancer_type         = "network"                                # Puede ser "application" para ALB
  security_groups            = aws_security_group.eks_security_group.id #var.security_groups
  subnets                    = aws_subnet.main.id                       #var.subnets
  enable_deletion_protection = false

  tags = var.lb_tags
}

# Listener del Load Balancer para el puerto 9443
resource "aws_lb_listener" "listener_9443" {
  load_balancer_arn = aws_lb.eks_nlb.arn
  port              = 9443
  protocol          = "TCP"

  default_action {
    type = "fixed-response"
    fixed_response {
      status_code  = 200
      content_type = "text/plain" # Especificamos el tipo de contenido
      message_body = "OK"         # El cuerpo del mensaje de respuesta
    }
  }
}


# Listener para el puerto 443 internamente
resource "aws_lb_listener" "listener_443" {
  load_balancer_arn = aws_lb.eks_nlb.arn
  port              = 443
  protocol          = "TCP"

  default_action {
    type = "fixed-response"
    fixed_response {
      status_code  = 200
      content_type = "text/plain" # Especificamos el tipo de contenido
      message_body = "OK"         # El cuerpo del mensaje de respuesta
    }
  }
}

