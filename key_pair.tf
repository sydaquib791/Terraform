resource "aws_key_pair" "student_key" {
  key_name   = "student_key"
  public_key = var.ssh_public_key
}
