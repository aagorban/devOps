resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

resource "aws_route_table_association" "prt" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public.id
}

resource "aws_security_group" "allow_all" {
  description = "Allow all traffic"
  vpc_id      = aws_vpc.my_vpc.id
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "APP"
    from_port   = 5173
    to_port     = 5173
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Api"
    from_port   = 8001
    to_port     = 8001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "PgAdmin"
    from_port   = 5050
    to_port     = 5050
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Дозволити доступ з будь-якої IP-адреси (налаштовуй за потребою)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_all.id]
  key_name        = var.key_name
  tags = {
    name = "app"
  }
}

# resource "aws_db_instance" "example" {
#   identifier           = "my-postgres-db"  # Унікальний ідентифікатор бази даних
#   engine               = "postgres"
#   engine_version       = "13.4"            # Версія PostgreSQL
#   instance_class       = "db.t3.micro"     # Тип інстансу
#   allocated_storage    = 20                # Обсяг диска (GB)
#   storage_type         = "gp2"             # Тип сховища
#   username             = "myuser"          # Логін адміністратора
#   password             = "mypassword"      # Пароль адміністратора
#   parameter_group_name = "default.postgres13.4"
#   skip_final_snapshot  = true              # Пропустити фінальний снапшот при видаленні
#   publicly_accessible  = false             # Обмежити доступ до бази з інтернету
#   vpc_security_group_ids = [aws_security_group.allow_all.id]  # Додати Security Group
# }

# resource "aws_security_group" "rds_sg" {
#   name_prefix = "rds-sg-"
#
#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  # Дозволити доступ з будь-якої IP-адреси (налаштовуй за потребою)
#   }
#
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }