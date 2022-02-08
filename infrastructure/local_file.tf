resource "local_file" "foo" {
    content     = "foo!"
    filename = "${path.module}/${var.resource_prefix}/foo.bar"
}